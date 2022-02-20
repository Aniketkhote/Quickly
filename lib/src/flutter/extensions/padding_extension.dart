import 'package:flutter/material.dart';

///Padding extension on widget to directly get padding
extension PaddingExtension on Widget {
  ///get padding only on given values non-zero.
  Padding pOnly({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) =>
      _padding(top: top, bottom: bottom, left: left, right: right);

  ///get padding except left on given values non-zero.
  Padding pnl(double value) =>
      _padding(top: value, bottom: value, right: value);

  ///get padding except right on given values non-zero.
  Padding pnr(double value) => _padding(top: value, bottom: value, left: value);

  ///get padding except top on given values non-zero.
  Padding pnt(double value) =>
      _padding(left: value, bottom: value, right: value);

  ///get padding except bottom on given values non-zero.
  Padding pnb(double value) => _padding(top: value, left: value, right: value);

  ///get all side padding
  Padding p(double all) => _padding(all: all);

  ///get horizontaly padding
  Padding px(double h) => _padding(horizontal: h);

  ///get vertically padding
  Padding py(double v) => _padding(vertical: v);

  ///get [symmetric] vertically and horizontally padding
  Padding pxy({required double h, required double v}) =>
      _padding(horizontal: h, vertical: v);

  ///get right side padding
  Padding pr(double right) => _padding(right: right);

  ///get left side padding
  Padding pl(double left) => _padding(left: left);

  ///get top side padding
  Padding pt(double top) => _padding(top: top);

  ///get bottom side padding
  Padding pb(double bottom) => _padding(bottom: bottom);

  ///Gives 0dp padding from all sides
  Padding get p0 => p(0);

  /// Gives 1dp padding from all sides
  Padding get p1 => p(1);

  /// Gives 2dp padding from all sides
  Padding get p2 => p(2);

  /// Gives 3dp padding from all sides
  Padding get p3 => p(3);

  /// Gives 4dp padding from all sides
  Padding get p4 => p(4);

  /// Gives 5dp padding from all sides
  Padding get p5 => p(5);

  /// Gives 6dp padding from all sides
  Padding get p6 => p(6);

  /// Gives 7dp padding from all sides
  Padding get p7 => p(7);

  /// Gives 8dp padding from all sides
  Padding get p8 => p(8);

  /// Gives 9dp padding from all sides
  Padding get p9 => p(9);

  /// Gives 10dp padding from all sides
  Padding get p10 => p(10);

  /// Gives 11dp padding from all sides
  Padding get p11 => p(11);

  ///Gives 12dp padding from all sides
  Padding get p12 => p(12);

  ///Gives 16dp padding from all sides
  Padding get p16 => p(16);

  ///Gives 20dp padding from all sides
  Padding get p20 => p(20);

  ///Gives 24dp padding from all sides
  Padding get p24 => p(24);

  ///Gives 32dp padding from all sides
  Padding get p32 => p(32);

  ///Gives 48dp padding from all sides
  Padding get p48 => p(48);

  ///Gives 64dp padding from all sides
  Padding get p64 => p(64);

  Padding _padding({
    double? all,
    double? horizontal,
    double? vertical,
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) =>
      Padding(
        padding: EdgeInsets.only(
          top: top ?? vertical ?? all ?? 0.0,
          bottom: bottom ?? vertical ?? all ?? 0.0,
          left: left ?? horizontal ?? all ?? 0.0,
          right: right ?? horizontal ?? all ?? 0.0,
        ),
        child: this,
      );
}
