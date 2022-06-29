import 'dart:math';

import 'package:flutter/material.dart';

/*
 * Created by Nimish Nandwana on 25/11/2021.
 * Description - 
 */

// An indicator showing the currently selected page of a PageController
class DotsIndicator extends AnimatedWidget {
  const DotsIndicator({
    required this.controller,
    required this.itemCount,
    this.color = Colors.white,
  }) : super(listenable: controller);

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// The color of the dots.
  ///
  /// Defaults to `Colors.white`.
  final Color color;

  // The base size of the dots
  static const double _kDotSize = 8;

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 1;

  // The distance between the center of each dot
  static const double _kDotSpacing = 15;

  Widget _buildDot(int index) {
    final currentPage = controller.page!.toInt();
    final selectedness = Curves.easeOut.transform(
      max(
        0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );

    final zoom = 1.0 + (_kMaxZoom - .8) * selectedness;
    return SizedBox(
      width: _kDotSpacing,
      height: 8,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: currentPage == index ? color : color.withOpacity(.2),
            shape: BoxShape.circle,
          ),
          child: SizedBox(
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<Widget>.generate(itemCount, _buildDot),
      ),
    );
  }
}
