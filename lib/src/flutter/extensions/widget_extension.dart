import 'package:flutter/material.dart';

/// The WidgetExtension extension is an extension on the Widget class in Flutter.
///
/// It allows for additional functionality to be added to any widget through the use of dot notation
extension WidgetExtension on Widget {
  /// Creates a [Center] widget with the current widget as its child
  Center get center => Center(child: this);

  /// Creates an [Expanded] widget with the current widget as its child
  Expanded expand([int flex = 1]) => Expanded(flex: flex, child: this);

  /// Creates a [Flexible] widget with the current widget as its child
  Flexible flexible([int flex = 1, FlexFit fit = FlexFit.loose]) =>
      Flexible(flex: flex, fit: fit, child: this);

  /// Creates a [Positioned] widget with the current widget as its child.
  /// Only two out of the three horizontal values ([left], [right], [width]), and
  /// only two out of the three vertical values ([top], [bottom], [height]), can be set.
  /// In each case, at least one of the three must be null.
  Positioned positioned({
    double? top,
    double? bottom,
    double? left,
    double? right,
    double? height,
    double? width,
  }) =>
      Positioned(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
        height: height,
        width: width,
        child: this,
      );

  /// Creates a [Visibility] widget with the current widget as its child and sets its visibility based on the passed condition
  Visibility hide(bool isVisible, {bool maintainSize = false}) =>
      _visibility(isVisible = false, maintainSize);

  /// Creates a [Visibility] widget with the current widget as its child and sets its visibility based on the passed condition
  Visibility show(bool isVisible, {bool maintainSize = false}) =>
      _visibility(isVisible = true, maintainSize);

  /// Creates a [SizedBox] widget with the current widget as its child and sets its height and width
  SizedBox sizedBox({double? h, double? w}) =>
      SizedBox(height: h, width: w, child: this);

  /// Creates a square shaped [SizedBox] widget with the current widget as its child and sets its height and width
  SizedBox sqBox(double size) => sizedBox(h: size, w: size);

  /// Creates a [SizedBox] widget with the current widget as its child and sets its height
  SizedBox hBox(double height) => sizedBox(h: height);

  /// Creates a [SizedBox] widget with the current widget as its child and sets its width
  SizedBox wBox(double? width) => sizedBox(w: width);

  Visibility _visibility(bool isVisible, bool maintainSize) => Visibility(
        key: key,
        visible: isVisible,
        maintainSize: maintainSize,
        maintainAnimation: maintainSize,
        maintainState: maintainSize,
        child: this,
      );
}
