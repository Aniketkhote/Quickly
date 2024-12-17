import 'package:flutter/material.dart';
import 'package:quickly/quickly.dart';

/// Provides predefined shadow configurations for Flutter widgets.
mixin FxShadow {
  /// Creates a custom single shadow.
  ///
  /// [color] The color of the shadow. Defaults to transparent if not specified.
  /// [blurRadius] The blur radius of the shadow. Defaults to 0.0 if not specified.
  /// [offset] The offset of the shadow. Defaults to Offset.zero if not specified.
  /// [spreadRadius] The spread radius of the shadow. Defaults to 0.0 if not specified.
  ///
  /// Returns a list containing a single [BoxShadow] with the specified properties.
  static List<BoxShadow> shadow({
    Color? color,
    double? blurRadius,
    Offset? offset,
    double? spreadRadius,
  }) =>
      _createShadow(
        blurRadius: blurRadius,
        color: color,
        offset: offset,
        spreadRadius: spreadRadius,
      );

  /// Provides a configuration for no shadow.
  ///
  /// Returns an empty list of [BoxShadow], effectively applying no shadow.
  static List<BoxShadow> get none => [];

  /// Provides a configuration for a subtle shadow.
  ///
  /// Returns a list containing a single [BoxShadow] with a very light shadow effect.
  static List<BoxShadow> get subtle => _createShadow(
        color: FxColor.dark.withValues(alpha: 0.05),
        blurRadius: 4.0,
        offset: const Offset(0.0, 2.0),
      );

  /// Provides a configuration for a light shadow.
  ///
  /// Returns a list containing a single [BoxShadow] with a light shadow effect.
  static List<BoxShadow> get light => _createShadow(
        color: FxColor.dark.withValues(alpha: 0.1),
        blurRadius: 6.0,
        offset: const Offset(0.0, 3.0),
      );

  /// Provides a configuration for a normal shadow.
  ///
  /// Returns a list containing a single [BoxShadow] with a standard shadow effect.
  static List<BoxShadow> get normal => _createShadow(
        color: FxColor.dark.withValues(alpha: 0.15),
        blurRadius: 8.0,
        offset: const Offset(0.0, 4.0),
      );

  /// Provides a configuration for a medium shadow.
  ///
  /// Returns a list containing a single [BoxShadow] with a moderately strong shadow effect.
  static List<BoxShadow> get medium => _createShadow(
        color: FxColor.dark.withValues(alpha: 0.2),
        blurRadius: 10.0,
        offset: const Offset(0.0, 6.0),
      );

  /// Provides a configuration for a strong shadow.
  ///
  /// Returns a list containing a single [BoxShadow] with a strong shadow effect.
  static List<BoxShadow> get strong => _createShadow(
        color: FxColor.dark.withValues(alpha: 0.25),
        blurRadius: 12.0,
        offset: const Offset(0.0, 8.0),
        spreadRadius: 1.0,
      );

  /// Provides a configuration for a deep shadow.
  ///
  /// Returns a list containing a single [BoxShadow] with a very strong shadow effect.
  static List<BoxShadow> get deep => _createShadow(
        color: FxColor.dark.withValues(alpha: 0.3),
        blurRadius: 16.0,
        offset: const Offset(0.0, 12.0),
        spreadRadius: 2.0,
      );

  /// Internal method to create a [BoxShadow] with specified properties.
  ///
  /// [color] The color of the shadow. Defaults to transparent if not specified.
  /// [blurRadius] The blur radius of the shadow. Defaults to 0.0 if not specified.
  /// [spreadRadius] The spread radius of the shadow. Defaults to 0.0 if not specified.
  /// [offset] The offset of the shadow. Defaults to Offset.zero if not specified.
  ///
  /// Returns a list containing a single [BoxShadow] with the specified properties.
  static List<BoxShadow> _createShadow({
    Color? color,
    double? blurRadius,
    double? spreadRadius,
    Offset? offset,
  }) =>
      <BoxShadow>[
        BoxShadow(
          blurRadius: blurRadius ?? 0.0,
          color: color ?? Colors.transparent,
          offset: offset ?? Offset.zero,
          spreadRadius: spreadRadius ?? 0.0,
        )
      ];
}
