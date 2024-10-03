import 'package:flutter/material.dart';
import 'package:quickly/quickly.dart';

/// Extension class to apply shimmer effect to any widget.
extension ShimmerExtension on Widget {
  /// Apply shimmer effect to the widget.
  ///
  /// This method creates a shimmering effect over the original widget,
  /// which can be used to indicate a loading state or to add visual interest.
  ///
  /// Parameters:
  /// - [height]: The height of the shimmer container. Defaults to 200.0.
  /// - [width]: The width of the shimmer container. Defaults to double.infinity.
  /// - [highlightColor]: The highlight color of the shimmer effect. Defaults to FxColor.gray300.
  /// - [baseColor]: The base color of the shimmer effect. Defaults to FxColor.gray400.
  /// - [duration]: The duration of one complete shimmer animation cycle. Defaults to 1000 milliseconds.
  /// - [interval]: The interval between shimmer animation cycles. Defaults to 500 milliseconds.
  /// - [gradient]: Custom gradient to use for the shimmer effect. If null, a default gradient is used.
  /// - [direction]: The direction of the shimmer effect. Can be Axis.horizontal or Axis.vertical. Defaults to Axis.horizontal.
  ///
  /// Returns a [Widget] with the shimmer effect applied to the original widget.
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
          _buildShimmerGradient(
            highlightColor: highlightColor,
            baseColor: baseColor,
            duration: duration,
            gradient: gradient,
            direction: direction,
          ),
          this,
        ],
      ),
    );
  }

  /// Builds the shimmer gradient effect.
  ///
  /// This method creates the animated gradient that provides the shimmer effect.
  ///
  /// Parameters:
  /// - [highlightColor]: The highlight color of the shimmer effect.
  /// - [baseColor]: The base color of the shimmer effect.
  /// - [duration]: The duration of one complete shimmer animation cycle.
  /// - [gradient]: Custom gradient to use for the shimmer effect. If null, a default gradient is used.
  /// - [direction]: The direction of the shimmer effect.
  ///
  /// Returns a [Widget] representing the animated shimmer gradient.
  Widget _buildShimmerGradient({
    required Color highlightColor,
    required Color baseColor,
    required Duration duration,
    Gradient? gradient,
    required Axis direction,
  }) {
    return Container(
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
    );
  }
}
