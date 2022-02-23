import 'package:flutter/material.dart';

/// Gives predefined Padding
mixin FxPadding {
  /// get padding only on given values non-zero.
  static EdgeInsets only({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) =>
      _padding(top: top, bottom: bottom, left: left, right: right);

  /// get all side padding
  static EdgeInsets all(double all) => _padding(all: all);

  /// Gives remove padding from all sides
  static EdgeInsets get none => all(0);

  /// get padding except left on given values non-zero.
  static EdgeInsets pnl(double value) =>
      _padding(top: value, bottom: value, right: value);

  /// get padding except right on given values non-zero.
  static EdgeInsets pnr(double value) =>
      _padding(top: value, bottom: value, left: value);

  /// get padding except top on given values non-zero.
  static EdgeInsets pnt(double value) =>
      _padding(left: value, bottom: value, right: value);

  /// get padding except bottom on given values non-zero.
  static EdgeInsets pnb(double value) =>
      _padding(top: value, left: value, right: value);

  /// get horizontaly padding
  static EdgeInsets px(double horizontal) => _padding(horizontal: horizontal);

  /// get vertically padding
  static EdgeInsets py(double vertical) => _padding(vertical: vertical);

  /// get [symmetric] vertically and horizontally padding
  static EdgeInsets pxy({required double h, required double v}) =>
      _padding(horizontal: h, vertical: v);

  /// get right side padding
  static EdgeInsets pr(double right) => _padding(right: right);

  /// get left side padding
  static EdgeInsets pl(double left) => _padding(left: left);

  /// get top side padding
  static EdgeInsets pt(double top) => _padding(top: top);

  /// get bottom side padding
  static EdgeInsets pb(double bottom) => _padding(bottom: bottom);

  /// Gives 4dp padding from all sides
  static EdgeInsets get p4 => all(4);

  /// Gives 8dp padding from all sides
  static EdgeInsets get p8 => all(8);

  /// Gives 12dp padding from all sides
  static EdgeInsets get p12 => all(12);

  /// Gives 16dp padding from all sides
  static EdgeInsets get p16 => all(16);

  /// Gives 20dp padding from all sides
  static EdgeInsets get p20 => all(20);

  /// Gives 24dp padding from all sides
  static EdgeInsets get p24 => all(24);

  /// Gives 32dp padding from all sides
  static EdgeInsets get p32 => all(32);

  /// Gives 48dp padding from all sides
  static EdgeInsets get p48 => all(48);

  /// Gives 64dp padding from all sides
  static EdgeInsets get p64 => all(64);

  /// Gives 0dp padding from right side
  static EdgeInsets get pr0 => pr(0);

  /// Gives 4dp padding from right side
  static EdgeInsets get pr4 => pr(4);

  /// Gives 8dp padding from right side
  static EdgeInsets get pr8 => pr(8);

  /// Gives 12dp padding from right side
  static EdgeInsets get pr12 => pr(12);

  /// Gives 16dp padding from right side
  static EdgeInsets get pr16 => pr(16);

  /// Gives 20dp padding from right side
  static EdgeInsets get pr20 => pr(20);

  /// Gives 24dp padding from right side
  static EdgeInsets get pr24 => pr(24);

  /// Gives 32dp padding from right side
  static EdgeInsets get pr32 => pr(32);

  /// Gives 48dp padding from right side
  static EdgeInsets get pr48 => pr(48);

  /// Gives 64dp padding from right side
  static EdgeInsets get pr64 => pr(64);

  /// Gives 0dp padding from left side
  static EdgeInsets get pl0 => pl(0);

  /// Gives 4dp padding from left side
  static EdgeInsets get pl4 => pl(4);

  /// Gives 8dp padding from left side
  static EdgeInsets get pl8 => pl(8);

  /// Gives 12dp padding from left side
  static EdgeInsets get pl12 => pl(12);

  /// Gives 16dp padding from left side
  static EdgeInsets get pl16 => pl(16);

  /// Gives 20dp padding from left side
  static EdgeInsets get pl20 => pl(20);

  /// Gives 24dp padding from left side
  static EdgeInsets get pl24 => pl(24);

  /// Gives 32dp padding from left side
  static EdgeInsets get pl32 => pl(32);

  /// Gives 48dp padding from left side
  static EdgeInsets get pl48 => pl(48);

  /// Gives 64dp padding from left side
  static EdgeInsets get pl64 => pl(64);

  /// Gives 0dp padding from top side
  static EdgeInsets get pt0 => pt(0);

  /// Gives 4dp padding from top side
  static EdgeInsets get pt4 => pt(4);

  /// Gives 8dp padding from top side
  static EdgeInsets get pt8 => pt(8);

  /// Gives 12dp padding from top side
  static EdgeInsets get pt12 => pt(12);

  /// Gives 16dp padding from top side
  static EdgeInsets get pt16 => pt(16);

  /// Gives 20dp padding from top side
  static EdgeInsets get pt20 => pt(20);

  /// Gives 24dp padding from top side
  static EdgeInsets get pt24 => pt(24);

  /// Gives 32dp padding from top side
  static EdgeInsets get pt32 => pt(32);

  /// Gives 48dp padding from top side
  static EdgeInsets get pt48 => pt(48);

  /// Gives 64dp padding from top side
  static EdgeInsets get pt64 => pt(64);

  /// Gives 0dp padding from bottom side
  static EdgeInsets get pb0 => pb(0);

  /// Gives 4dp padding from bottom side
  static EdgeInsets get pb4 => pb(4);

  /// Gives 8dp padding from bottom side
  static EdgeInsets get pb8 => pb(8);

  /// Gives 12dp padding from bottom side
  static EdgeInsets get pb12 => pb(12);

  /// Gives 16dp padding from bottom side
  static EdgeInsets get pb16 => pb(16);

  /// Gives 20dp padding from bottom side
  static EdgeInsets get pb20 => pb(20);

  /// Gives 24dp padding from bottom side
  static EdgeInsets get pb24 => pb(24);

  /// Gives 32dp padding from bottom side
  static EdgeInsets get pb32 => pb(32);

  /// Gives 48dp padding from bottom side
  static EdgeInsets get pb48 => pb(48);

  /// Gives 64dp padding from bottom side
  static EdgeInsets get pb64 => pb(64);

  /// Gives 4dp padding horizontally
  static EdgeInsets get px4 => px(4);

  /// Gives 8dp padding horizontally
  static EdgeInsets get px8 => px(8);

  /// Gives 12dp padding horizontally
  static EdgeInsets get px12 => px(12);

  /// Gives 16dp padding horizontally
  static EdgeInsets get px16 => px(16);

  /// Gives 20dp padding horizontally
  static EdgeInsets get px20 => px(20);

  /// Gives 24dp padding horizontally
  static EdgeInsets get px24 => px(24);

  /// Gives 32dp padding horizontally
  static EdgeInsets get px32 => px(32);

  /// Gives 48dp padding horizontally
  static EdgeInsets get px48 => px(48);

  /// Gives 64dp padding horizontally
  static EdgeInsets get px64 => px(64);

  /// Gives 4dp padding vertically
  static EdgeInsets get py4 => py(4);

  /// Gives 8dp padding vertically
  static EdgeInsets get py8 => py(8);

  /// Gives 12dp padding vertically
  static EdgeInsets get py12 => py(12);

  /// Gives 16dp padding vertically
  static EdgeInsets get py16 => py(16);

  /// Gives 20dp padding vertically
  static EdgeInsets get py20 => py(20);

  /// Gives 24dp padding vertically
  static EdgeInsets get py24 => py(24);

  /// Gives 32dp padding vertically
  static EdgeInsets get py32 => py(32);

  /// Gives 48dp padding vertically
  static EdgeInsets get py48 => py(48);

  /// Gives 64dp padding vertically
  static EdgeInsets get py64 => py(64);

  static EdgeInsets _padding({
    double? all,
    double? horizontal,
    double? vertical,
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) =>
      EdgeInsets.only(
        top: top ?? vertical ?? all ?? 0.0,
        bottom: bottom ?? vertical ?? all ?? 0.0,
        left: left ?? horizontal ?? all ?? 0.0,
        right: right ?? horizontal ?? all ?? 0.0,
      );
}
