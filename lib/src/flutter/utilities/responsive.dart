import 'package:flutter/material.dart';
import '../extensions.dart';

class FxResponsive extends StatelessWidget {
  const FxResponsive({
    required this.mobile,
    required this.desktop,
    this.tablet,
    Key? key,
  }) : super(key: key);

  /// If device width is more than 1100 then return desktop
  final Widget mobile;

  /// If device width it less then 1100 and more then 850 then return tablet
  final Widget? tablet;

  /// If device width is less then 850 then return mobile
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    if (context.isDesktop) {
      return desktop;
    } else if (context.isTablet) {
      return tablet!;
    } else {
      return mobile;
    }
  }
}
