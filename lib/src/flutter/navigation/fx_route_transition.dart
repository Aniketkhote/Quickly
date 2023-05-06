import 'package:flutter/material.dart';

enum AnimationType { fade, scale, slide, rotate, custom }

class FxRouteTransition<T> extends PageRouteBuilder<T> {
  FxRouteTransition(
    this.page, {
    this.animationType = AnimationType.fade,
    this.animationDuration = 1.0,
    this.reverse = false,
    this.onCompleted,
    this.customTransitionBuilder,
  }) : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            if (animationType == AnimationType.custom) {
              if (customTransitionBuilder == null) {
                throw ArgumentError(
                  'customTransitionBuilder must not be null for a custom transition type',
                );
              }
              return customTransitionBuilder(
                context,
                animation,
                secondaryAnimation,
                child,
                reverse,
              );
            }
            return _getTransition(animation, secondaryAnimation, child,
                animationType, reverse, animationDuration);
          },
          transitionDuration: const Duration(milliseconds: 300),
        );

  final Widget page;
  final AnimationType animationType;
  final double animationDuration;
  final bool reverse;
  final Function? onCompleted;
  final Widget Function(
    BuildContext,
    Animation<double>,
    Animation<double>,
    Widget,
    bool,
  )? customTransitionBuilder;

  static Widget _getTransition(
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
    AnimationType type,
    bool reverse,
    double animationDuration,
  ) {
    switch (type) {
      case AnimationType.fade:
        return FadeTransition(
          opacity: _getCurvedAnimation(animation),
          child: child,
        );
      case AnimationType.scale:
        return ScaleTransition(
          scale: Tween<double>(begin: 0.0, end: animationDuration).animate(
            _getCurvedAnimation(animation),
          ),
          child: child,
        );
      case AnimationType.slide:
        return SlideTransition(
          position: Tween<Offset>(
            begin: reverse ? Offset.zero : const Offset(1.0, 0.0),
            end: reverse ? const Offset(-1.0, 0.0) : Offset.zero,
          ).animate(
            _getCurvedAnimation(animation),
          ),
          child: child,
        );
      case AnimationType.rotate:
        return RotationTransition(
          turns: Tween<double>(begin: 0.0, end: animationDuration).animate(
            _getCurvedAnimation(animation),
          ),
          child: child,
        );
      case AnimationType.custom:
        throw UnimplementedError('Custom transition not implemented');
    }
  }

  static CurvedAnimation _getCurvedAnimation(Animation<double> animation) {
    return CurvedAnimation(
      parent: animation,
      curve: Curves.ease,
    );
  }
}
