import 'package:flutter/material.dart';

/// Extension class for `num` type that adds convenience functions to create [SizedBox] widgets.
extension NumExt on num {
  /// Creates a fixed square sized [SizedBox] with the specified height and width equal to this `num`.
  ///
  /// [child] is an optional child widget to be placed inside the [SizedBox].
  SizedBox sqBox([Widget? child]) =>
      SizedBox(height: toDouble(), width: toDouble(), child: child);

  /// Creates a fixed width [SizedBox] with the specified width equal to this `num`.
  ///
  /// [child] is an optional child widget to be placed inside the [SizedBox].
  SizedBox wBox([Widget? child]) => SizedBox(width: toDouble(), child: child);

  /// Creates a fixed height [SizedBox] with the specified height equal to this `num`.
  ///
  /// [child] is an optional child widget to be placed inside the [SizedBox].
  SizedBox hBox([Widget? child]) => SizedBox(height: toDouble(), child: child);
}
