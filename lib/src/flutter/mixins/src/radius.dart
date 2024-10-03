import 'package:flutter/material.dart';

/// A mixin that provides easy access to predefined border radius values.
///
/// This mixin contains static methods and getters to create various [BorderRadius] objects
/// for different use cases in UI design.
mixin FxRadius {
  /// Creates a [BorderRadius] with custom values for each corner of a rectangle.
  ///
  /// [topLeft], [topRight], [bottomLeft], [bottomRight]: Radius values for respective corners.
  /// Returns a [BorderRadius] object with the specified corner radii.
  static BorderRadius only({
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
  }) =>
      _copyWith(
        topLeft: topLeft,
        topRight: topRight,
        bottomLeft: bottomLeft,
        bottomRight: bottomRight,
      );

  /// Creates a [BorderRadius] with the same value for all corners of a rectangle.
  ///
  /// [radius]: The radius value to be applied to all corners.
  /// Returns a [BorderRadius] object with uniform corner radii.
  static BorderRadius all(double radius) => _copyWith(all: radius);

  /// Provides a [BorderRadius] with no rounded corners.
  ///
  /// Returns a [BorderRadius] object with zero radius for all corners.
  static BorderRadius get none => _copyWith(all: 0);

  /// Creates a [BorderRadius] for the top-left corner of a rectangle.
  ///
  /// [radius]: The radius value for the top-left corner.
  /// Returns a [BorderRadius] object with the specified top-left radius.
  static BorderRadius topLeft(double radius) => _copyWith(topLeft: radius);

  /// Creates a [BorderRadius] for the top-right corner of a rectangle.
  ///
  /// [radius]: The radius value for the top-right corner.
  /// Returns a [BorderRadius] object with the specified top-right radius.
  static BorderRadius topRight(double radius) => _copyWith(topRight: radius);

  /// Creates a [BorderRadius] for the bottom-left corner of a rectangle.
  ///
  /// [radius]: The radius value for the bottom-left corner.
  /// Returns a [BorderRadius] object with the specified bottom-left radius.
  static BorderRadius bottomLeft(double radius) =>
      _copyWith(bottomLeft: radius);

  /// Creates a [BorderRadius] for the bottom-right corner of a rectangle.
  ///
  /// [radius]: The radius value for the bottom-right corner.
  /// Returns a [BorderRadius] object with the specified bottom-right radius.
  static BorderRadius bottomRight(double radius) =>
      _copyWith(bottomRight: radius);

  /// Creates a [BorderRadius] for all corners except the top-left corner of a rectangle.
  ///
  /// [radius]: The radius value to be applied to the other three corners.
  /// Returns a [BorderRadius] object with the specified radii.
  static BorderRadius notTopLeft(double radius) =>
      _copyWith(topRight: radius, bottomLeft: radius, bottomRight: radius);

  /// Creates a [BorderRadius] for all corners except the top-right corner of a rectangle.
  ///
  /// [radius]: The radius value to be applied to the other three corners.
  /// Returns a [BorderRadius] object with the specified radii.
  static BorderRadius notTopRight(double radius) =>
      _copyWith(topLeft: radius, bottomLeft: radius, bottomRight: radius);

  /// Creates a [BorderRadius] for all corners except the bottom-left corner of a rectangle.
  ///
  /// [radius]: The radius value to be applied to the other three corners.
  /// Returns a [BorderRadius] object with the specified radii.
  static BorderRadius notBottomLeft(double radius) =>
      _copyWith(bottomRight: radius, topLeft: radius, topRight: radius);

  /// Creates a [BorderRadius] for all corners except the bottom-right corner of a rectangle.
  ///
  /// [radius]: The radius value to be applied to the other three corners.
  /// Returns a [BorderRadius] object with the specified radii.
  static BorderRadius notBottomRight(double radius) =>
      _copyWith(bottomLeft: radius, topLeft: radius, topRight: radius);

  /// Creates a [BorderRadius] for the top side of a rectangle.
  ///
  /// [radius]: The radius value to be applied to the top corners.
  /// Returns a [BorderRadius] object with the specified top radii.
  static BorderRadius top(double radius) =>
      _copyWith(topLeft: radius, topRight: radius);

  /// Creates a [BorderRadius] for the bottom side of a rectangle.
  ///
  /// [radius]: The radius value to be applied to the bottom corners.
  /// Returns a [BorderRadius] object with the specified bottom radii.
  static BorderRadius bottom(double radius) =>
      _copyWith(bottomLeft: radius, bottomRight: radius);

  /// Creates a [BorderRadius] for the left side of a rectangle.
  ///
  /// [radius]: The radius value to be applied to the left corners.
  /// Returns a [BorderRadius] object with the specified left radii.
  static BorderRadius left(double radius) =>
      _copyWith(topLeft: radius, bottomLeft: radius);

  /// Creates a [BorderRadius] for the right side of a rectangle.
  ///
  /// [radius]: The radius value to be applied to the right corners.
  /// Returns a [BorderRadius] object with the specified right radii.
  static BorderRadius right(double radius) =>
      _copyWith(topRight: radius, bottomRight: radius);

  /// Provides a [BorderRadius] of 5 for all corners.
  static BorderRadius get r5 => all(5);

  /// Provides a [BorderRadius] of 10 for all corners.
  static BorderRadius get r10 => all(10);

  /// Provides a [BorderRadius] of 20 for all corners.
  static BorderRadius get r20 => all(20);

  /// Provides a [BorderRadius] of 30 for all corners.
  static BorderRadius get r30 => all(30);

  /// Provides a [BorderRadius] of 50 for all corners.
  static BorderRadius get r50 => all(50);

  /// Provides a [BorderRadius] of 5 for the top corners.
  static BorderRadius get top5 => top(5);

  /// Provides a [BorderRadius] of 10 for the top corners.
  static BorderRadius get top10 => top(10);

  /// Provides a [BorderRadius] of 20 for the top corners.
  static BorderRadius get top20 => top(20);

  /// Provides a [BorderRadius] of 30 for the top corners.
  static BorderRadius get top30 => top(30);

  /// Provides a [BorderRadius] of 50 for the top corners.
  static BorderRadius get top50 => top(50);

  /// Provides a [BorderRadius] of 5 for the left corners.
  static BorderRadius get left5 => left(5);

  /// Provides a [BorderRadius] of 10 for the left corners.
  static BorderRadius get left10 => left(10);

  /// Provides a [BorderRadius] of 20 for the left corners.
  static BorderRadius get left20 => left(20);

  /// Provides a [BorderRadius] of 30 for the left corners.
  static BorderRadius get left30 => left(30);

  /// Provides a [BorderRadius] of 50 for the left corners.
  static BorderRadius get left50 => left(50);

  /// Provides a [BorderRadius] of 5 for the right corners.
  static BorderRadius get right5 => right(5);

  /// Provides a [BorderRadius] of 10 for the right corners.
  static BorderRadius get right10 => right(10);

  /// Provides a [BorderRadius] of 20 for the right corners.
  static BorderRadius get right20 => right(20);

  /// Provides a [BorderRadius] of 30 for the right corners.
  static BorderRadius get right30 => right(30);

  /// Provides a [BorderRadius] of 50 for the right corners.
  static BorderRadius get right50 => right(50);

  /// Provides a [BorderRadius] of 5 for the bottom corners.
  static BorderRadius get bottom5 => bottom(5);

  /// Provides a [BorderRadius] of 10 for the bottom corners.
  static BorderRadius get bottom10 => bottom(10);

  /// Provides a [BorderRadius] of 20 for the bottom corners.
  static BorderRadius get bottom20 => bottom(20);

  /// Provides a [BorderRadius] of 30 for the bottom corners.
  static BorderRadius get bottom30 => bottom(30);

  /// Provides a [BorderRadius] of 50 for the bottom corners.
  static BorderRadius get bottom50 => bottom(50);

  /// Provides a [BorderRadius] of 5 for the top-left corner.
  static BorderRadius get topLeft5 => topLeft(5);

  /// Provides a [BorderRadius] of 10 for the top-left corner.
  static BorderRadius get topLeft10 => topLeft(10);

  /// Provides a [BorderRadius] of 20 for the top-left corner.
  static BorderRadius get topLeft20 => topLeft(20);

  /// Provides a [BorderRadius] of 30 for the top-left corner.
  static BorderRadius get topLeft30 => topLeft(30);

  /// Provides a [BorderRadius] of 50 for the top-left corner.
  static BorderRadius get topLeft50 => topLeft(50);

  /// Provides a [BorderRadius] of 5 for the top-right corner.
  static BorderRadius get topRight5 => topRight(5);

  /// Provides a [BorderRadius] of 10 for the top-right corner.
  static BorderRadius get topRight10 => topRight(10);

  /// Provides a [BorderRadius] of 20 for the top-right corner.
  static BorderRadius get topRight20 => topRight(20);

  /// Provides a [BorderRadius] of 30 for the top-right corner.
  static BorderRadius get topRight30 => topRight(30);

  /// Provides a [BorderRadius] of 50 for the top-right corner.
  static BorderRadius get topRight50 => topRight(50);

  /// Provides a [BorderRadius] of 5 for the bottom-left corner.
  static BorderRadius get bottomLeft5 => bottomLeft(5);

  /// Provides a [BorderRadius] of 10 for the bottom-left corner.
  static BorderRadius get bottomLeft10 => bottomLeft(10);

  /// Provides a [BorderRadius] of 20 for the bottom-left corner.
  static BorderRadius get bottomLeft20 => bottomLeft(20);

  /// Provides a [BorderRadius] of 30 for the bottom-left corner.
  static BorderRadius get bottomLeft30 => bottomLeft(30);

  /// Provides a [BorderRadius] of 50 for the bottom-left corner.
  static BorderRadius get bottomLeft50 => bottomLeft(50);

  /// Provides a [BorderRadius] of 5 for the bottom-right corner.
  static BorderRadius get bottomRight5 => bottomRight(5);

  /// Provides a [BorderRadius] of 10 for the bottom-right corner.
  static BorderRadius get bottomRight10 => bottomRight(10);

  /// Provides a [BorderRadius] of 20 for the bottom-right corner.
  static BorderRadius get bottomRight20 => bottomRight(20);

  /// Provides a [BorderRadius] of 30 for the bottom-right corner.
  static BorderRadius get bottomRight30 => bottomRight(30);

  /// Provides a [BorderRadius] of 50 for the bottom-right corner.
  static BorderRadius get bottomRight50 => bottomRight(50);

  /// Internal method to create a [BorderRadius] with specified corner values.
  ///
  /// This method is used by other public methods to create BorderRadius objects.
  /// It allows for flexible radius creation based on the provided parameters.
  ///
  /// [topLeft], [topRight], [bottomLeft], [bottomRight]: Individual corner radii.
  /// [all]: Radius for all corners if individual values are not specified.
  static BorderRadius _copyWith({
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
    double? all,
  }) =>
      BorderRadius.only(
        topLeft: Radius.circular(topLeft ?? all ?? 0),
        topRight: Radius.circular(topRight ?? all ?? 0),
        bottomLeft: Radius.circular(bottomLeft ?? all ?? 0),
        bottomRight: Radius.circular(bottomRight ?? all ?? 0),
      );
}
