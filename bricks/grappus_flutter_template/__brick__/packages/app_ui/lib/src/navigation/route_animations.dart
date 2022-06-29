import 'package:app_ui/src/extensions/string_extension.dart';
import 'package:app_ui/src/navigation/custom_cupertino_page_transition.dart';
import 'package:flutter/material.dart';

class RouteAnimationNone extends PageRouteBuilder<dynamic> {
  RouteAnimationNone({required this.widget})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return widget;
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return child;
          },
        );

  final Widget widget;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);
}

class RouteAnimationNoneWithDuration extends PageRouteBuilder<dynamic> {
  RouteAnimationNoneWithDuration({
    required this.widget,
    required this.animDuration,
  }) : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return widget;
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return child;
          },
        );

  final Widget widget;
  final int animDuration;

  @override
  Duration get transitionDuration => Duration(milliseconds: animDuration);
}

class RouteAnimationSlideFromRight extends PageRouteBuilder<dynamic> {
  RouteAnimationSlideFromRight({
    required this.widget,
    this.routeName,
    this.shouldMaintainState = true,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) {
            return widget;
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return CustomCupertinoPageTransition(
              primaryRouteAnimation: animation,
              secondaryRouteAnimation: secondaryAnimation,
              linearTransition: false,
              isSlideFromRight: true,
              child: child,
            );
          },
        );

  final Widget widget;
  final String? routeName;
  final bool shouldMaintainState;

  @override
  RouteSettings get settings {
    if (routeName.isNullOrEmpty) {
      return super.settings;
    } else {
      return RouteSettings(
        name: routeName,
        arguments: super.settings.arguments,
      );
    }
  }

  @override
  bool get maintainState {
    return shouldMaintainState;
  }
}

class RouteAnimationFadeIn extends PageRouteBuilder<dynamic> {
  RouteAnimationFadeIn(
    this.widget, {
    required this.shouldMaintainState,
    this.routeName,
  }) : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return widget;
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );

  final Widget widget;
  final String? routeName;
  final bool shouldMaintainState;

  @override
  bool get maintainState {
    return shouldMaintainState;
  }

  @override
  RouteSettings get settings {
    if (routeName.isNullOrEmpty) {
      return super.settings;
    } else {
      return RouteSettings(
        name: routeName,
        arguments: super.settings.arguments,
      );
    }
  }
}

class FadeInWithSlideUpAnimation extends StatelessWidget {
  const FadeInWithSlideUpAnimation({
    required this.child,
    this.delay = 1,
    this.animationHeight = 40,
  });

  final double delay;
  final double animationHeight;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // final tween = MultiTrackTween([
    //   Track("opacity").add(const Duration(milliseconds: 500),
    //   Tween(begin: 0.0, end: 1.0)),
    //   Track("translateY").add(const Duration(milliseconds: 400),
    //   Tween(begin: 40.0, end: 0.0),
    //       curve: Curves.easeOut)
    // ]);

    // TODO(Nimish): on 5-May-2021 Fix these animations, https://www.goole.com/
    return child;
    // return ControlledAnimation<Tween>(
    //   delay: Duration(milliseconds: (delay).round()),
    //   duration: tween.duration,
    //   tween: tween,
    //   builderWithChild: (context, child, animation) => Opacity(
    //     opacity: animation['opacity'],
    //     child: Transform.translate(offset: Offset(0,
    //     animation["translateY"]), child: child),
    //   ),
    //   child: child,
    // );
  }
}

class RouteAnimationCupertinoSlideFromBottom extends PageRouteBuilder<dynamic> {
  RouteAnimationCupertinoSlideFromBottom({
    required this.widget,
    this.routeName,
    this.shouldMaintainState = false,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) {
            return widget;
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return CustomCupertinoPageTransition(
              primaryRouteAnimation: animation,
              secondaryRouteAnimation: secondaryAnimation,
              linearTransition: false,
              child: child,
            );
          },
        );
  final Widget widget;
  final String? routeName;
  final bool shouldMaintainState;

  @override
  RouteSettings get settings {
    if (routeName?.isNotEmpty ?? false) {
      return RouteSettings(
        name: routeName,
        arguments: super.settings.arguments,
      );
    } else {
      return super.settings;
    }
  }

  @override
  bool get maintainState {
    return shouldMaintainState;
  }
}
