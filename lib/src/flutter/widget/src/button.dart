import "package:flutter/material.dart";
import "package:quickly/quickly.dart";

/// A customizable button widget that follows a specific design style.
///
/// The [FxButton] widget provides various customization options such as text,
/// icons, colors, shapes, sizes, and more. It supports different button types
/// like solid, outline, outline2x, and transparent. The appearance and behavior
/// of the button can be modified using the provided properties.
class FxButton extends StatelessWidget {
  /// constructor
  const FxButton({
    required this.onPressed,
    super.key,
    this.text,
    this.icon,
    this.color = FxColor.primary,
    this.outlineColor = FxColor.primary,
    this.shape = BtnShape.rounded,
    this.size = BtnSize.normal,
    this.type = BtnType.solid,
    this.isBlock = false,
    this.prefixIcon,
    this.suffixIcon,
    this.padding,
    this.margin,
    this.radius,
    this.shadow,
    this.textColor,
    this.iconColor,
    this.isSplashColor = false,
    this.mainAxisAlignment,
    this.iconSize,
    this.textStyle,
  }) : assert(icon != null || text != null,
            'Either icon or text must be provided');

  /// The [text] parameter is required and specifies the button's label text.
  final String? text;

  /// The [onPressed] parameter is required and defines the callback function
  /// when the button is pressed.
  final VoidCallback onPressed;

  /// The [icon] parameter specifies the icon to be displayed in the center without text.
  final IconData? icon;

  /// The [prefixIcon] parameter specifies the icon to be displayed before the button text.
  final IconData? prefixIcon;

  /// The [suffixIcon] parameter specifies the icon to be displayed after the button text.
  final IconData? suffixIcon;

  /// The [padding]  parameters allow customization of the button's internal padding
  final EdgeInsetsGeometry? padding;

  /// The [margin] parameters allow customization of the button's external padding.
  final EdgeInsetsGeometry? margin;

  /// The [radius] parameter determines the button's border radius. If not
  /// provided, the default border radius will be based on the button's shape.
  final BorderRadius? radius;

  /// The [outlineColor] parameter sets the button's outline color for the
  /// outline button types.
  final Color? outlineColor;

  /// The [color] parameter sets the button's background color for the solid
  /// button type.
  final Color? color;

  /// The [textColor] parameter sets the text color for the solid button type.
  /// If not provided, the text color will be automatically determined based on
  /// the button's background color.
  final Color? textColor;

  /// The [iconColor] parameter sets the color for the prefix and suffix
  /// icons. If not provided, the icon color will be determined based on the
  /// button's background color.
  final Color? iconColor;

  /// The [shadow] parameter allows specifying a list of box shadows to create
  /// a shadow effect for the button.
  final List<BoxShadow>? shadow;

  /// The [shape] parameter specifies the button's shape, which can be one of
  /// the values in the [BtnShape] enum.
  final BtnShape shape;

  /// The [size] parameter determines the button's size, which can be one of
  /// the values in the [BtnSize] enum.
  final BtnSize size;

  /// The [iconSize] parameter determines the icons's size, which can be one of
  final double? iconSize;

  /// The [type] parameter defines the button's type, which can be one of the
  /// values in the [BtnType] enum.
  final BtnType type;

  /// The [isBlock] parameter indicates whether the button should occupy the
  /// full width available.
  final bool isBlock;

  /// Defines how the children should be placed along the main axis.
  final MainAxisAlignment? mainAxisAlignment;

  /// The style to use for the button's text.
  final TextStyle? textStyle;

  /// A boolean value indicating whether splash color is enabled for the button.
  final bool isSplashColor;

