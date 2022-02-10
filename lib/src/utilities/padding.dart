import 'package:flutter/material.dart';

/// Gives predefined Padding
abstract class QxPadding {
  /// get padding only on given values non-zero.
  EdgeInsets only({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) =>
      _padding(top: top, bottom: bottom, left: left, right: right);

  /// get all side padding
  static EdgeInsets all(double all) => _padding(all: all);

  /// Gives remove padding from all sides
  static EdgeInsets get none => _padding(all: 0);

  /// get padding except left on given values non-zero.
  EdgeInsets pnl(double value) =>
      _padding(top: value, bottom: value, right: value);

  /// get padding except right on given values non-zero.
  EdgeInsets pnr(double value) =>
      _padding(top: value, bottom: value, left: value);

  /// get padding except top on given values non-zero.
  EdgeInsets pnt(double value) =>
      _padding(left: value, bottom: value, right: value);

  /// get padding except bottom on given values non-zero.
  EdgeInsets pnb(double value) =>
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

  /// Gives 1dp padding from all sides
  static EdgeInsets get p1 => _padding(all: 1);

  /// Gives 2dp padding from all sides
  static EdgeInsets get p2 => _padding(all: 2);

  /// Gives 3dp padding from all sides
  static EdgeInsets get p3 => _padding(all: 3);

  /// Gives 4dp padding from all sides
  static EdgeInsets get p4 => _padding(all: 4);

  /// Gives 5dp padding from all sides
  static EdgeInsets get p5 => _padding(all: 5);

  /// Gives 6dp padding from all sides
  static EdgeInsets get p6 => _padding(all: 6);

  /// Gives 7dp padding from all sides
  static EdgeInsets get p7 => _padding(all: 7);

  /// Gives 8dp padding from all sides
  static EdgeInsets get p8 => _padding(all: 8);

  /// Gives 9dp padding from all sides
  static EdgeInsets get p9 => _padding(all: 9);

  /// Gives 10dp padding from all sides
  static EdgeInsets get p10 => _padding(all: 10);

  /// Gives 11dp padding from all sides
  static EdgeInsets get p11 => _padding(all: 11);

  /// Gives 12dp padding from all sides
  static EdgeInsets get p12 => _padding(all: 12);

  /// Gives 16dp padding from all sides
  static EdgeInsets get p16 => _padding(all: 16);

  /// Gives 20dp padding from all sides
  static EdgeInsets get p20 => _padding(all: 20);

  /// Gives 24dp padding from all sides
  static EdgeInsets get p24 => _padding(all: 24);

  /// Gives 32dp padding from all sides
  static EdgeInsets get p32 => _padding(all: 32);

  /// Gives 48dp padding from all sides
  static EdgeInsets get p48 => _padding(all: 48);

  /// Gives 64dp padding from all sides
  static EdgeInsets get p64 => _padding(all: 64);

  /// Gives 0dp padding from right side
  static EdgeInsets get pr0 => _padding(right: 0);

  /// Gives 4dp padding from right side
  static EdgeInsets get pr4 => _padding(right: 4);

  /// Gives 8dp padding from right side
  static EdgeInsets get pr8 => _padding(right: 8);

  /// Gives 12dp padding from right side
  static EdgeInsets get pr12 => _padding(right: 12);

  /// Gives 16dp padding from right side
  static EdgeInsets get pr16 => _padding(right: 16);

  /// Gives 20dp padding from right side
  static EdgeInsets get pr20 => _padding(right: 20);

  /// Gives 24dp padding from right side
  static EdgeInsets get pr24 => _padding(right: 24);

  /// Gives 32dp padding from right side
  static EdgeInsets get pr32 => _padding(right: 32);

  /// Gives 48dp padding from right side
  static EdgeInsets get pr48 => _padding(right: 48);

  /// Gives 64dp padding from right side
  static EdgeInsets get pr64 => _padding(right: 64);

  /// Gives 0dp padding from left side
  static EdgeInsets get pl0 => _padding(left: 0);

  /// Gives 4dp padding from left side
  static EdgeInsets get pl4 => _padding(left: 4);

  /// Gives 8dp padding from left side
  static EdgeInsets get pl8 => _padding(left: 8);

  /// Gives 12dp padding from left side
  static EdgeInsets get pl12 => _padding(left: 12);

  /// Gives 16dp padding from left side
  static EdgeInsets get pl16 => _padding(left: 16);

  /// Gives 20dp padding from left side
  static EdgeInsets get pl20 => _padding(left: 20);

  /// Gives 24dp padding from left side
  static EdgeInsets get pl24 => _padding(left: 24);

  /// Gives 32dp padding from left side
  static EdgeInsets get pl32 => _padding(left: 32);

  /// Gives 48dp padding from left side
  static EdgeInsets get pl48 => _padding(left: 48);

  /// Gives 64dp padding from left side
  static EdgeInsets get pl64 => _padding(left: 64);

  /// Gives 0dp padding from top side
  static EdgeInsets get pt0 => _padding(top: 0);

  /// Gives 4dp padding from top side
  static EdgeInsets get pt4 => _padding(top: 4);

  /// Gives 8dp padding from top side
  static EdgeInsets get pt8 => _padding(top: 8);

  /// Gives 12dp padding from top side
  static EdgeInsets get pt12 => _padding(top: 12);

  /// Gives 16dp padding from top side
  static EdgeInsets get pt16 => _padding(top: 16);

  /// Gives 20dp padding from top side
  static EdgeInsets get pt20 => _padding(top: 20);

  /// Gives 24dp padding from top side
  static EdgeInsets get pt24 => _padding(top: 24);

  /// Gives 32dp padding from top side
  static EdgeInsets get pt32 => _padding(top: 32);

  /// Gives 48dp padding from top side
  static EdgeInsets get pt48 => _padding(top: 48);

  /// Gives 64dp padding from top side
  static EdgeInsets get pt64 => _padding(top: 64);

  /// Gives 0dp padding from bottom side
  static EdgeInsets get pb0 => _padding(bottom: 0);

  /// Gives 4dp padding from bottom side
  static EdgeInsets get pb4 => _padding(bottom: 4);

  /// Gives 8dp padding from bottom side
  static EdgeInsets get pb8 => _padding(bottom: 8);

  /// Gives 12dp padding from bottom side
  static EdgeInsets get pb12 => _padding(bottom: 12);

  /// Gives 16dp padding from bottom side
  static EdgeInsets get pb16 => _padding(bottom: 16);

  /// Gives 20dp padding from bottom side
  static EdgeInsets get pb20 => _padding(bottom: 20);

  /// Gives 24dp padding from bottom side
  static EdgeInsets get pb24 => _padding(bottom: 24);

  /// Gives 32dp padding from bottom side
  static EdgeInsets get pb32 => _padding(bottom: 32);

  /// Gives 48dp padding from bottom side
  static EdgeInsets get pb48 => _padding(bottom: 48);

  /// Gives 64dp padding from bottom side
  static EdgeInsets get pb64 => _padding(bottom: 64);

  /// Gives 4dp padding horizontally
  static EdgeInsets get px4 => _padding(horizontal: 4);

  /// Gives 8dp padding horizontally
  static EdgeInsets get px8 => _padding(horizontal: 8);

  /// Gives 12dp padding horizontally
  static EdgeInsets get px12 => _padding(horizontal: 12);

  /// Gives 16dp padding horizontally
  static EdgeInsets get px16 => _padding(horizontal: 16);

  /// Gives 20dp padding horizontally
  static EdgeInsets get px20 => _padding(horizontal: 20);

  /// Gives 24dp padding horizontally
  static EdgeInsets get px24 => _padding(horizontal: 24);

  /// Gives 32dp padding horizontally
  static EdgeInsets get px32 => _padding(horizontal: 32);

  /// Gives 48dp padding horizontally
  static EdgeInsets get px48 => _padding(horizontal: 48);

  /// Gives 64dp padding horizontally
  static EdgeInsets get px64 => _padding(horizontal: 64);

  /// Gives 4dp padding vertically
  static EdgeInsets get py4 => _padding(vertical: 4);

  /// Gives 8dp padding vertically
  static EdgeInsets get py8 => _padding(vertical: 8);

  /// Gives 12dp padding vertically
  static EdgeInsets get py12 => _padding(vertical: 12);

  /// Gives 16dp padding vertically
  static EdgeInsets get py16 => _padding(vertical: 16);

  /// Gives 20dp padding vertically
  static EdgeInsets get py20 => _padding(vertical: 20);

  /// Gives 24dp padding vertically
  static EdgeInsets get py24 => _padding(vertical: 24);

  /// Gives 32dp padding vertically
  static EdgeInsets get py32 => _padding(vertical: 32);

  /// Gives 48dp padding vertically
  static EdgeInsets get py48 => _padding(vertical: 48);

  /// Gives 64dp padding vertically
  static EdgeInsets get py64 => _padding(vertical: 64);

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
