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
    Duration duration = const Duration(milliseconds: 1000),
    Duration interval = const Duration(milliseconds: 500),
    Gradient? gradient,
    Axis direction = Axis.horizontal,
  }) {
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: <Widget>[
          // Add shimmer gradient
          Container(
            decoration: BoxDecoration(
              gradient: gradient ??
                  LinearGradient(
                    begin: direction == Axis.horizontal
                        ? Alignment.centerLeft
                        : Alignment.topCenter,
                    end: direction == Axis.horizontal
                        ? Alignment.centerRight
                        : Alignment.bottomCenter,
                    colors: <Color>[
                      highlightColor,
                      baseColor,
                      highlightColor,
                    ],
                  ),
            ),
            child: AnimatedContainer(
              duration: duration,
              decoration: BoxDecoration(
                gradient: gradient,
              ),
              child: AnimatedOpacity(
                duration: duration,
                opacity: 0.5,
                child: const SizedBox.expand(),
              ),
            ),
          ),
          // Add original widget
          this,
        ],
      ),
    );
  }
}
