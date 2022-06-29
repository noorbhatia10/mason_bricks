import 'package:flutter/material.dart';

//Created by Nimish Nandwana on 02/03/2021.

class ScaleDownFadeInAnimation extends StatelessWidget {
  const ScaleDownFadeInAnimation({
    required this.child,
    this.delay = 1,
  });

  final double delay;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // final tween = MultiTrackTween([
    //   Track('scale').add(const Duration(milliseco
    //   nds: 500), Tween(begin: 1.0, end: 2.0)),
    //   Track('opacity')
    //       .add(const Duration(milliseconds: 50
    //       0), Tween(begin: 0.0, end: 1.0))
    //       .add(const Duration(seconds: 1), Tween(begin: 1.0, end: 1.0))
    //       .add(const Duration(milliseconds: 50
    //       0), Tween(begin: 1.0, end: 0.0)),
    // ]);

    // TODO(Nimish): on 5-May-2021 Fix these animations, https://www.goole.com/
    return child;

    // return ControlledAnimation(
    //   delay: Duration(milliseconds: (300 * delay).round()),
    //   duration: tween.duration,
    //   tween: tween,
    //   child: child,
    //   builderWithChild: (context, child, animation) => Opacity(
    //     opacity: animation['opacity'],
    //     child: Transform.scale(
    //       scale: animation['scale'],
    //       child: child,
    //     ),
    //   ),
    // );
  }
}
