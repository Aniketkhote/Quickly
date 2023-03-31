import 'package:flutter/material.dart';

/// Extension class to add gesture handling capabilities to a `Widget`.
extension GestureExtension on Widget {
  /// Wraps the current `Widget` in a `GestureDetector` widget with a double tap gesture callback.
  GestureDetector onDoubleTap(VoidCallback callback) =>
      GestureDetector(onDoubleTap: callback, child: this);

  /// Wraps the current `Widget` in an `InkWell` widget with a double tap gesture callback and customizable ink splash parameters.
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

  /// Wraps the current `Widget` in a `GestureDetector` widget with a long press gesture callback.
  GestureDetector onLongPress(VoidCallback callback) =>
      GestureDetector(onLongPress: callback, child: this);

  /// Wraps the current `Widget` in a `GestureDetector` widget with a tap gesture callback.
  GestureDetector onTap(VoidCallback callback) =>
      GestureDetector(onTap: callback, child: this);
}
