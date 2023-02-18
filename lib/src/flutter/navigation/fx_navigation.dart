import 'package:flutter/material.dart';
import './fx_animation.dart';

class FxNavigation {
  factory FxNavigation() => _instance;

  FxNavigation._internal();

  static final FxNavigation _instance = FxNavigation._internal();

  GlobalKey<NavigatorState>? _navigatorKey;

  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  void setNavigatorKey(GlobalKey<NavigatorState> key) {
    _navigatorKey = key;
  }

  NavigatorState? get navigator => _navigatorKey?.currentState;

  BuildContext? get context => _navigatorKey?.currentContext;

  Object? get args => ModalRoute.of(context!)?.settings.arguments;

  Map<String, String> _params = <String, String>{};

  Map<String, String> get params => _params;

  Future<T?>? toNamed<T>(
    String routeName, {
    Object? args,
  }) async {
    String route = _getRouteName(routeName);
    return await navigator?.pushNamed<T>(route, arguments: args);
  }

  Future<T?>? toPage<T>(
    Widget page, {
    AnimationType animationType = AnimationType.fade,
    double animationValue = 1.0,
    Function? onCompleted,
  }) async {
    return await navigator?.push<T>(
      FxRouteTransition<T>(
        page,
        animationType: animationType,
        animationValue: animationValue,
        onCompleted: onCompleted,
      ),
    );
  }

  Future<T?>? offPage<T>(
    Widget page, {
    AnimationType animationType = AnimationType.fade,
    double animationValue = 1.0,
    Function? onCompleted,
  }) async {
    return await navigator?.pushReplacement<T, T>(
      FxRouteTransition<T>(
        page,
        animationType: animationType,
        animationValue: animationValue,
        reverse: true,
        onCompleted: onCompleted,
      ),
    );
  }

  Future<T?>? offNamed<T>(
    String routeName, {
    Object? args,
    Function? onCompleted,
  }) async {
    String route = _getRouteName(routeName);
    return await navigator?.pushReplacementNamed<T, T>(route, arguments: args);
  }

  void get back => navigator?.pop();

  bool? get canPop => navigator?.canPop();

  void maybePop<T extends Object>([T? result]) => navigator?.maybePop(result);

  void navigateTo(Widget page,
      {AnimationType animationType = AnimationType.fade,
      double animationValue = 1.0,
      Function? onCompleted,
      bool replace = false}) {
    if (replace) {
      offPage<Object>(
        page,
        animationType: animationType,
        animationValue: animationValue,
        onCompleted: onCompleted,
      );
    } else {
      toPage<Object>(
        page,
        animationType: animationType,
        animationValue: animationValue,
        onCompleted: onCompleted,
      );
    }
  }

  String _getRouteName(String routeName) {
    _params = Uri.parse(routeName).queryParameters;
    return routeName.substring(0, routeName.indexOf('?'));
  }
}
