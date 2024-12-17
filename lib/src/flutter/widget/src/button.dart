import "package:flutter/material.dart";

/// A customizable button widget that follows a specific design style.
class FxButton extends StatelessWidget {
  /// constructor
  const FxButton({
    required this.onPressed,
    super.key,
    this.text,
    this.icon,
    this.color = Colors.blue,
    this.outlineColor,
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
    this.child,
  }) : assert(icon != null || text != null || child != null,
            'Either icon, text, or child must be provided');

  final String? text;
  final VoidCallback onPressed;
  final IconData? icon;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? radius;
  final Color? outlineColor;
  final Color color;
  final Color? textColor;
  final Color? iconColor;
  final List<BoxShadow>? shadow;
  final BtnShape shape;
  final BtnSize size;
  final double? iconSize;
  final BtnType type;
  final bool isBlock;
  final MainAxisAlignment? mainAxisAlignment;
  final TextStyle? textStyle;
  final bool isSplashColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final Widget textWidget = text != null
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              text!,
              style: textStyle ??
                  TextStyle(
                    color: textColor ??
                        (type == BtnType.solid ? Colors.white : color),
                    fontWeight: FontWeight.w500,
                    fontSize: getBtnSize(),
                  ),
            ),
          )
        : const SizedBox.shrink();

    final Color? getIconColor =
        iconColor ?? (type == BtnType.solid ? Colors.white : color);

    Widget createIconWidget(IconData? icon) {
      return icon != null
          ? Icon(
              icon,
              color: getIconColor,
              size: iconSize ?? getBtnSize(),
            )
          : const SizedBox.shrink();
    }

    final Widget buttonContent = child ??
        Row(
          mainAxisSize: isBlock ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
          children: [
            createIconWidget(prefixIcon),
            textWidget,
            createIconWidget(suffixIcon),
          ],
        );

    // Use Material 3 button types
    switch (type) {
      case BtnType.solid:
        return ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(color),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
              borderRadius: radius ?? getBtnShape(),
            )),
            padding: WidgetStateProperty.all(
                padding ?? EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
            shadowColor: WidgetStateProperty.all(
                shadow?.isEmpty ?? true ? null : shadow?.first.color),
          ),
          child: buttonContent,
        );
      case BtnType.outline:
        return OutlinedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            side: WidgetStateProperty.all(
                BorderSide(color: outlineColor ?? color)),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
              borderRadius: radius ?? getBtnShape(),
            )),
            padding: WidgetStateProperty.all(
                padding ?? EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
          ),
          child: buttonContent,
        );
      case BtnType.outline2x:
        return OutlinedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            side: WidgetStateProperty.all(
                BorderSide(color: outlineColor ?? color, width: 2)),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
              borderRadius: radius ?? getBtnShape(),
            )),
            padding: WidgetStateProperty.all(
                padding ?? EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
          ),
          child: buttonContent,
        );
      case BtnType.transparent:
        return TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all(color),
            padding: WidgetStateProperty.all(
                padding ?? EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
          ),
          child: buttonContent,
        );
    }
  }

  /// Returns the size factor for the button based on its size.
  double getBtnSize() {
    switch (size) {
      case BtnSize.tiny:
        return 12;
      case BtnSize.small:
        return 14;
      case BtnSize.medium:
        return 18;
      case BtnSize.large:
        return 20;
      default:
        return 16;
    }
  }

  /// Returns the border radius for the button based on its shape.
  BorderRadius getBtnShape() {
    switch (shape) {
      case BtnShape.pill:
        return BorderRadius.circular(30);
      case BtnShape.rounded:
        return BorderRadius.circular(5);
      case BtnShape.rleft:
        return BorderRadius.only(topLeft: Radius.circular(30));
      case BtnShape.rright:
        return BorderRadius.only(topRight: Radius.circular(30));
      case BtnShape.leaf:
        return BorderRadius.only(
            bottomLeft: Radius.circular(30), topRight: Radius.circular(30));
      default:
        return BorderRadius.zero;
    }
  }
}

/// Defines the possible shapes for the [FxButton].
enum BtnShape { pill, flat, rounded, leaf, rleft, rright }

/// Defines the possible types for the [FxButton].
enum BtnType { solid, outline, outline2x, transparent }

/// Defines the possible sizes for the [FxButton].
enum BtnSize { tiny, small, normal, medium, large }
