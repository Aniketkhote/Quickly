import 'package:flutter/material.dart';

///Widget extension to extend widget functionality
extension WidgetExtension on Widget {
  ///Directly access [Center] widget using dot operator
  Center get center => Center(child: this);

  ///Directly access [Expanded] widget using dot operator
  Expanded expand([int flex = 1]) => Expanded(child: this, flex: flex);

  ///Directly access [Flexible] widget using dot operator
  Flexible flexible([int flex = 1, FlexFit fit = FlexFit.loose]) =>
      Flexible(child: this, flex: flex, fit: fit);

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
  Visibility hideIf(bool condition) =>
      condition ? _visibility(false) : _visibility(true);

  /// Show widget if condition satisfied
  Visibility showIf(bool condition) =>
      condition ? _visibility(true) : _visibility(false);

  ///Creates a fixed size box.
  ///
  ///The [width] and [height] parameters can be null to indicate that
  ///the size of the box should not be constrained in the corresponding dimension.
  SizedBox sizedBox({double? h, double? w}) =>
      SizedBox(child: this, height: h, width: w);

  ///Creates a fixed sized square box.
  SizedBox sqBox(double size) => sizedBox(h: size, w: size);

  ///Creates a fixed sized height box.
  SizedBox hBox(double height) => sizedBox(h: height);

  ///Creates a fixed sized width box.
  SizedBox wBox(double? width) => sizedBox(w: width);

  Visibility _visibility(bool value) => Visibility(child: this, visible: value);
}
