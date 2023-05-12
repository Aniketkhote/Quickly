import 'package:flutter/material.dart';

import '../../../quickly.dart';

class FxButton extends StatelessWidget {
  const FxButton({
    required this.text,
    required this.onPressed,
    this.outlineColor = FxColor.primary,
    this.shape = BtnShape.rounded,
    this.size = BtnSize.normal,
    this.type = BtnType.solid,
    this.isBlock = false,
    this.leadingIcon,
    this.trailingIcon,
    this.padding,
    this.margin,
    this.radius,
    this.color,
    this.shadow,
    this.textColor,
    this.iconColor,
    Key? key,
  }) : super(key: key);

  final String text;

  final IconData? leadingIcon;

  final IconData? trailingIcon;

  final VoidCallback onPressed;

  final EdgeInsetsGeometry? padding;

  final EdgeInsetsGeometry? margin;

  final BorderRadius? radius;

  final Color outlineColor;

  final Color? color;

  final Color? textColor;

  final Color? iconColor;

  final List<BoxShadow>? shadow;

  final BtnShape shape;

  final BtnSize size;

  final BtnType type;

  final bool isBlock;

  @override
  Widget build(BuildContext context) {
    final Widget textWidget = Text(
      text,
      style: TextStyle(
        color: type == BtnType.solid
            ? textColor ?? getTextColor(color ?? getBtnType())
            : color,
      ),
      textScaleFactor: getBtnSize(),
    ).medium.px4.hide(text.isEmpty);

    final Color? iconColor = type == BtnType.solid
        ? getTextColor(this.iconColor ?? getBtnType())
        : color;

    final Widget leadingIconWidget = leadingIcon != null
        ? Icon(
            leadingIcon,
            color: iconColor,
            size: getBtnSize() * 15,
          )
        : const SizedBox.shrink();

    final Widget trailingIconWidget = trailingIcon != null
        ? Icon(
            trailingIcon,
            color: iconColor,
            size: getBtnSize() * 15,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            leadingIconWidget,
            textWidget,
            trailingIconWidget,
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

enum BtnShape { pill, flat, rounded, leaf, rleft, rright }

enum BtnType { solid, outline, outline2x, transparent }

enum BtnSize { tiny, small, normal, medium, large }
