import 'package:flutter/material.dart';

/// Extension class for `num` type that adds convenience functions to create [SizedBox] widgets.
extension NumExt on num {
  /// Creates a fixed square sized [SizedBox] with the specified height and width equal to this `num`.
  ///
  /// This method converts the `num` value to a double and uses it for both height and width.
  ///
  /// [child] is an optional child widget to be placed inside the [SizedBox].
  ///
  /// Returns a [SizedBox] with equal height and width.
  ///
  /// Example:
  /// ```dart
  /// 20.sqBox(Text('Square Box'))
  /// ```
  SizedBox sqBox([Widget? child]) =>
      SizedBox(height: toDouble(), width: toDouble(), child: child);

  /// Creates a fixed width [SizedBox] with the specified width equal to this `num`.
  ///
  /// This method converts the `num` value to a double and uses it for the width.
  ///
  /// [child] is an optional child widget to be placed inside the [SizedBox].
  ///
  /// Returns a [SizedBox] with the specified width and unconstrained height.
  ///
  /// Example:
  /// ```dart
  /// 100.wBox(Text('Wide Box'))
  /// ```
  SizedBox wBox([Widget? child]) => SizedBox(width: toDouble(), child: child);

  /// Creates a fixed height [SizedBox] with the specified height equal to this `num`.
  ///
  /// This method converts the `num` value to a double and uses it for the height.
  ///
  /// [child] is an optional child widget to be placed inside the [SizedBox].
  ///
  /// Returns a [SizedBox] with the specified height and unconstrained width.
  ///
  /// Example:
  /// ```dart
  /// 50.hBox(Text('Tall Box'))
  /// ```
  SizedBox hBox([Widget? child]) => SizedBox(height: toDouble(), child: child);
}
