import "package:flutter/material.dart";

/// A responsive widget that renders different UI components based on the screen width.
///
/// This widget allows you to provide different layouts for mobile, tablet, and desktop screens.
/// It determines the appropriate layout based on the screen width and the provided breakpoints.
class FxResponsive extends StatelessWidget {
  /// Constructs a `FxResponsive` widget.
  ///
  /// The [mobile] widget is rendered for screens below the tablet breakpoint.
  /// The [desktop] widget is rendered for screens above or equal to the desktop breakpoint.
  /// The [tablet] widget, if provided, is rendered for screens between the tablet and desktop breakpoints.
  ///
  /// The [key] parameter is an optional key that can be used to identify and differentiate this widget.
  const FxResponsive({
    required this.mobile,
    required this.desktop,
    super.key,
    this.tablet,
  });

  /// The widget to be rendered for mobile screens.
  final Widget mobile;

  /// The widget to be rendered for desktop screens.
  final Widget desktop;

  /// The widget to be rendered for tablet screens.
  /// If not provided, the [mobile] widget will be used for tablet screens.
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
