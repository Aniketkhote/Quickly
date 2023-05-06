import 'package:flutter/material.dart';

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
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth >= 1100) {
          return desktop;
        } else if (constraints.maxWidth >= 850) {
          return tablet ?? mobile;
        } else {
          return mobile;
        }
      },
    );
  }
}
