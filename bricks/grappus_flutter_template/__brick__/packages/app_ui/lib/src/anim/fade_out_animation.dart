import 'package:flutter/material.dart';

//Created by Nimish Nandwana on 02/03/2021.

class FadeOutAnimation extends StatelessWidget {
  const FadeOutAnimation({
    required this.child,
    this.delay = 01,
    this.animationDuration = 500,
  });

  final int delay;
  final int animationDuration;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // final Duration animDuration = Duration(milliseconds: animationDuration);
    // final tween = MultiTrackTween([
    //   Track('opacity').add(animDuration, Tw
    //   een(begin: 1.0, end: 0.0), curve: Curves.easeOut),
    // ]);

    // TODO(Nimish): on 5-May-2021 Fix these animations, https://www.goole.com/
    return child;

    // return ControlledAnimation(
    //   delay: Duration(milliseconds: delay),
    //   duration: tween.duration,
    //   tween: tween,
    //   child: child,
    //   builderWithChild: (context, child, animation) => Opacity(
    //     opacity: animation['opacity'],
    //     child: child,
    //   ),
    // );
  }
}
