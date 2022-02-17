import 'package:flutter/material.dart';

///Num extension to extend num functionality
extension NumExt on num {
  /// Creates a fixed square sized box.
  SizedBox box(Widget child) =>
      SizedBox(height: toDouble(), width: toDouble(), child: child);

  /// Create Fixed size width box
  SizedBox w(Widget child) => SizedBox(width: toDouble(), child: child);

  /// Create Fixed size height box
  SizedBox h(Widget child) => SizedBox(height: toDouble(), child: child);
}
