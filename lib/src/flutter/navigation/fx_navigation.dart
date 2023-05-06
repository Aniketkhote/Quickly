import 'package:flutter/material.dart';

import 'fx_route_transition.dart';

/// Represents a navigator instance.
class FxNavigation {
  static GlobalKey<NavigatorState>? _navigatorKey;

  /// Returns the navigator key.
  static GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  /// Sets the navigator key.
  void setNavigatorKey(GlobalKey<NavigatorState> key) => _navigatorKey = key;

  /// Returns the current navigator state.
  static NavigatorState? get navigator => _navigatorKey?.currentState;

  /// Returns the current build context.
  static BuildContext? get context => _navigatorKey?.currentContext;

  /// Returns the arguments passed to the current route.
  static Object? get args => ModalRoute.of(context!)?.settings.arguments;

  /// Returns the query parameters of the current route.
  static Map<String, String> _params = <String, String>{};

  /// Returns the query parameters of the current route.
  static Map<String, String> get params => _params;

  /// Navigates to the named route.
  static Future<T?> toNamed<T extends Object?>(
    String routeName, {
    Object? args,
  }) {
    final String route = _getRouteName(routeName);
    return navigator!.pushNamed<T>(
      route,
      arguments: args,
    );
  }

  /// Navigates to the given page with a transition animation.
  static Future<T?>? toPage<T>(
    Widget page, {
    AnimationType animationType = AnimationType.fade,
    double animationDuration = 1.0,
    Function? onCompleted,
  }) async {
    return navigator?.push<T>(
      FxRouteTransition<T>(
        page,
        animationType: animationType,
        animationDuration: animationDuration,
        onCompleted: onCompleted,
      ),
    );
  }

  /// Navigates to the given page with a transition animation and replaces the current route.
  static Future<T?>? offPage<T>(
    Widget page, {
    AnimationType animationType = AnimationType.fade,
    double animationDuration = 1.0,
    Function? onCompleted,
  }) async {
    return navigator?.pushReplacement<T, T>(
      FxRouteTransition<T>(
        page,
        animationType: animationType,
        animationDuration: animationDuration,
        reverse: true,
        onCompleted: onCompleted,
      ),
    );
  }

  /// Replaces the current route with the named route.
  static Future<T?>? offNamed<T extends Object?>(
    String routeName, {
    Object? args,
    Function? onCompleted,
  }) async {
    final String route = _getRouteName(routeName);
    return navigator?.pushReplacementNamed<T, T>(route, arguments: args);
  }

  /// Navigates back to the previous route.
  static void get back => navigator?.pop();

  /// Returns whether there is a previous route to navigate back to.
  static bool? get canPop => navigator?.canPop();

  /// Navigates back to the previous route with an optional result.
  static void maybePop<T extends Object>([T? result]) =>
      navigator?.maybePop(result);

  static String _getRouteName(String routeName) {
    _params = Uri.parse(routeName).queryParameters;
    final int queryIndex = routeName.indexOf('?');
    if (queryIndex != -1) {
      return routeName.substring(0, queryIndex);
    }
    return routeName;
  }
}
