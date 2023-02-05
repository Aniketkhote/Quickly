import 'package:flutter/material.dart';

/// Extension to add opacity functionality to a widget.
extension OpacityExtension on Widget {
  /// Wraps the widget in an [Opacity] widget with the given opacity.
  ///
  /// The [opacity] argument must be between 0.0 and 1.0 and must not be null.
  Opacity opacity(double opacity) => Opacity(child: this, opacity: opacity);

  /// Returns the widget with 0% opacity, making it fully invisible.
  Opacity get opacity0 => opacity(0.0);

  /// Returns the widget with 10% opacity.
  Opacity get opacity10 => opacity(0.10);

  /// Returns the widget with 20% opacity.
  Opacity get opacity20 => opacity(0.20);

  /// Returns the widget with 25% opacity.
  Opacity get opacity25 => opacity(0.25);

  /// Returns the widget with 50% opacity, making it half visible.
  Opacity get opacity50 => opacity(0.50);

  /// Returns the widget with 75% opacity.
  Opacity get opacity75 => opacity(0.75);

  /// Returns the widget with 100% opacity, making it fully visible.
  Opacity get opacity100 => opacity(1.0);
}
