import 'package:flutter/material.dart';

//Created by Nimish Nandwana on 02/03/2021.

class FadeOutWithSlideUpAnimation extends StatelessWidget {
  const FadeOutWithSlideUpAnimation({
    required this.child,
    this.delay = 1,
  });

  final double delay;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // final tween = MultiTrackTween([
    //   Track('opacity')
    //       .add(Duration(milliseconds: de
    //       lay.toInt()), Tween(begin: 1.0, end: 1.0))
    //       .add(const Duration(millisecond
    //       s: 400), Tween(begin: 1.0, end: 0.0)),
    //   Track('translateY')
    //       .add(Duration(milliseconds:
    //       delay.toInt()), Tween(begin: 0.0, end: 0.0))
    //       .add(const Duration(millise
    //       conds: 400), Tween(begin: 0.0, end: -20.0),
    //           curve: Curves.easeOut)
    // ]);

    // TODO(Nimish): on 5-May-2021 Fix these animations, https://www.goole.com/
    return child;

    // return ControlledAnimation(
    //   duration: tween.duration,
    //   tween: tween,
    //   child: child,
    //   builderWithChild: (context, child, animation) => Opacity(
    //     opacity: animation['opacity'],
    //     child: Transform.translate(offset: O
    //     ffset(0, animation['translateY']), child: child),
    //   ),
    // );
  }
}
