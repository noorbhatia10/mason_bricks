import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class DoubleValueListenableBuilder<A, B> extends StatelessWidget {
  const DoubleValueListenableBuilder(
    this.first,
    this.second, {
    required this.builder,
    this.child,
    Key? key,
  }) : super(key: key);

  final ValueListenable<A> first;
  final ValueListenable<B> second;
  final Widget? child;
  final Widget Function(BuildContext context, A a, B b, Widget? child) builder;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<A>(
      valueListenable: first,
      builder: (_, a, __) {
        return ValueListenableBuilder<B>(
          valueListenable: second,
          builder: (context, b, __) {
            return builder(context, a, b, child);
          },
        );
      },
    );
  }
}
