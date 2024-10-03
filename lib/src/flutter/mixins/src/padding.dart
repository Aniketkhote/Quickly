import 'package:flutter/material.dart';

/// Provides predefined padding values and utility methods for creating EdgeInsets.
mixin FxPadding {
  /// Creates padding with specified values for each side.
  ///
  /// [top], [bottom], [left], [right]: Padding values for respective sides.
  /// Returns an [EdgeInsets] object with the specified padding.
  static EdgeInsets only({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) =>
      _pad(top: top, bottom: bottom, left: left, right: right);

  /// Creates padding with the same value for all sides.
  ///
  /// [all]: The padding value to be applied to all sides.
  /// Returns an [EdgeInsets] object with uniform padding.
  static EdgeInsets all(double all) => _pad(all: all);

  /// Provides zero padding for all sides.
  ///
  /// Returns an [EdgeInsets] object with no padding.
  static EdgeInsets get none => all(0);

  /// Creates padding for all sides except the left.
  ///
  /// [value]: The padding value to be applied.
  /// Returns an [EdgeInsets] object with padding on top, bottom, and right.
  static EdgeInsets pnl(double value) =>
      _pad(top: value, bottom: value, right: value);

  /// Creates padding for all sides except the right.
  ///
  /// [value]: The padding value to be applied.
  /// Returns an [EdgeInsets] object with padding on top, bottom, and left.
  static EdgeInsets pnr(double value) =>
      _pad(top: value, bottom: value, left: value);

  /// Creates padding for all sides except the top.
  ///
  /// [value]: The padding value to be applied.
  /// Returns an [EdgeInsets] object with padding on left, bottom, and right.
  static EdgeInsets pnt(double value) =>
      _pad(left: value, bottom: value, right: value);

  /// Creates padding for all sides except the bottom.
  ///
  /// [value]: The padding value to be applied.
  /// Returns an [EdgeInsets] object with padding on top, left, and right.
  static EdgeInsets pnb(double value) =>
      _pad(top: value, left: value, right: value);

  /// Creates horizontal padding.
  ///
  /// [h]: The horizontal padding value.
  /// Returns an [EdgeInsets] object with left and right padding.
  static EdgeInsets px(double h) => _pad(h: h);

  /// Creates vertical padding.
  ///
  /// [v]: The vertical padding value.
  /// Returns an [EdgeInsets] object with top and bottom padding.
  static EdgeInsets py(double v) => _pad(v: v);

  /// Creates symmetric padding with different horizontal and vertical values.
  ///
  /// [h]: The horizontal padding value.
  /// [v]: The vertical padding value.
  /// Returns an [EdgeInsets] object with the specified horizontal and vertical padding.
  static EdgeInsets pxy({required double h, required double v}) =>
      _pad(h: h, v: v);

  /// Creates padding for the right side only.
  ///
  /// [right]: The right padding value.
  /// Returns an [EdgeInsets] object with right padding.
  static EdgeInsets pr(double right) => _pad(right: right);

  /// Creates padding for the left side only.
  ///
  /// [left]: The left padding value.
  /// Returns an [EdgeInsets] object with left padding.
  static EdgeInsets pl(double left) => _pad(left: left);

  /// Creates padding for the top side only.
  ///
  /// [top]: The top padding value.
  /// Returns an [EdgeInsets] object with top padding.
  static EdgeInsets pt(double top) => _pad(top: top);

  /// Creates padding for the bottom side only.
  ///
  /// [bottom]: The bottom padding value.
  /// Returns an [EdgeInsets] object with bottom padding.
  static EdgeInsets pb(double bottom) => _pad(bottom: bottom);

  /// Provides 4dp padding on all sides.
  static EdgeInsets get p4 => all(4);

  /// Provides 8dp padding on all sides.
  static EdgeInsets get p8 => all(8);

  /// Provides 12dp padding on all sides.
  static EdgeInsets get p12 => all(12);

  /// Provides 16dp padding on all sides.
  static EdgeInsets get p16 => all(16);

  /// Provides 20dp padding on all sides.
  static EdgeInsets get p20 => all(20);

  /// Provides 24dp padding on all sides.
  static EdgeInsets get p24 => all(24);

  /// Provides 32dp padding on all sides.
  static EdgeInsets get p32 => all(32);

  /// Provides 48dp padding on all sides.
  static EdgeInsets get p48 => all(48);

  /// Provides 64dp padding on all sides.
  static EdgeInsets get p64 => all(64);

  /// Provides 0dp padding on the right side.
  static EdgeInsets get pr0 => pr(0);

  /// Provides 4dp padding on the right side.
  static EdgeInsets get pr4 => pr(4);

  /// Provides 8dp padding on the right side.
  static EdgeInsets get pr8 => pr(8);

  /// Provides 12dp padding on the right side.
  static EdgeInsets get pr12 => pr(12);

  /// Provides 16dp padding on the right side.
  static EdgeInsets get pr16 => pr(16);

  /// Provides 20dp padding on the right side.
  static EdgeInsets get pr20 => pr(20);

  /// Provides 24dp padding on the right side.
  static EdgeInsets get pr24 => pr(24);

  /// Provides 32dp padding on the right side.
  static EdgeInsets get pr32 => pr(32);

  /// Provides 48dp padding on the right side.
  static EdgeInsets get pr48 => pr(48);

  /// Provides 64dp padding on the right side.
  static EdgeInsets get pr64 => pr(64);

  /// Provides 0dp padding on the left side.
  static EdgeInsets get pl0 => pl(0);

  /// Provides 4dp padding on the left side.
  static EdgeInsets get pl4 => pl(4);

  /// Provides 8dp padding on the left side.
  static EdgeInsets get pl8 => pl(8);

  /// Provides 12dp padding on the left side.
  static EdgeInsets get pl12 => pl(12);

  /// Provides 16dp padding on the left side.
  static EdgeInsets get pl16 => pl(16);

  /// Provides 20dp padding on the left side.
  static EdgeInsets get pl20 => pl(20);

  /// Provides 24dp padding on the left side.
  static EdgeInsets get pl24 => pl(24);

  /// Provides 32dp padding on the left side.
  static EdgeInsets get pl32 => pl(32);

  /// Provides 48dp padding on the left side.
  static EdgeInsets get pl48 => pl(48);

  /// Provides 64dp padding on the left side.
  static EdgeInsets get pl64 => pl(64);

  /// Provides 0dp padding on the top side.
  static EdgeInsets get pt0 => pt(0);

  /// Provides 4dp padding on the top side.
  static EdgeInsets get pt4 => pt(4);

  /// Provides 8dp padding on the top side.
  static EdgeInsets get pt8 => pt(8);

  /// Provides 12dp padding on the top side.
  static EdgeInsets get pt12 => pt(12);

  /// Provides 16dp padding on the top side.
  static EdgeInsets get pt16 => pt(16);

  /// Provides 20dp padding on the top side.
  static EdgeInsets get pt20 => pt(20);

  /// Provides 24dp padding on the top side.
  static EdgeInsets get pt24 => pt(24);

  /// Provides 32dp padding on the top side.
  static EdgeInsets get pt32 => pt(32);

  /// Provides 48dp padding on the top side.
  static EdgeInsets get pt48 => pt(48);

  /// Provides 64dp padding on the top side.
  static EdgeInsets get pt64 => pt(64);

  /// Provides 0dp padding on the bottom side.
  static EdgeInsets get pb0 => pb(0);

  /// Provides 4dp padding on the bottom side.
  static EdgeInsets get pb4 => pb(4);

  /// Provides 8dp padding on the bottom side.
  static EdgeInsets get pb8 => pb(8);

  /// Provides 12dp padding on the bottom side.
  static EdgeInsets get pb12 => pb(12);

  /// Provides 16dp padding on the bottom side.
  static EdgeInsets get pb16 => pb(16);

  /// Provides 20dp padding on the bottom side.
  static EdgeInsets get pb20 => pb(20);

  /// Provides 24dp padding on the bottom side.
  static EdgeInsets get pb24 => pb(24);

  /// Provides 32dp padding on the bottom side.
  static EdgeInsets get pb32 => pb(32);

  /// Provides 48dp padding on the bottom side.
  static EdgeInsets get pb48 => pb(48);

  /// Provides 64dp padding on the bottom side.
  static EdgeInsets get pb64 => pb(64);

  /// Provides 4dp padding horizontally.
  static EdgeInsets get px4 => px(4);

  /// Provides 8dp padding horizontally.
  static EdgeInsets get px8 => px(8);

  /// Provides 12dp padding horizontally.
  static EdgeInsets get px12 => px(12);

  /// Provides 16dp padding horizontally.
  static EdgeInsets get px16 => px(16);

  /// Provides 20dp padding horizontally.
  static EdgeInsets get px20 => px(20);

  /// Provides 24dp padding horizontally.
  static EdgeInsets get px24 => px(24);

  /// Provides 32dp padding horizontally.
  static EdgeInsets get px32 => px(32);

  /// Provides 48dp padding horizontally.
  static EdgeInsets get px48 => px(48);

  /// Provides 64dp padding horizontally.
  static EdgeInsets get px64 => px(64);

  /// Provides 4dp padding vertically.
  static EdgeInsets get py4 => py(4);

  /// Provides 8dp padding vertically.
  static EdgeInsets get py8 => py(8);

  /// Provides 12dp padding vertically.
  static EdgeInsets get py12 => py(12);

  /// Provides 16dp padding vertically.
  static EdgeInsets get py16 => py(16);

  /// Provides 20dp padding vertically.
  static EdgeInsets get py20 => py(20);

  /// Provides 24dp padding vertically.
  static EdgeInsets get py24 => py(24);

  /// Provides 32dp padding vertically.
  static EdgeInsets get py32 => py(32);

  /// Provides 48dp padding vertically.
  static EdgeInsets get py48 => py(48);

  /// Provides 64dp padding vertically.
  static EdgeInsets get py64 => py(64);

  /// Internal method to create EdgeInsets with various padding options.
  ///
  /// This method is used by other public methods to create EdgeInsets objects.
  /// It allows for flexible padding creation based on the provided parameters.
  ///
  /// [all]: Padding for all sides.
  /// [h]: Horizontal padding.
  /// [v]: Vertical padding.
  /// [top], [bottom], [left], [right]: Individual side padding.
  static EdgeInsets _pad({
    double? all,
    double? h,
    double? v,
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) =>
      EdgeInsets.only(
        top: top ?? v ?? all ?? 0.0,
        bottom: bottom ?? v ?? all ?? 0.0,
        left: left ?? h ?? all ?? 0.0,
        right: right ?? h ?? all ?? 0.0,
      );
}
