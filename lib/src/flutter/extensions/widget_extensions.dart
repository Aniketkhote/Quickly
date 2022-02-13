import 'package:flutter/material.dart';

///Widget extension to extend widget functionality
extension WidgetExtensions on Widget {
  ///Directly access [Center] widget using dot operator
  Center get center => Center(child: this);

  ///Directly access [Expanded] widget using dot operator
  Expanded expand([int? flex]) => Expanded(child: this, flex: flex ?? 1);

  ///Creates a widget that controls where a child of a [Stack] is positioned.
  ///
  ///Only two out of the three horizontal values ([left], [right], [width]), and
  ///only two out of the three vertical values ([top], [bottom], [height]), can be set.
  ///In each case, at least one of the three must be null.
  Positioned positioned({
    double? top,
    double? bottom,
    double? left,
    double? right,
    double? height,
    double? width,
  }) =>
      Positioned(
        child: this,
        top: top,
        bottom: bottom,
        left: left,
        right: right,
        height: height,
        width: width,
      );

  /// Hide widget
  Visibility hide() => _visibility(false);

  /// Show widget
  Visibility show() => _visibility(true);

  /// Hide widget if condition satisfied
  Visibility hideIf(bool condition) => _visibility(false);

  /// Show widget if condition satisfied
  Visibility showIf(bool condition) => _visibility(true);

  /// Set icon to child widget
  Icon icon(IconData? icon,
          {Color? color, double? size, String? semanticLabel}) =>
      Icon(
        icon,
        color: color,
        size: size,
        semanticLabel: semanticLabel,
      );

  ///How to align the child.
  ///
  ///The x and y values of the [Alignment] control the horizontal and vertical alignment, respectively
  ///[Align] has some properties like [Alignment.bottomCenter][Alignment.topRight]
  Align align([Alignment alignment = Alignment.center]) => _align(alignment);

  ///[Align] child to Bottom Right of parent widget
  Align get bottomRight => _align(Alignment.bottomRight);

  ///[Align] child to Bottom Left of parent widget
  Align get bottomLeft => _align(Alignment.bottomLeft);

  ///[Align] child to Bottom Center of parent widget
  Align get bottomCenter => _align(Alignment.bottomCenter);

  ///[Align] child to Top Right of parent widget
  Align get topRight => _align(Alignment.topRight);

  ///[Align] child to Top Left of parent widget
  Align get topLeft => _align(Alignment.topLeft);

  ///[Align] child to Top Center of parent widget
  Align get topCenter => _align(Alignment.topCenter);

  ///[Align] child to Center Right of parent widget
  Align get centerRight => _align(Alignment.centerRight);

  ///[Align] child to Center Left of parent widget
  Align get centerLeft => _align(Alignment.centerLeft);

  ///Creates a fixed size box.
  ///
  ///The [width] and [height] parameters can be null to indicate that
  ///the size of the box should not be constrained in the corresponding dimension.
  SizedBox sizedBox({double? h, double? w}) =>
      SizedBox(child: this, height: h, width: w);

  ///Create a widget that makes its child partially transparent
  ///
  ///The [Opacity] argument must not be null and must be between 0.0 and 1.0
  Opacity opacity(double opacity) => _opacity(opacity);

  ///Get 0% [Opacity] which means fully invisible
  Opacity get opacity0 => _opacity(0.0);

  ///Get 10% [Opacity] which means slightly visible
  Opacity get opacity10 => _opacity(0.10);

  ///Get 20% [Opacity] which means slightly visible
  Opacity get opacity20 => _opacity(0.20);

  ///Get 25% [Opacity] which means paritally visible
  Opacity get opacity25 => _opacity(0.25);

  ///Get 50% [Opacity] which means half visible
  Opacity get opacity50 => _opacity(0.50);

  ///Get 75% [Opacity] which means paritally invisible
  Opacity get opacity75 => _opacity(0.75);

  ///Get 100% [Opacity] which means fully visible
  Opacity get opacity100 => _opacity(1.0);

  /// Add on Tap handler to the current widget
  GestureDetector onTap(VoidCallback callback) =>
      GestureDetector(child: this, onTap: callback);

  /// Add on Double Tap handler to the current widget
  GestureDetector onDoubleTap(VoidCallback callback) =>
      GestureDetector(child: this, onDoubleTap: callback);

  /// Add on Long Press handler to the current widget
  GestureDetector onLongPress(VoidCallback callback) =>
      GestureDetector(child: this, onLongPress: callback);

  /// Add on InkWell Tap handler to the current widget
  InkWell onInkTap(
    VoidCallback callback, {
    Color? splashColor,
    Color? focusColor,
    Color? hoverColor,
    bool? enableFeedback,
    double? radius,
    BorderRadius? borderRadius,
    MouseCursor? mouseCursor,
  }) {
    return InkWell(
      child: this,
      onTap: callback,
      splashColor: splashColor,
      focusColor: focusColor,
      hoverColor: hoverColor,
      enableFeedback: enableFeedback,
      radius: radius,
      borderRadius: borderRadius,
      mouseCursor: mouseCursor,
    );
  }

  /// Add onInkWell Double Tap handler to the current widget
  InkWell onInkDoubleTap(
    VoidCallback callback, {
    Color? splashColor,
    Color? focusColor,
    Color? hoverColor,
    bool? enableFeedback,
    double? radius,
    BorderRadius? borderRadius,
    MouseCursor? mouseCursor,
  }) {
    return InkWell(
      child: this,
      onDoubleTap: callback,
      splashColor: splashColor,
      focusColor: focusColor,
      hoverColor: hoverColor,
      enableFeedback: enableFeedback,
      radius: radius,
      borderRadius: borderRadius,
      mouseCursor: mouseCursor,
    );
  }

  Align _align(Alignment alignment) => Align(child: this, alignment: alignment);

  Opacity _opacity(double opacity) => Opacity(child: this, opacity: opacity);

  Visibility _visibility(bool value) => Visibility(child: this, visible: value);
}
