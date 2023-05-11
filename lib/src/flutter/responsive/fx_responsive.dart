import 'package:flutter/material.dart';

/// A responsive widget that renders different UI components based on the screen width.
class FxResponsive extends StatelessWidget {
  const FxResponsive({
    required this.mobile,
    required this.desktop,
    this.tablet,
    Key? key,
  }) : super(key: key);

  final Widget mobile;
  final Widget desktop;
  final Widget? tablet;

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    final double maxWidth = orientation == Orientation.landscape
        ? MediaQuery.of(context).size.height
        : MediaQuery.of(context).size.width;

    if (maxWidth >= 1100) {
      return desktop;
    } else if (maxWidth >= 850) {
      return tablet ?? mobile;
    } else {
      return mobile;
    }
  }
}
