import 'package:flutter/material.dart';

import '../../../quickly.dart';

/// A customizable button widget that follows a specific design style.
///
/// The [FxButton] widget provides various customization options such as text,
/// icons, colors, shapes, sizes, and more. It supports different button types
/// like solid, outline, outline2x, and transparent. The appearance and behavior
/// of the button can be modified using the provided properties.
class FxButton extends StatelessWidget {
  const FxButton({
    required this.text,
    required this.onPressed,
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
    this.mainAxisAlignment,
    this.prefixIconSize,
    this.suffixIconSize,
    Key? key,
  }) : super(key: key);

  /// The [text] parameter is required and specifies the button's label text.
  final String text;

  /// The [onPressed] parameter is required and defines the callback function
  /// when the button is pressed.
  final VoidCallback onPressed;

  /// The [prefixIcon] and [suffixIcon] parameters specify the icons to be
  /// displayed before and after the button text, respectively.
  final IconData? prefixIcon;

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
  final Color outlineColor;

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

  /// The [prefixIconSize] parameter determines the prefix icons's size, which can be one of
  final double? prefixIconSize;

  /// The [suffixIconSize] parameter determines the suffix icon's size, which can be one of
  final double? suffixIconSize;

  /// The [type] parameter defines the button's type, which can be one of the
  /// values in the [BtnType] enum.
  final BtnType type;

  /// The [isBlock] parameter indicates whether the button should occupy the
  /// full width available.
  final bool isBlock;

  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final Widget textWidget = Text(
      text,
      style: TextStyle(
        color: type == BtnType.solid
            ? textColor ?? getTextColor(color ?? getBtnType())
            : color,
      ),
      textScaleFactor: getBtnSize() * .7,
    ).px4;

    final Color? iconColor = type == BtnType.solid
        ? getTextColor(this.iconColor ?? getBtnType())
        : color;

    final Widget prefixIconWidget = prefixIcon != null
        ? Icon(
            prefixIcon,
            color: iconColor,
            size: prefixIconSize ?? getBtnSize() * 15,
          )
        : const SizedBox.shrink();

    final Widget suffixIconWidget = suffixIcon != null
        ? Icon(
            suffixIcon,
            color: iconColor,
            size: suffixIconSize ?? getBtnSize() * 15,
          )
        : const SizedBox.shrink();

    return InkWell(
      splashColor:
          type == BtnType.solid ? FxColor.dark : color!.withOpacity(.3),
      onTap: onPressed,
      child: Container(
        padding: padding ?? FxPadding.pxy(h: 16, v: 7),
        decoration: BoxDecoration(
          borderRadius: radius ?? getBtnShape(),
          color: type == BtnType.solid ? color : getBtnType(),
          boxShadow: shadow ?? FxShadow.none,
          border: getButtonBorder(),
        ),
        child: Row(
          mainAxisSize: isBlock ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
          children: <Widget>[
            prefixIconWidget,
            textWidget.px4,
            suffixIconWidget,
          ],
        ),
      ),
    );
  }

  static final Map<BtnShape, BorderRadius> _borderRadiusByShape =
      <BtnShape, BorderRadius>{
    BtnShape.pill: FxRadius.r30,
    BtnShape.rounded: FxRadius.r5,
    BtnShape.rleft: FxRadius.left(30),
    BtnShape.rright: FxRadius.right(30),
    BtnShape.leaf: FxRadius.only(bottomLeft: 30, topRight: 30),
  };

  BorderRadius getBtnShape() {
    return _borderRadiusByShape[shape] ?? FxRadius.none;
  }

  static final Map<BtnSize, double> _sizeFactorBySize = <BtnSize, double>{
    BtnSize.tiny: 0.7,
    BtnSize.small: 1.0,
    BtnSize.medium: 1.5,
    BtnSize.large: 1.8,
  };

  double getBtnSize() {
    return _sizeFactorBySize[size] ?? 1.3;
  }

  Color getTextColor(Color color) => color == Colors.transparent
      ? FxColor.gray700
      : color.computeLuminance() > 0.5
          ? FxColor.gray700
          : Colors.white;

  Color getBtnType() {
    if (BtnType.outline == type ||
        BtnType.outline2x == type ||
        BtnType.transparent == type) {
      return Colors.transparent;
    }
    return FxColor.primary;
  }

  Border getButtonBorder() {
    if (BtnType.outline == type) {
      return Border.all(color: color ?? outlineColor, width: 2);
    }
    if (BtnType.outline2x == type) {
      return Border.all(color: color ?? outlineColor, width: 3);
    }

    return Border.all(style: BorderStyle.none);
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
/// The [normal] size represents a medium-sized button.
/// The [medium] size represents a large-sized button.
/// The [large] size represents the largest size for the button.
enum BtnSize { tiny, small, normal, medium, large }
