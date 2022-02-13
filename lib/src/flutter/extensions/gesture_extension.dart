import 'package:flutter/material.dart';

///Gesture extension to extend widget functionality
extension GestureExtension on Widget {
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
}
