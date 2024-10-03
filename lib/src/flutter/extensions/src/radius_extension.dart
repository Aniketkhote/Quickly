import 'package:flutter/material.dart';

/// Extension on [Widget] to add rounded corners functionality.
extension RadiusExtension on Widget {
  /// Adds rounded corners to the widget with a specified radius.
  ///
  /// [radius] is the radius to be applied to all corners of the widget.
  ///
  /// Returns a [ClipRRect] widget with the specified border radius.
  ClipRRect withRounded({required double radius}) => _rounded(radius: radius);

  /// Removes the border radius from the widget, making it square.
  ///
  /// Returns a [ClipRRect] widget with no border radius.
  ClipRRect get roundedNone => _rounded(radius: 0);

  /// Applies a circular border radius to the widget, making it a full circle.
  ///
  /// Returns a [ClipRRect] widget with a very large border radius, effectively making it circular.
  ClipRRect get roundedFull => _rounded(radius: double.infinity);

  /// Applies a border radius of 5 logical pixels to the widget, making it slightly rounded.
  ///
  /// Returns a [ClipRRect] widget with a border radius of 5 logical pixels.
  ClipRRect get roundedXs => _rounded(radius: 5);

  /// Applies a border radius of 10 logical pixels to the widget, making it more rounded.
  ///
  /// Returns a [ClipRRect] widget with a border radius of 10 logical pixels.
  ClipRRect get roundedSm => _rounded(radius: 10);

  /// Applies a border radius of 15 logical pixels to the widget.
  ///
  /// Returns a [ClipRRect] widget with a border radius of 15 logical pixels.
  ClipRRect get rounded => _rounded(radius: 15);

  /// Applies a border radius of 20 logical pixels to the widget.
  ///
  /// Returns a [ClipRRect] widget with a border radius of 20 logical pixels.
  ClipRRect get roundedMd => _rounded(radius: 20);

  /// Applies a border radius of 25 logical pixels to the widget.
  ///
  /// Returns a [ClipRRect] widget with a border radius of 25 logical pixels.
  ClipRRect get roundedLg => _rounded(radius: 25);

  /// Applies a border radius of 30 logical pixels to the widget.
  ///
  /// Returns a [ClipRRect] widget with a border radius of 30 logical pixels.
  ClipRRect get roundedXl => _rounded(radius: 30);

  /// Private method to create a [ClipRRect] with the specified border radius.
  ///
  /// [radius] is the radius to be applied to all corners of the widget.
  ///
  /// Returns a [ClipRRect] widget with the specified border radius.
  ClipRRect _rounded({required double radius}) =>
      ClipRRect(borderRadius: BorderRadius.circular(radius), child: this);
}
