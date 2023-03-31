import 'package:flutter/material.dart';
import '../../../quickly.dart';

/// Extension class to apply shimmer effect to any widget.
extension ShimmerExtension on Widget {
  /// Apply shimmer effect to the widget.
  ///
  /// [height] is the height of the shimmer container. Default is 200.0.
  /// [width] is the width of the shimmer container. Default is double.infinity.
  /// [highlightColor] is the highlight color of the shimmer effect. Default is FxColor.gray300.
  /// [baseColor] is the base color of the shimmer effect. Default is FxColor.gray400.
  ///
  /// Returns a [Container] widget with the shimmer effect applied to the original widget.
  Widget shimmer({
    double height = 200.0,
    double width = double.infinity,
    Color highlightColor = FxColor.gray300,
    Color baseColor = FxColor.gray400,
  }) {
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: <Widget>[
          // Add shimmer gradient
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    highlightColor,
                    baseColor,
                    highlightColor,
                  ],
                ),
              ),
            ),
          ),
          // Add original widget
          Positioned.fill(
            child: this,
          ),
        ],
      ),
    );
  }
}
