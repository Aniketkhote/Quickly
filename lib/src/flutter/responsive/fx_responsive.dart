import 'package:flutter/material.dart';

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
  /// [breakpoints] allows customization of the width thresholds for different screen sizes.
  ///
  /// The [key] parameter is an optional key that can be used to identify and differentiate this widget.
  const FxResponsive({
    required this.mobile,
    required this.desktop,
    super.key,
    this.tablet,
    this.breakpoints = const FxResponsiveBreakpoints(),
  });

  /// The widget to be rendered for mobile screens.
  final Widget mobile;

  /// The widget to be rendered for desktop screens.
  final Widget desktop;

  /// The widget to be rendered for tablet screens.
  /// If not provided, the [mobile] widget will be used for tablet screens.
  final Widget? tablet;

  /// Customizable breakpoints for different screen sizes.
  final FxResponsiveBreakpoints breakpoints;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth >= breakpoints.desktop) {
      return desktop;
    } else if (screenWidth >= breakpoints.tablet) {
      return tablet ?? mobile;
    } else {
      return mobile;
    }
  }
}

/// Defines the breakpoints for different screen sizes.
class FxResponsiveBreakpoints {
  const FxResponsiveBreakpoints({
    this.tablet = 850,
    this.desktop = 1100,
  });

  /// The minimum width for a tablet layout.
  final double tablet;

  /// The minimum width for a desktop layout.
  final double desktop;
}
