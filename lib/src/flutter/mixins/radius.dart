import 'package:flutter/material.dart';

///Border radius to easliy get predefined radius.
mixin FxRadius {
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
  static BorderRadius get r5 => all(5);

  ///Gives [BorderRadius] 10 for all sides
  static BorderRadius get r10 => all(10);

  ///Gives [BorderRadius] 20 for all sides
  static BorderRadius get r20 => all(20);

  ///Gives [BorderRadius] 30 for all sides
  static BorderRadius get r30 => all(30);

  ///Gives [BorderRadius] 50 for all sides
  static BorderRadius get r50 => all(50);

  ///Gives [BorderRadius] 5 for the top side.
  static BorderRadius get top5 => top(5);

  ///Gives [BorderRadius] 10 for the top side.
  static BorderRadius get top10 => top(10);

  ///Gives [BorderRadius] 20 for the top side.
  static BorderRadius get top20 => top(20);

  ///Gives [BorderRadius] 30 for the top side.
  static BorderRadius get top30 => top(30);

  ///Gives [BorderRadius] 50 for the top side.
  static BorderRadius get top50 => top(50);

  ///Gives [BorderRadius] 5 for the left side.
  static BorderRadius get left5 => left(5);

  ///Gives [BorderRadius] 10 for the left side.
  static BorderRadius get left10 => left(10);

  ///Gives [BorderRadius] 20 for the left side.
  static BorderRadius get left20 => left(20);

  ///Gives [BorderRadius] 30 for the left side.
  static BorderRadius get left30 => left(30);

  ///Gives [BorderRadius] 50 for the left side.
  static BorderRadius get left50 => left(50);

  ///Gives [BorderRadius] 5 for the right side.
  static BorderRadius get right5 => right(5);

  ///Gives [BorderRadius] 10 for the right side.
  static BorderRadius get right10 => right(10);

  ///Gives [BorderRadius] 20 for the right side.
  static BorderRadius get right20 => right(20);

  ///Gives [BorderRadius] 30 for the right side.
  static BorderRadius get right30 => right(30);

  ///Gives [BorderRadius] 50 for the right side.
  static BorderRadius get right50 => right(50);

  ///Gives [BorderRadius] 5 for the bottom side.
  static BorderRadius get bottom5 => bottom(5);

  ///Gives [BorderRadius] 10 for the bottom side.
  static BorderRadius get bottom10 => bottom(10);

  ///Gives [BorderRadius] 20 for the bottom side.
  static BorderRadius get bottom20 => bottom(20);

  ///Gives [BorderRadius] 30 for the bottom side.
  static BorderRadius get bottom30 => bottom(30);

  ///Gives [BorderRadius] 50 for the bottom side.
  static BorderRadius get bottom50 => bottom(50);

  ///Gives [BorderRadius] 5 for top left side
  static BorderRadius get topLeftl5 => topLeft(5);

  ///Gives [BorderRadius] 10 for top left side
  static BorderRadius get topLeft10 => topLeft(10);

  ///Gives [BorderRadius] 20 for top left side
  static BorderRadius get topLeft20 => topLeft(20);

  ///Gives [BorderRadius] 30 for top left side
  static BorderRadius get topLeft30 => topLeft(30);

  ///Gives [BorderRadius] 50 for top left side
  static BorderRadius get topLeft50 => topLeft(50);

  ///Gives [BorderRadius] 5 for top right side
  static BorderRadius get topRight5 => topRight(5);

  ///Gives [BorderRadius] 10 for top right side
  static BorderRadius get topRight10 => topRight(10);

  ///Gives [BorderRadius] 20 for top right side
  static BorderRadius get topRight20 => topRight(20);

  ///Gives [BorderRadius] 30 for top right side
  static BorderRadius get topRight30 => topRight(30);

  ///Gives [BorderRadius] 50 for top right side
  static BorderRadius get topRight50 => topRight(50);

  ///Gives [BorderRadius] 5 for bottom left side
  static BorderRadius get bottomLeft5 => bottomLeft(5);

  ///Gives [BorderRadius] 10 for bottom left side
  static BorderRadius get bottomLeft10 => bottomLeft(10);

  ///Gives [BorderRadius] 20 for bottom left side
  static BorderRadius get bottomLeft20 => bottomLeft(20);

  ///Gives [BorderRadius] 30 for bottom left side
  static BorderRadius get bottomLeft30 => bottomLeft(30);

  ///Gives [BorderRadius] 50 for bottom left side
  static BorderRadius get bottomLeft50 => bottomLeft(50);

  ///Gives [BorderRadius] 5 for bottom right side
  static BorderRadius get bottomRight5 => bottomRight(5);

  ///Gives [BorderRadius] 10 for bottom right side
  static BorderRadius get bottomRight10 => bottomRight(10);

  ///Gives [BorderRadius] 20 for bottom right side
  static BorderRadius get bottomRight20 => bottomRight(20);

  ///Gives [BorderRadius] 30 for bottom right side
  static BorderRadius get bottomRight30 => bottomRight(30);

  ///Gives [BorderRadius] 50 for bottom right side
  static BorderRadius get bottomRight50 => bottomRight(50);

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
