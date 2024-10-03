import 'dart:async';

import 'package:flutter/material.dart';

/// Enum representing the theme of the shimmer effect.
enum ShimmerTheme {
  /// Light theme for the shimmer effect.
  light,

  /// Dark theme for the shimmer effect.
  dark,
}

/// A widget that displays a shimmer effect.
class FxShimmer extends StatefulWidget {
  /// The color to use for the shimmer highlight.
  final Color? highlightColor;

  /// The color to use for the shimmer base.
  final Color? baseColor;

  /// The radius of the shimmer container.
  final double radius;

  /// The width of the shimmer container.
  final double width;

  /// The height of the shimmer container.
  final double height;

  /// The theme of the shimmer effect.
  ///
  /// If specified, overrides [highlightColor] and [baseColor].
  final ShimmerTheme? theme;

  /// The delay time before updating the color.
  ///
  /// Use this to make loading items animate following each other instead of in parallel.
  final Duration delay;

  /// Creates a shimmer container widget.
  const FxShimmer({
    Key? key,
    this.delay = Duration.zero,
    this.radius = 0,
    this.theme,
    this.highlightColor,
    this.baseColor,
    this.width = double.infinity,
    this.height = 80,
  }) : super(key: key);

  /// Creates a round shimmer container widget.
  factory FxShimmer.round({
    Key? key,
    required double size,
    Color? highlightColor,
    Duration delay = Duration.zero,
    Color? baseColor,
    ShimmerTheme? theme,
  }) =>
      FxShimmer(
        key: key,
        height: size,
        width: size,
        radius: size / 2,
        baseColor: baseColor,
        highlightColor: highlightColor,
        theme: theme,
        delay: delay,
      );

  @override
  _FxShimmerState createState() => _FxShimmerState();
}

class _FxShimmerState extends State<FxShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _colorAnimation = ColorTween(
      begin: _getBaseColor(),
      end: _getHighlightColor(),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _startAnimation();
  }

  void _startAnimation() async {
    if (widget.delay != Duration.zero) {
      await Future.delayed(widget.delay);
    }
    if (mounted) {
      _controller.repeat(reverse: true);
    }
  }

  Color _getBaseColor() {
    return widget.theme == ShimmerTheme.light
        ? const Color(0xffE6E8EB)
        : widget.theme == ShimmerTheme.dark
            ? const Color(0xff2A2C2E)
            : widget.baseColor ?? Colors.grey.shade300;
  }

  Color _getHighlightColor() {
    return widget.theme == ShimmerTheme.light
        ? const Color(0xffF9F9FB)
        : widget.theme == ShimmerTheme.dark
            ? const Color(0xff3A3E3F)
            : widget.highlightColor ?? Colors.grey.shade100;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: _colorAnimation.value,
            borderRadius: BorderRadius.circular(widget.radius),
          ),
        );
      },
    );
  }
}
