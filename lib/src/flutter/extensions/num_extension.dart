import 'package:flutter/material.dart';

///Num extension on Widget
extension NumExt on num {
  /// Creates a fixed square sized box.
  SizedBox sqBox([Widget? child]) =>
      SizedBox(height: toDouble(), width: toDouble(), child: child);

  /// Create Fixed size width box
  SizedBox wBox([Widget? child]) => SizedBox(width: toDouble(), child: child);

  /// Create Fixed size height box
  SizedBox hBox([Widget? child]) => SizedBox(height: toDouble(), child: child);
}
