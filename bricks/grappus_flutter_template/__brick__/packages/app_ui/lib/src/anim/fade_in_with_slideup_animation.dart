import 'package:flutter/material.dart';

//Created by Nimish Nandwana on 02/03/2021.

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
    //   Track('opacity').add(const Durati
    //   on(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
    //   Track('translateY').add(const Duration(milliseconds: 400),
    //   Tween(begin: 40.0, end: 0.0),
    //       curve: Curves.easeOut)
    // ]);

    // TODO(Nimish): on 5-May-2021 Fix these animations, https://www.goole.com/
    return child;

    // return ControlledAnimation(
    //   delay: Duration(milliseconds: delay.round()),
    //   duration: tween.duration,
    //   tween: tween,
    //   builderWithChild: (context, child, animation) => Opacity(
    //     opacity: animation['opacity'],
    //     child: Transform.translate(offset: Offse
    //     t(0, animation['translateY']), child: child),
    //   ),
    //   child: child,
    // );
  }
}