  @override
  Widget build(BuildContext context) {
    TextStyle baseTextStyle = TextStyle(
      color: type == BtnType.solid
          ? textColor ?? getTextColor(color ?? getBtnType())
          : color,
      fontWeight: FontWeight.w500,
      fontSize: getBtnSize(),
    );

    final Widget textWidget = text != null
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              text!,
              style: textStyle != null
                  ? baseTextStyle.merge(textStyle)
                  : baseTextStyle,
            ),
          )
        : const SizedBox.shrink();

    final Color? getIconColor = type == BtnType.solid
        ? iconColor ?? getTextColor(color ?? getBtnType())
        : color;

    Widget createIconWidget(IconData? icon, {String? type}) {
      return icon != null
          ? Icon(
              icon,
              color: getIconColor,
              size: iconSize != null
                  ? iconSize
                  : type == 'icon'
                      ? getBtnSize()
                      : (getBtnSize() + 8),
            ).px4
          : const SizedBox.shrink();
    }

    return InkWell(
      splashColor: isSplashColor
          ? type == BtnType.solid
              ? FxColor.dark
              : color!.withOpacity(.3)
          : FxColor.transparent,
      onTap: onPressed,
      child: Container(
        padding: padding ?? FxPadding.pxy(h: 8, v: 6),
        decoration: BoxDecoration(
          borderRadius: radius ?? getBtnShape(),
          color: type == BtnType.solid ? color : getBtnType(),
          boxShadow: shadow ?? FxShadow.none,
          border: getButtonBorder(),
        ),
        child: Row(
          mainAxisSize: isBlock ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
          children: icon != null
              ? <Widget>[createIconWidget(icon).px4]
              : <Widget>[
                  createIconWidget(prefixIcon),
                  textWidget,
                  createIconWidget(suffixIcon),
                ],
        ),
      ),
    );
  }

  /// A mapping of button shapes to corresponding border radii.
  static final Map<BtnShape, BorderRadius> _borderRadiusByShape =
      <BtnShape, BorderRadius>{
    BtnShape.pill: FxRadius.r30,
    BtnShape.rounded: FxRadius.r5,
    BtnShape.rleft: FxRadius.left(30),
    BtnShape.rright: FxRadius.right(30),
    BtnShape.leaf: FxRadius.only(bottomLeft: 30, topRight: 30),
  };

  /// Returns the border radius for the button based on its shape.
  BorderRadius getBtnShape() => _borderRadiusByShape[shape] ?? FxRadius.none;

  /// A mapping of button sizes to corresponding size factors.
  static final Map<BtnSize, double> _sizeFactorBySize = <BtnSize, double>{
    BtnSize.tiny: 12,
    BtnSize.small: 14,
    BtnSize.medium: 18,
    BtnSize.large: 20,
  };

  /// Returns the size factor for the button based on its size.
  double getBtnSize() => _sizeFactorBySize[size] ?? 16;

  /// Returns the text color for the button based on the background color.
  /// If the background color is transparent, returns [FxColor.gray700].
  /// Otherwise, returns [FxColor.gray700] for light background colors
  /// and [Colors.white] for dark background colors.
  Color getTextColor(Color color) => color == Colors.transparent
      ? FxColor.gray700
      : color.computeLuminance() > 0.5
          ? FxColor.gray700
          : Colors.white;

  /// Returns the button color based on its type.
  /// If the type is [BtnType.outline], [BtnType.outline2x], or [BtnType.transparent],
  /// returns [Colors.transparent]. Otherwise, returns [FxColor.primary].
  Color getBtnType() {
    if (BtnType.outline == type ||
        BtnType.outline2x == type ||
        BtnType.transparent == type) {
      return Colors.transparent;
    }
    return FxColor.primary;
  }

  /// Returns the appropriate border for the button based on its type.
  ///
  /// If [type] is [BtnType.outline], returns a border with the specified [outlineColor] or defaults to [FxColor.gray200]
  /// with a width of 2.
  ///
  /// If [type] is [BtnType.outline2x], returns a border with the specified [outlineColor] or defaults to [FxColor.gray200]
  /// with a width of 3.
  ///
  /// If [type] is neither [BtnType.outline] nor [BtnType.outline2x], returns a border with no style.
  Border getButtonBorder() {
    return Border.all(
      color: outlineColor ?? color ?? FxColor.gray200,
      width: type == BtnType.outline2x ? 2 : 1,
    );
  }
}

/// Defines the possible shapes for the [FxButton].
///
/// The [pill] shape creates a pill-shaped button with rounded edges.
/// The [flat] shape represents a flat button with no specific shape.
/// The [rounded] shape creates a button with rounded corners.
/// The [leaf] shape creates a button with one rounded corner on the top-right
/// and one rounded corner on the bottom-left, giving it a leaf-like appearance.
/// The [rleft] shape creates a button with a rounded corner on the left side.
/// The [rright] shape creates a button with a rounded corner on the right side.
enum BtnShape { pill, flat, rounded, leaf, rleft, rright }

/// Defines the possible types for the [FxButton].
///
/// The [solid] type represents a button with a solid background color.
/// The [outline] type represents a button with an outline border and no fill.
/// The [outline2x] type represents a button with a thicker outline border and no fill.
/// The [transparent] type represents a button with a transparent background.
enum BtnType { solid, outline, outline2x, transparent }

/// Defines the possible sizes for the [FxButton].
///
/// The [tiny] size represents the smallest size for the button.
/// The [small] size represents a small-sized button.
/// The [normal] size represents a regular-sized button.
/// The [medium] size represents a medium-sized button.
/// The [large] size represents the large size for the button.
enum BtnSize { tiny, small, normal, medium, large }
