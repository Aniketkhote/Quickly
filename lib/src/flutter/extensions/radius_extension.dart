import 'package:flutter/material.dart';
import 'package:quickly/quickly.dart';

///Radius extension to extend Container functionality
extension RadiusExtension on Container {
  /// Add rounded corner to a Container
  Container withRounded({required double radius}) =>
      _rounded(radius: FxRadius.all(radius));

  /// Removes `Border Radius` from Widget
  Container get roundedNone => _rounded(radius: FxRadius.none);

  /// Apply circular `Border Radius` to Widget
  Container get roundedFull => _rounded(radius: FxRadius.all(999999));

  /// Apply 5 dp circular `Border Radius` to Widget
  Container get roundedXs => _rounded(radius: FxRadius.all(5));

  /// Apply 10 dp circular `Border Radius` to Widget
  Container get roundedSm => _rounded(radius: FxRadius.all(10));

  /// Apply 15 dp circular `Border Radius` to Widget
  Container get rounded => _rounded(radius: FxRadius.all(15));

  /// Apply 20 dp circular `Border Radius` to Widget
  Container get roundedMd => _rounded(radius: FxRadius.all(20));

  /// Apply 25 dp circular `Border Radius` to Widget
  Container get roundedLg => _rounded(radius: FxRadius.all(25));

  /// Apply 30 dp circular `Border Radius` to Widget
  Container get roundedXl => _rounded(radius: FxRadius.all(30));

  Container _rounded({BorderRadius? radius}) => Container(
        decoration: BoxDecoration(borderRadius: radius),
        child: this,
      );
}
