import 'package:flutter/material.dart';

/// The WidgetExtension extension is an extension on the Widget class in Flutter.
///
/// It allows for additional functionality to be added to any widget through the use of dot notation.
extension WidgetExtension on Widget {
  /// Centers the current widget.
  ///
  /// Returns a [Center] widget with the current widget as its child.
  Center get center => Center(child: this);

  /// Expands the current widget to fill available space.
  ///
  /// [flex] determines the proportion of space to fill. Defaults to 1.
  ///
  /// Returns an [Expanded] widget with the current widget as its child.
  Expanded expand([int flex = 1]) => Expanded(flex: flex, child: this);

  /// Makes the current widget flexible.
  ///
  /// [flex] determines the proportion of space to fill. Defaults to 1.
  /// [fit] determines how the child fills the available space. Defaults to [FlexFit.loose].
  ///
  /// Returns a [Flexible] widget with the current widget as its child.
  Flexible flexible([int flex = 1, FlexFit fit = FlexFit.loose]) =>
      Flexible(flex: flex, fit: fit, child: this);

  /// Positions the current widget within a [Stack].
  ///
  /// Only two out of the three horizontal values ([left], [right], [width]), and
  /// only two out of the three vertical values ([top], [bottom], [height]), can be set.
  /// In each case, at least one of the three must be null.
  ///
  /// Returns a [Positioned] widget with the current widget as its child.
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

  /// Hides the current widget based on a condition.
  ///
  /// [isVisible] determines whether the widget should be visible.
  /// [maintainSize] if true, the space for the widget is maintained even when hidden.
  ///
  /// Returns a [Visibility] widget with the current widget as its child.
  Visibility hide(bool isVisible, {bool maintainSize = false}) =>
      _visibility(isVisible: false, maintainSize: maintainSize);

  /// Shows the current widget based on a condition.
  ///
  /// [isVisible] determines whether the widget should be visible.
  /// [maintainSize] if true, the space for the widget is maintained even when hidden.
  ///
  /// Returns a [Visibility] widget with the current widget as its child.
  Visibility show(bool isVisible, {bool maintainSize = false}) =>
      _visibility(isVisible: true, maintainSize: maintainSize);

  /// Wraps the current widget in a [SizedBox] with specified dimensions.
  ///
  /// [h] sets the height of the SizedBox.
  /// [w] sets the width of the SizedBox.
  ///
  /// Returns a [SizedBox] widget with the current widget as its child.
  SizedBox sizedBox({double? h, double? w}) =>
      SizedBox(height: h, width: w, child: this);

  /// Creates a square [SizedBox] with the current widget as its child.
  ///
  /// [size] sets both the height and width of the SizedBox.
  ///
  /// Returns a square [SizedBox] widget with the current widget as its child.
  SizedBox sqBox(double size) => sizedBox(h: size, w: size);

  /// Creates a [SizedBox] with specified height and the current widget as its child.
  ///
  /// [height] sets the height of the SizedBox.
  ///
  /// Returns a [SizedBox] widget with the current widget as its child.
  SizedBox hBox(double height) => sizedBox(h: height);

  /// Creates a [SizedBox] with specified width and the current widget as its child.
  ///
  /// [width] sets the width of the SizedBox.
  ///
  /// Returns a [SizedBox] widget with the current widget as its child.
  SizedBox wBox(double? width) => sizedBox(w: width);

  /// Internal method to create a [Visibility] widget.
  ///
  /// [isVisible] determines whether the widget should be visible.
  /// [maintainSize] if true, the space for the widget is maintained even when hidden.
  ///
  /// Returns a [Visibility] widget with the current widget as its child.
  Visibility _visibility(
          {required bool isVisible, required bool maintainSize}) =>
      Visibility(
        key: key,
        visible: isVisible,
        maintainSize: maintainSize,
        maintainAnimation: maintainSize,
        maintainState: maintainSize,
        child: this,
      );
}
