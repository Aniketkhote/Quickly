import 'package:flutter/material.dart';

/// Extension on [Widget] to provide convenient padding methods.
extension PaddingExtension on Widget {
  /// Applies padding only to the specified sides.
  ///
  /// [top], [bottom], [left], [right]: Padding values for respective sides.
  Padding pOnly({
    double top = 0,
    double bottom = 0,
    double left = 0,
    double right = 0,
  }) =>
      _pad(top: top, bottom: bottom, left: left, right: right);

  /// Applies padding to all sides except left.
  ///
  /// [value]: Padding value to apply.
  Padding pnl(double value) => _pad(top: value, bottom: value, right: value);

  /// Applies padding to all sides except right.
  ///
  /// [value]: Padding value to apply.
  Padding pnr(double value) => _pad(top: value, bottom: value, left: value);

  /// Applies padding to all sides except top.
  ///
  /// [value]: Padding value to apply.
  Padding pnt(double value) => _pad(left: value, bottom: value, right: value);

  /// Applies padding to all sides except bottom.
  ///
  /// [value]: Padding value to apply.
  Padding pnb(double value) => _pad(top: value, left: value, right: value);

  /// Applies equal padding to all sides.
  ///
  /// [all]: Padding value to apply to all sides.
  Padding p(double all) => _pad(all: all);

  /// Applies horizontal padding.
  ///
  /// [h]: Horizontal padding value.
  Padding px(double h) => _pad(h: h);

  /// Applies vertical padding.
  ///
  /// [v]: Vertical padding value.
  Padding py(double v) => _pad(v: v);

  /// Applies symmetric padding with different horizontal and vertical values.
  ///
  /// [h]: Horizontal padding value.
  /// [v]: Vertical padding value.
  Padding pxy({required double h, required double v}) => _pad(h: h, v: v);

  /// Applies padding to the right side.
  ///
  /// [right]: Right padding value.
  Padding pr(double right) => _pad(right: right);

  /// Applies padding to the left side.
  ///
  /// [left]: Left padding value.
  Padding pl(double left) => _pad(left: left);

  /// Applies padding to the top side.
  ///
  /// [top]: Top padding value.
  Padding pt(double top) => _pad(top: top);

  /// Applies padding to the bottom side.
  ///
  /// [bottom]: Bottom padding value.
  Padding pb(double bottom) => _pad(bottom: bottom);

  /// Applies 0dp padding to all sides.
  Padding get p0 => p(0);

  /// Applies 1dp padding to all sides.
  Padding get p1 => p(1);

  /// Applies 2dp padding to all sides.
  Padding get p2 => p(2);

  /// Applies 3dp padding to all sides.
  Padding get p3 => p(3);

  /// Applies 4dp padding to all sides.
  Padding get p4 => p(4);

  /// Applies 5dp padding to all sides.
  Padding get p5 => p(5);

  /// Applies 6dp padding to all sides.
  Padding get p6 => p(6);

  /// Applies 7dp padding to all sides.
  Padding get p7 => p(7);

  /// Applies 8dp padding to all sides.
  Padding get p8 => p(8);

  /// Applies 9dp padding to all sides.
  Padding get p9 => p(9);

  /// Applies 10dp padding to all sides.
  Padding get p10 => p(10);

  /// Applies 11dp padding to all sides.
  Padding get p11 => p(11);

  /// Applies 12dp padding to all sides.
  Padding get p12 => p(12);

  /// Applies 16dp padding to all sides.
  Padding get p16 => p(16);

  /// Applies 20dp padding to all sides.
  Padding get p20 => p(20);

  /// Applies 24dp padding to all sides.
  Padding get p24 => p(24);

  /// Applies 32dp padding to all sides.
  Padding get p32 => p(32);

  /// Applies 48dp padding to all sides.
  Padding get p48 => p(48);

  /// Applies 64dp padding to all sides.
  Padding get p64 => p(64);

  /// Applies 0dp padding to the right side.
  Padding get pr0 => pr(0);

  /// Applies 4dp padding to the right side.
  Padding get pr4 => pr(4);

  /// Applies 8dp padding to the right side.
  Padding get pr8 => pr(8);

  /// Applies 12dp padding to the right side.
  Padding get pr12 => pr(12);

  /// Applies 16dp padding to the right side.
  Padding get pr16 => pr(16);

  /// Applies 20dp padding to the right side.
  Padding get pr20 => pr(20);

  /// Applies 24dp padding to the right side.
  Padding get pr24 => pr(24);

  /// Applies 32dp padding to the right side.
  Padding get pr32 => pr(32);

  /// Applies 48dp padding to the right side.
  Padding get pr48 => pr(48);

