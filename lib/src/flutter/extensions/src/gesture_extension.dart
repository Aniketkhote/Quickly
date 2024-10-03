import 'package:flutter/material.dart';

/// Extension class to add gesture handling capabilities to a `Widget`.
extension GestureExtension on Widget {
  /// Wraps the current `Widget` in a `GestureDetector` widget with a tap gesture callback.
  ///
  /// This method allows you to easily add a tap gesture to any widget.
  ///
  /// Example:
  /// ```dart
  /// Text('Tap me').onTap(() {
  ///   print('Widget tapped!');
  /// });
  /// ```
  ///
  /// @param callback The function to be called when the widget is tapped.
  /// @return A `GestureDetector` widget wrapping the current widget.
  GestureDetector onTap(VoidCallback callback) =>
      GestureDetector(onTap: callback, child: this);

  /// Wraps the current `Widget` in a `GestureDetector` widget with a double tap gesture callback.
  ///
  /// This method allows you to easily add a double tap gesture to any widget.
  ///
  /// Example:
  /// ```dart
  /// Text('Double tap me').onDoubleTap(() {
  ///   print('Widget double tapped!');
  /// });
  /// ```
  ///
  /// @param callback The function to be called when the widget is double tapped.
  /// @return A `GestureDetector` widget wrapping the current widget.
  GestureDetector onDoubleTap(VoidCallback callback) =>
      GestureDetector(onDoubleTap: callback, child: this);

  /// Wraps the current `Widget` in a `GestureDetector` widget with a long press gesture callback.
  ///
  /// This method allows you to easily add a long press gesture to any widget.
  ///
  /// Example:
  /// ```dart
  /// Text('Long press me').onLongPress(() {
  ///   print('Widget long pressed!');
  /// });
  /// ```
  ///
  /// @param callback The function to be called when the widget is long pressed.
  /// @return A `GestureDetector` widget wrapping the current widget.
  GestureDetector onLongPress(VoidCallback callback) =>
      GestureDetector(onLongPress: callback, child: this);

  /// Wraps the current `Widget` in an `InkWell` widget with a double tap gesture callback and customizable ink splash parameters.
  ///
  /// This method allows you to add a double tap gesture with visual feedback to any widget.
  ///
  /// Example:
  /// ```dart
  /// Text('Ink double tap me').onInkDoubleTap(
  ///   () {
  ///     print('Widget ink double tapped!');
  ///   },
  ///   splashColor: Colors.blue,
  ///   borderRadius: BorderRadius.circular(8),
  /// );
  /// ```
  ///
  /// @param callback The function to be called when the widget is double tapped.
  /// @param splashColor The color of the ink splash.
  /// @param focusColor The color of the focus highlight.
  /// @param hoverColor The color of the hover highlight.
  /// @param enableFeedback Whether to enable feedback for the ink well.
  /// @param radius The radius of the ink splash.
  /// @param borderRadius The border radius of the ink splash.
  /// @param mouseCursor The cursor for mouse pointers.
  /// @return An `InkWell` widget wrapping the current widget.
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
      onDoubleTap: callback,
      splashColor: splashColor,
      focusColor: focusColor,
      hoverColor: hoverColor,
      enableFeedback: enableFeedback,
      radius: radius,
      borderRadius: borderRadius,
      mouseCursor: mouseCursor,
      child: this,
    );
  }

  /// Wraps the current `Widget` in an `InkWell` widget with a tap gesture callback and customizable ink splash parameters.
  ///
  /// This method allows you to add a tap gesture with visual feedback to any widget.
  ///
  /// Example:
  /// ```dart
  /// Text('Ink tap me').onInkTap(
  ///   () {
  ///     print('Widget ink tapped!');
  ///   },
  ///   splashColor: Colors.red,
  ///   borderRadius: BorderRadius.circular(4),
  /// );
  /// ```
  ///
  /// @param callback The function to be called when the widget is tapped.
  /// @param splashColor The color of the ink splash.
  /// @param focusColor The color of the focus highlight.
  /// @param hoverColor The color of the hover highlight.
  /// @param enableFeedback Whether to enable feedback for the ink well.
  /// @param radius The radius of the ink splash.
  /// @param borderRadius The border radius of the ink splash.
  /// @param mouseCursor The cursor for mouse pointers.
  /// @return An `InkWell` widget wrapping the current widget.
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
      onTap: callback,
      splashColor: splashColor,
      focusColor: focusColor,
      hoverColor: hoverColor,
      enableFeedback: enableFeedback,
      radius: radius,
      borderRadius: borderRadius,
      mouseCursor: mouseCursor,
      child: this,
    );
  }
}
