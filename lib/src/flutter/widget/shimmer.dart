import 'dart:async';

import 'package:flutter/material.dart';

/// Enum representing the theme of the shimmer effect.
enum FadeTheme {
  /// Light theme for the shimmer effect.
  light,

  /// Dark theme for the shimmer effect.
  dark,
}

/// A widget that displays a shimmer effect.
class Shimmer extends StatefulWidget {
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
  final FadeTheme? fadeTheme;

  /// The delay time before updating the color.
  ///
  /// Use this to make loading items animate following each other instead of in parallel.
  final int millisecondsDelay;

  /// Creates a shimmer container widget.
  const Shimmer({
    Key? key,
    this.millisecondsDelay = 0,
    this.radius = 0,
    this.fadeTheme,
    this.highlightColor,
    this.baseColor,
    this.width = double.infinity,
    this.height = 80,
  }) : super(key: key);

  /// Creates a round shimmer container widget.
  factory Shimmer.round({
    Key? key,
    required double size,
    Color? highlightColor,
    int millisecondsDelay = 0,
    Color? baseColor,
    FadeTheme? fadeTheme,
  }) =>
      Shimmer(
        key: key,
        height: size,
        width: size,
        radius: size / 2,
        baseColor: baseColor,
        highlightColor: highlightColor,
        fadeTheme: fadeTheme,
        millisecondsDelay: millisecondsDelay,
      );

  @override
  _ShimmerState createState() => _ShimmerState();
}

class _ShimmerState extends State<Shimmer> {
  late StreamSubscription<bool> _subscription;
  bool _isHighLight = true;

  @override
  void initState() {
    super.initState();
    _subscription =
        Stream.periodic(const Duration(seconds: 1), (x) => x % 2 == 0)
            .listen((isHighLight) {
      if (widget.millisecondsDelay != 0) {
        Future.delayed(Duration(milliseconds: widget.millisecondsDelay), () {
          setState(() {
            _isHighLight = isHighLight;
          });
        });
      } else {
        setState(() {
          _isHighLight = isHighLight;
        });
      }
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final highLightColor = widget.fadeTheme == FadeTheme.light
        ? const Color(0xffF9F9FB)
        : widget.fadeTheme == FadeTheme.dark
            ? const Color(0xff3A3E3F)
            : widget.highlightColor ?? Colors.transparent;

    final baseColor = widget.fadeTheme == FadeTheme.light
        ? const Color(0xffE6E8EB)
        : widget.fadeTheme == FadeTheme.dark
            ? const Color(0xff2A2C2E)
            : widget.baseColor ?? Colors.transparent;

    return AnimatedContainer(
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 1200),
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: _isHighLight ? highLightColor : baseColor,
        borderRadius: BorderRadius.circular(widget.radius),
      ),
    );
  }
}
