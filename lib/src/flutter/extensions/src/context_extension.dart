import 'package:flutter/material.dart';

/// Extension on [BuildContext] to provide convenient access to various properties and methods.
extension ContextExtension on BuildContext {
  /// Returns the [MediaQueryData] for the current context.
  ///
  /// This is equivalent to calling [MediaQuery.of(this)].
  MediaQueryData get mq => MediaQuery.of(this);

  /// Returns the [Size] of the current screen.
  ///
  /// This is equivalent to calling [MediaQuery.sizeOf(this)].
  Size get size => MediaQuery.sizeOf(this);

  /// Returns the device pixel ratio of the current screen.
  ///
  /// This is equivalent to calling [MediaQuery.devicePixelRatioOf(this)].
  double get screenDensity => MediaQuery.devicePixelRatioOf(this);

  /// Returns the padding of the current screen.
  ///
  /// This is equivalent to calling [MediaQuery.paddingOf(this)].
  EdgeInsets get screenPadding => MediaQuery.paddingOf(this);

  /// Returns the width of the current screen.
  double get width => size.width;

  /// Returns the height of the current screen.
  double get height => size.height;

  /// Checks if the current window size is considered mobile.
  ///
  /// Returns true if the screen width is less than 650 logical pixels.
  bool get isMobile => width < 650;

  /// Checks if the current window size is considered tablet.
  ///
  /// Returns true if the screen width is between 650 and 1100 logical pixels.
  bool get isTablet => width < 1100 && width >= 650;

  /// Checks if the current window size is considered desktop.
  ///
  /// Returns true if the screen width is 1100 logical pixels or more.
  bool get isDesktop => width >= 1100;

  /// Returns the current orientation of the device.
  ///
  /// This is equivalent to calling [MediaQuery.orientationOf(this)].
  Orientation get orientation => MediaQuery.orientationOf(this);

  /// Checks if the device is in landscape mode.
  bool get isLandscape => orientation == Orientation.landscape;

  /// Checks if the device is in portrait mode.
  bool get isPortrait => orientation == Orientation.portrait;

  /// Returns the platform brightness.
  Brightness get brightness => mq.platformBrightness;

  /// Checks if the current theme is dark.
  bool get isDark => brightness == Brightness.dark;

  /// Checks if the current theme is light.
  bool get isLight => brightness == Brightness.light;

  /// Returns the current [ThemeData].
  ///
  /// This is equivalent to calling [Theme.of(this)].
  ThemeData get theme => Theme.of(this);

  /// Returns the current [TextTheme].
  ///
  /// This is equivalent to calling [Theme.of(this).textTheme].
  TextTheme get textTheme => theme.textTheme;

  /// Returns the [TextStyle] for body large text.
  TextStyle? get bodyLarge => textTheme.bodyLarge;

  /// Returns the [TextStyle] for body medium text.
  TextStyle? get bodyMedium => textTheme.bodyMedium;

  /// Returns the [TextStyle] for body small text.
  TextStyle? get bodySmall => textTheme.bodySmall;

  /// Returns the [TextStyle] for display large text.
  TextStyle? get displayLarge => textTheme.displayLarge;

  /// Returns the [TextStyle] for display medium text.
  TextStyle? get displayMedium => textTheme.displayMedium;

  /// Returns the [TextStyle] for display small text.
  TextStyle? get displaySmall => textTheme.displaySmall;

  /// Returns the [TextStyle] for label large text.
  TextStyle? get labelLarge => textTheme.labelLarge;

  /// Returns the [TextStyle] for label medium text.
  TextStyle? get labelMedium => textTheme.labelMedium;

  /// Returns the [TextStyle] for label small text.
  TextStyle? get labelSmall => textTheme.labelSmall;

  /// Returns the [TextStyle] for headline large text.
  TextStyle? get headlineLarge => textTheme.headlineLarge;

  /// Returns the [TextStyle] for headline medium text.
  TextStyle? get headlineMedium => textTheme.headlineMedium;

  /// Returns the [TextStyle] for headline small text.
  TextStyle? get headlineSmall => textTheme.headlineSmall;

  /// Returns the [TextStyle] for title large text.
  TextStyle? get titleLarge => textTheme.titleLarge;

  /// Returns the [TextStyle] for title medium text.
  TextStyle? get titleMedium => textTheme.titleMedium;

  /// Returns the [TextStyle] for title small text.
  TextStyle? get titleSmall => textTheme.titleSmall;

  /// Returns the device pixel ratio.
  ///
  /// This is equivalent to calling [MediaQuery.devicePixelRatioOf(this)].
  double get devicePixelRatio => MediaQuery.devicePixelRatioOf(this);

  /// Returns the text scaler.
  ///
  /// This is equivalent to calling [MediaQuery.textScalerOf(this)].
  TextScaler get textScaleFactor => MediaQuery.textScalerOf(this);

  /// Returns the nearest ancestor [NavigatorState].
  ///
  /// This is equivalent to calling [Navigator.of(this)].
  NavigatorState get navigator => Navigator.of(this);

  /// Shows a [SnackBar] with the given message.
  ///
  /// This method uses [ScaffoldMessenger] to display the SnackBar.
  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(message)));
  }

  /// Pushes a new route onto the navigator.
  ///
  /// This is equivalent to calling [Navigator.of(this).push()].
  Future<T?> push<T>(Route<T> route) => navigator.push(route);

  /// Pushes a named route onto the navigator.
  ///
  /// This is equivalent to calling [Navigator.of(this).pushNamed()].
  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) =>
      navigator.pushNamed<T>(routeName, arguments: arguments);

  /// Pops the current route off the navigator.
  ///
  /// This is equivalent to calling [Navigator.of(this).pop()].
  void pop<T>([T? result]) => navigator.pop<T>(result);
}
