import 'package:flutter/material.dart';

///Radius extension to extend Container functionality
extension RadiusExtension on Widget {
  /// The `withRounded` getter adds rounded corners to the `Container` with a specified radius.
  ///
  /// The radius can be defined as a double value, and it will be applied to all corners of the `Container`.
  ClipRRect withRounded({required double radius}) => _rounded(radius: radius);

  /// The `roundedNone` getter removes the border radius from the `Container`, making it square.
  ClipRRect get roundedNone => _rounded(radius: 0);

  /// The `roundedFull` getter applies a circular border radius to the `Container`, making it a full circle.
  ClipRRect get roundedFull => _rounded(radius: 999999);

  /// The `roundedXs` getter applies a border radius of 5 dp to the `Container`, making it slightly rounded.
  ClipRRect get roundedXs => _rounded(radius: 5);

  /// The `roundedSm` getter applies a border radius of 10 dp to the `Container`, making it more rounded.
  ClipRRect get roundedSm => _rounded(radius: 10);

  /// The `rounded` getter applies a border radius of 15 dp to the `Container`, making it even more rounded.
  ClipRRect get rounded => _rounded(radius: 15);

  /// The `roundedMd` getter applies a border radius of 20 dp to the `Container`, making it even more rounded.
  ClipRRect get roundedMd => _rounded(radius: 20);

  /// The `roundedLg` getter applies a border radius of 25 dp to the `Container`, making it even more rounded.
  ClipRRect get roundedLg => _rounded(radius: 25);

  /// The `roundedXl` getter applies a border radius of 30 dp to the `Container`, making it even more rounded.
  ClipRRect get roundedXl => _rounded(radius: 30);

  ClipRRect _rounded({required double radius}) =>
      ClipRRect(borderRadius: BorderRadius.circular(radius), child: this);
}
