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
  Padding get p0 => _padding(all: 0);

  ///Gives 4dp padding from all sides
  Padding get p4 => _padding(all: 4);

  ///Gives 8dp padding from all sides
  Padding get p8 => _padding(all: 8);

  ///Gives 12dp padding from all sides
  Padding get p12 => _padding(all: 12);

  ///Gives 16dp padding from all sides
  Padding get p16 => _padding(all: 16);

  ///Gives 20dp padding from all sides
  Padding get p20 => _padding(all: 20);

  ///Gives 24dp padding from all sides
  Padding get p24 => _padding(all: 24);

  ///Gives 32dp padding from all sides
  Padding get p32 => _padding(all: 32);

  ///Gives 48dp padding from all sides
  Padding get p48 => _padding(all: 48);

  ///Gives 64dp padding from all sides
  Padding get p64 => _padding(all: 64);

  ///Gives 0dp padding from right side
  Padding get pr0 => _padding(right: 0);

  ///Gives 4dp padding from right side
  Padding get pr4 => _padding(right: 4);

  ///Gives 8dp padding from right side
  Padding get pr8 => _padding(right: 8);

  ///Gives 12dp padding from right side
  Padding get pr12 => _padding(right: 12);

  ///Gives 16dp padding from right side
  Padding get pr16 => _padding(right: 16);

  ///Gives 20dp padding from right side
  Padding get pr20 => _padding(right: 20);

  ///Gives 24dp padding from right side
  Padding get pr24 => _padding(right: 24);

  ///Gives 32dp padding from right side
  Padding get pr32 => _padding(right: 32);

  ///Gives 48dp padding from right side
  Padding get pr48 => _padding(right: 48);

  ///Gives 64dp padding from right side
  Padding get pr64 => _padding(right: 64);

  ///Gives 0dp padding from left side
  Padding get pl0 => _padding(left: 0);

  ///Gives 4dp padding from left side
  Padding get pl4 => _padding(left: 4);

  ///Gives 8dp padding from left side
  Padding get pl8 => _padding(left: 8);

  ///Gives 12dp padding from left side
  Padding get pl12 => _padding(left: 12);

  ///Gives 16dp padding from left side
  Padding get pl16 => _padding(left: 16);

  ///Gives 20dp padding from left side
  Padding get pl20 => _padding(left: 20);

  ///Gives 24dp padding from left side
  Padding get pl24 => _padding(left: 24);

  ///Gives 32dp padding from left side
  Padding get pl32 => _padding(left: 32);

  ///Gives 48dp padding from left side
  Padding get pl48 => _padding(left: 48);

  ///Gives 64dp padding from left side
  Padding get pl64 => _padding(left: 64);

  ///Gives 0dp padding from top side
  Padding get pt0 => _padding(top: 0);

  ///Gives 4dp padding from top side
  Padding get pt4 => _padding(top: 4);

  ///Gives 8dp padding from top side
  Padding get pt8 => _padding(top: 8);

  ///Gives 12dp padding from top side
  Padding get pt12 => _padding(top: 12);

  ///Gives 16dp padding from top side
  Padding get pt16 => _padding(top: 16);

  ///Gives 20dp padding from top side
  Padding get pt20 => _padding(top: 20);

  ///Gives 24dp padding from top side
  Padding get pt24 => _padding(top: 24);

  ///Gives 32dp padding from top side
  Padding get pt32 => _padding(top: 32);

  ///Gives 48dp padding from top side
  Padding get pt48 => _padding(top: 48);

  ///Gives 64dp padding from top side
  Padding get pt64 => _padding(top: 64);

  ///Gives 0dp padding from bottom side
  Padding get pb0 => _padding(bottom: 0);

  ///Gives 4dp padding from bottom side
  Padding get pb4 => _padding(bottom: 4);

  ///Gives 8dp padding from bottom side
  Padding get pb8 => _padding(bottom: 8);

  ///Gives 12dp padding from bottom side
  Padding get pb12 => _padding(bottom: 12);

  ///Gives 16dp padding from bottom side
  Padding get pb16 => _padding(bottom: 16);

  ///Gives 20dp padding from bottom side
  Padding get pb20 => _padding(bottom: 20);

  ///Gives 24dp padding from bottom side
  Padding get pb24 => _padding(bottom: 24);

  ///Gives 32dp padding from bottom side
  Padding get pb32 => _padding(bottom: 32);

  ///Gives 48dp padding from bottom side
  Padding get pb48 => _padding(bottom: 48);

  ///Gives 64dp padding from bottom side
  Padding get pb64 => _padding(bottom: 64);

  ///Gives 4dp padding horizontally
  Padding get px4 => _padding(horizontal: 4);

  ///Gives 8dp padding horizontally
  Padding get px8 => _padding(horizontal: 8);

  ///Gives 12dp padding horizontally
  Padding get px12 => _padding(horizontal: 12);

  ///Gives 16dp padding horizontally
  Padding get px16 => _padding(horizontal: 16);

  ///Gives 20dp padding horizontally
  Padding get px20 => _padding(horizontal: 20);

  ///Gives 24dp padding horizontally
  Padding get px24 => _padding(horizontal: 24);

  ///Gives 32dp padding horizontally
  Padding get px32 => _padding(horizontal: 32);

  ///Gives 48dp padding horizontally
  Padding get px48 => _padding(horizontal: 48);

  ///Gives 64dp padding horizontally
  Padding get px64 => _padding(horizontal: 64);

  ///Gives 4dp padding vertically
  Padding get py4 => _padding(vertical: 4);

  ///Gives 8dp padding vertically
  Padding get py8 => _padding(vertical: 8);

  ///Gives 12dp padding vertically
  Padding get py12 => _padding(vertical: 12);

  ///Gives 16dp padding vertically
  Padding get py16 => _padding(vertical: 16);

  ///Gives 20dp padding vertically
  Padding get py20 => _padding(vertical: 20);

  ///Gives 24dp padding vertically
  Padding get py24 => _padding(vertical: 24);

  ///Gives 32dp padding vertically
  Padding get py32 => _padding(vertical: 32);

  ///Gives 48dp padding vertically
  Padding get py48 => _padding(vertical: 48);

  ///Gives 64dp padding vertically
  Padding get py64 => _padding(vertical: 64);

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
