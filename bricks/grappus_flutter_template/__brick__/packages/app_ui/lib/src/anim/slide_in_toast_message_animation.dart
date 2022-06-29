import 'package:flutter/material.dart';

//Created by Nimish Nandwana on 02/03/2021.

class SlideInToastMessageAnimation extends StatelessWidget {
  const SlideInToastMessageAnimation(this.child);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    // final tween = MultiTrackTween([
    //   Track('translateY')
    //       .add(
    //         const Duration(milliseconds: 250),
    //         Tween(begin: -100.0, end: 0.0),
    //         curve: Curves.easeOut,
    //       )
    //       .add(const Duration(seconds
    //       : 1, milliseconds: 250), Tween(begin: 0.0, end: 0.0))
    //       .add(const Duration(millise
    //       conds: 250), Tween(begin: 0.0, end: -100.0),
    //           curve: Curves.easeIn),
    //   Track('opacity')
    //       .add(const Duration(milliseconds: 500),
    //       Tween(begin: 0.0, end: 1.0))
    //       .add(const Duration(seconds: 1), Tween(begin: 1.0, end: 1.0))
    //       .add(const Duration(milliseconds: 500)
    //       , Tween(begin: 1.0, end: 0.0)),
    // ]);

    // TODO(Nimish): on 5-May-2021 Fix these animations, https://www.goole.com/
    return child;

    // return ControlledAnimation(
    //   duration: tween.duration,
    //   tween: tween,
    //   child: child,
    //   builderWithChild: (context, child, animation) => Opacity(
    //     opacity: animation['opacity'],
    //     child: Transform.translate(offset:
    //     Offset(0, animation['translateY']),
    //     child: child),
    //   ),
    // );
  }
}