  /// Applies 64dp padding to the right side.
  Padding get pr64 => pr(64);

  /// Applies 0dp padding to the left side.
  Padding get pl0 => pl(0);

  /// Applies 4dp padding to the left side.
  Padding get pl4 => pl(4);

  /// Applies 8dp padding to the left side.
  Padding get pl8 => pl(8);

  /// Applies 12dp padding to the left side.
  Padding get pl12 => pl(12);

  /// Applies 16dp padding to the left side.
  Padding get pl16 => pl(16);

  /// Applies 20dp padding to the left side.
  Padding get pl20 => pl(20);

  /// Applies 24dp padding to the left side.
  Padding get pl24 => pl(24);

  /// Applies 32dp padding to the left side.
  Padding get pl32 => pl(32);

  /// Applies 48dp padding to the left side.
  Padding get pl48 => pl(48);

  /// Applies 64dp padding to the left side.
  Padding get pl64 => pl(64);

  /// Applies 0dp padding to the top side.
  Padding get pt0 => pt(0);

  /// Applies 4dp padding to the top side.
  Padding get pt4 => pt(4);

  /// Applies 8dp padding to the top side.
  Padding get pt8 => pt(8);

  /// Applies 12dp padding to the top side.
  Padding get pt12 => pt(12);

  /// Applies 16dp padding to the top side.
  Padding get pt16 => pt(16);

  /// Applies 20dp padding to the top side.
  Padding get pt20 => pt(20);

  /// Applies 24dp padding to the top side.
  Padding get pt24 => pt(24);

  /// Applies 32dp padding to the top side.
  Padding get pt32 => pt(32);

  /// Applies 48dp padding to the top side.
  Padding get pt48 => pt(48);

  /// Applies 64dp padding to the top side.
  Padding get pt64 => pt(64);

  /// Applies 0dp padding to the bottom side.
  Padding get pb0 => pb(0);

  /// Applies 4dp padding to the bottom side.
  Padding get pb4 => pb(4);

  /// Applies 8dp padding to the bottom side.
  Padding get pb8 => pb(8);

  /// Applies 12dp padding to the bottom side.
  Padding get pb12 => pb(12);

  /// Applies 16dp padding to the bottom side.
  Padding get pb16 => pb(16);

  /// Applies 20dp padding to the bottom side.
  Padding get pb20 => pb(20);

  /// Applies 24dp padding to the bottom side.
  Padding get pb24 => pb(24);

  /// Applies 32dp padding to the bottom side.
  Padding get pb32 => pb(32);

  /// Applies 48dp padding to the bottom side.
  Padding get pb48 => pb(48);

  /// Applies 64dp padding to the bottom side.
  Padding get pb64 => pb(64);

  /// Applies 4dp padding horizontally.
  Padding get px4 => px(4);

  /// Applies 8dp padding horizontally.
  Padding get px8 => px(8);

  /// Applies 12dp padding horizontally.
  Padding get px12 => px(12);

  /// Applies 16dp padding horizontally.
  Padding get px16 => px(16);

  /// Applies 20dp padding horizontally.
  Padding get px20 => px(20);

  /// Applies 24dp padding horizontally.
  Padding get px24 => px(24);

  /// Applies 32dp padding horizontally.
  Padding get px32 => px(32);

  /// Applies 48dp padding horizontally.
  Padding get px48 => px(48);

  /// Applies 64dp padding horizontally.
  Padding get px64 => px(64);

  /// Applies 4dp padding vertically.
  Padding get py4 => py(4);

  /// Applies 8dp padding vertically.
  Padding get py8 => py(8);

  /// Applies 12dp padding vertically.
  Padding get py12 => py(12);

  /// Applies 16dp padding vertically.
  Padding get py16 => py(16);

  /// Applies 20dp padding vertically.
  Padding get py20 => py(20);

  /// Applies 24dp padding vertically.
  Padding get py24 => py(24);

  /// Applies 32dp padding vertically.
  Padding get py32 => py(32);

  /// Applies 48dp padding vertically.
  Padding get py48 => py(48);

  /// Applies 64dp padding vertically.
  Padding get py64 => py(64);

  /// Internal method to create a [Padding] widget with the specified values.
  ///
  /// [all]: Padding for all sides.
  /// [h]: Horizontal padding.
  /// [v]: Vertical padding.
  /// [top], [bottom], [left], [right]: Individual side padding.
  Padding _pad({
    double? all,
    double? h,
    double? v,
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: left ?? h ?? all ?? 0.0,
        top: top ?? v ?? all ?? 0.0,
        right: right ?? h ?? all ?? 0.0,
        bottom: bottom ?? v ?? all ?? 0.0,
      ),
      child: this,
    );
  }
}
