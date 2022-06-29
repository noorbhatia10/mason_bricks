import 'package:flutter/material.dart';

//Created by Nimish Nandwana on 02/03/2021.
class FadeInAnimation extends StatelessWidget {
  const FadeInAnimation({
    required this.child,
    Key? key,
    this.delay = 01,
  }) : super(key: key);

  final int delay;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // final tween = MultiTrackTween([
    //   Track('opacity').add(const Duration(milli
    //   seconds: 300), Tween(begin: 0.0, end: 1.0)),
    // ]);

    // TODO(Nimish): on 5-May-2021 Fix these animations, https://www.goole.com/
    return child;

    // return ControlledAnimation(
    //   delay: Duration(milliseconds: delay),
    //   duration: tween.duration,
    //   tween: tween,
    //   child: child,
    //   builderWithChild: (context, child, animation) => Opacity(
    //     opacity: animation["opacity"],
    //     child: child,
    //   ),
    // );
  }
}
