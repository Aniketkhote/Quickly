import 'package:flutter/material.dart';

///Border radius to easliy get predefined radius.
abstract class FxRadius {
  ///Gives [BorderRadius] for each corner of a rectangle.
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

  ///Gives [BorderRadius] for each corner of a rectangle.
  static BorderRadius all(double radius) => _copyWith(all: radius);

  ///Removes [BorderRadius] from all sides of a rectangle.
  static BorderRadius get none => _copyWith(all: 0);

  ///Gives [BorderRadius] to [topLeft] corner of a rectangle.
  static BorderRadius topLeft(double radius) => _copyWith(topLeft: radius);

  ///Gives [BorderRadius] to [topRight] corner of a rectangle.
  static BorderRadius topRight(double radius) => _copyWith(topRight: radius);

  ///Gives [BorderRadius]to [bottomLeft] corner of a rectangle.
  static BorderRadius bottomLeft(double radius) =>
      _copyWith(bottomLeft: radius);

  ///Gives [BorderRadius] to [bottomRight] corner of a rectangle.
  static BorderRadius bottomRight(double radius) =>
      _copyWith(bottomRight: radius);

  ///Gives [BorderRadius] to all side except [topLeft] corner of a rectangle.
  static BorderRadius notTopLeft(double radius) =>
      _copyWith(topRight: radius, bottomLeft: radius, bottomRight: radius);

  ///Gives [BorderRadius] to all side except [topRight] corner of a rectangle.
  static BorderRadius notTopRight(double radius) =>
      _copyWith(topLeft: radius, bottomLeft: radius, bottomRight: radius);

  ///Gives [BorderRadius] to all side except [bottomLeft] corner of a rectangle.
  static BorderRadius notBottomLeft(double radius) =>
      _copyWith(bottomRight: radius, topLeft: radius, topRight: radius);

  ///Gives [BorderRadius] to all side except [bottomRight] corner of a rectangle.
  static BorderRadius notBottomRight(double radius) =>
      _copyWith(bottomLeft: radius, topLeft: radius, topRight: radius);

  ///Gives [BorderRadius] to [top] side of a rectangle.
  static BorderRadius top(double radius) =>
      _copyWith(topLeft: radius, topRight: radius);

  ///Gives [BorderRadius] to [bottom] side of a rectangle.
  static BorderRadius bottom(double radius) =>
      _copyWith(bottomLeft: radius, bottomRight: radius);

  ///Gives [BorderRadius] to [left] side of a rectangle.
  static BorderRadius left(double radius) =>
      _copyWith(topLeft: radius, bottomLeft: radius);

  ///Gives [BorderRadius] to [right] side of a rectangle.
  static BorderRadius right(double radius) =>
      _copyWith(topRight: radius, bottomRight: radius);

  ///Gives [BorderRadius] 5 for all sides
  static BorderRadius get r5 => _copyWith(all: 5);

  ///Gives [BorderRadius] 10 for all sides
  static BorderRadius get r10 => _copyWith(all: 10);

  ///Gives [BorderRadius] 20 for all sides
  static BorderRadius get r20 => _copyWith(all: 20);

  ///Gives [BorderRadius] 30 for all sides
  static BorderRadius get r30 => _copyWith(all: 30);

  ///Gives [BorderRadius] 50 for all sides
  static BorderRadius get r50 => _copyWith(all: 50);

  ///Gives [BorderRadius] 5 for top left side
  static BorderRadius get topLeftl5 => _copyWith(topLeft: 5);

  ///Gives [BorderRadius] 10 for top left side
  static BorderRadius get topLeft10 => _copyWith(topLeft: 10);

  ///Gives [BorderRadius] 20 for top left side
  static BorderRadius get topLeft20 => _copyWith(topLeft: 20);

  ///Gives [BorderRadius] 30 for top left side
  static BorderRadius get topLeft30 => _copyWith(topLeft: 30);

  ///Gives [BorderRadius] 50 for top left side
  static BorderRadius get topLeft50 => _copyWith(topLeft: 50);

  ///Gives [BorderRadius] 5 for top right side
  static BorderRadius get topRight5 => _copyWith(topRight: 5);

  ///Gives [BorderRadius] 10 for top right side
  static BorderRadius get topRight10 => _copyWith(topRight: 10);

  ///Gives [BorderRadius] 20 for top right side
  static BorderRadius get topRight20 => _copyWith(topRight: 20);

  ///Gives [BorderRadius] 30 for top right side
  static BorderRadius get topRight30 => _copyWith(topRight: 30);

  ///Gives [BorderRadius] 50 for top right side
  static BorderRadius get topRight50 => _copyWith(topRight: 50);

  ///Gives [BorderRadius] 5 for bottom left side
  static BorderRadius get bottomLeft5 => _copyWith(bottomLeft: 5);

  ///Gives [BorderRadius] 10 for bottom left side
  static BorderRadius get bottomLeft10 => _copyWith(bottomLeft: 10);

  ///Gives [BorderRadius] 20 for bottom left side
  static BorderRadius get bottomLeft20 => _copyWith(bottomLeft: 20);

  ///Gives [BorderRadius] 30 for bottom left side
  static BorderRadius get bottomLeft30 => _copyWith(bottomLeft: 30);

  ///Gives [BorderRadius] 50 for bottom left side
  static BorderRadius get bottomLeft50 => _copyWith(bottomLeft: 50);

  ///Gives [BorderRadius] 5 for bottom right side
  static BorderRadius get bottomRight5 => _copyWith(bottomRight: 5);

  ///Gives [BorderRadius] 10 for bottom right side
  static BorderRadius get bottomRight10 => _copyWith(bottomRight: 10);

  ///Gives [BorderRadius] 20 for bottom right side
  static BorderRadius get bottomRight20 => _copyWith(bottomRight: 20);

  ///Gives [BorderRadius] 30 for bottom right side
  static BorderRadius get bottomRight30 => _copyWith(bottomRight: 30);

  ///Gives [BorderRadius] 50 for bottom right side
  static BorderRadius get bottomRight50 => _copyWith(bottomRight: 50);

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
