import 'package:flutter/material.dart';

/// Extension on [Widget] to provide convenient alignment methods.
extension AlignExtension on Widget {
  /// Aligns the child widget within its parent.
  ///
  /// The [alignment] parameter controls both horizontal and vertical alignment.
  /// It defaults to [Alignment.center] if not specified.
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').align(Alignment.topLeft)
  /// ```
  Align align([Alignment alignment = Alignment.center]) => _align(alignment);

  /// Aligns the child widget to the bottom-right corner of its parent.
  ///
  /// Equivalent to using `align(Alignment.bottomRight)`.
  Align get bottomRight => _align(Alignment.bottomRight);

  /// Aligns the child widget to the bottom-left corner of its parent.
  ///
  /// Equivalent to using `align(Alignment.bottomLeft)`.
  Align get bottomLeft => _align(Alignment.bottomLeft);

  /// Aligns the child widget to the bottom-center of its parent.
  ///
  /// Equivalent to using `align(Alignment.bottomCenter)`.
  Align get bottomCenter => _align(Alignment.bottomCenter);

  /// Aligns the child widget to the top-right corner of its parent.
  ///
  /// Equivalent to using `align(Alignment.topRight)`.
  Align get topRight => _align(Alignment.topRight);

  /// Aligns the child widget to the top-left corner of its parent.
  ///
  /// Equivalent to using `align(Alignment.topLeft)`.
  Align get topLeft => _align(Alignment.topLeft);

  /// Aligns the child widget to the top-center of its parent.
  ///
  /// Equivalent to using `align(Alignment.topCenter)`.
  Align get topCenter => _align(Alignment.topCenter);

  /// Aligns the child widget to the center-right of its parent.
  ///
  /// Equivalent to using `align(Alignment.centerRight)`.
  Align get centerRight => _align(Alignment.centerRight);

  /// Aligns the child widget to the center-left of its parent.
  ///
  /// Equivalent to using `align(Alignment.centerLeft)`.
  Align get centerLeft => _align(Alignment.centerLeft);

  /// Internal method to create an [Align] widget with the specified alignment.
  ///
  /// This method is used by all other alignment methods in this extension.
  Align _align(Alignment alignment) => Align(alignment: alignment, child: this);
}
