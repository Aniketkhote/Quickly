import 'package:flutter/material.dart';

/// Extension to add opacity functionality to a widget.
extension OpacityExtension on Widget {
  /// Wraps the widget in an [Opacity] widget with the given opacity.
  ///
  /// The [opacity] argument must be between 0.0 and 1.0, inclusive, and must not be null.
  /// This method allows for fine-grained control over the widget's opacity.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').opacity(0.5)
  /// ```
  Opacity opacity(double opacity) => Opacity(opacity: opacity, child: this);

  /// Returns the widget with 0% opacity, making it fully invisible.
  ///
  /// This is equivalent to calling `opacity(0.0)`.
  /// The widget will still take up space in the layout, but will not be visible.
  Opacity get opacity0 => opacity(0.0);

  /// Returns the widget with 10% opacity.
  ///
  /// This is equivalent to calling `opacity(0.10)`.
  /// Useful for creating very faint or ghost-like appearances.
  Opacity get opacity10 => opacity(0.10);

  /// Returns the widget with 20% opacity.
  ///
  /// This is equivalent to calling `opacity(0.20)`.
  /// Provides a slightly more visible appearance than opacity10.
  Opacity get opacity20 => opacity(0.20);

  /// Returns the widget with 25% opacity.
  ///
  /// This is equivalent to calling `opacity(0.25)`.
  /// Represents one-quarter opacity, useful for subtle visual effects.
  Opacity get opacity25 => opacity(0.25);

  /// Returns the widget with 50% opacity, making it half visible.
  ///
  /// This is equivalent to calling `opacity(0.50)`.
  /// Creates a semi-transparent effect, balancing visibility and transparency.
  Opacity get opacity50 => opacity(0.50);

  /// Returns the widget with 75% opacity.
  ///
  /// This is equivalent to calling `opacity(0.75)`.
  /// Provides a mostly opaque appearance with slight transparency.
  Opacity get opacity75 => opacity(0.75);

  /// Returns the widget with 100% opacity, making it fully visible.
  ///
  /// This is equivalent to calling `opacity(1.0)`.
  /// The widget will be displayed normally without any transparency.
  Opacity get opacity100 => opacity(1.0);
}
