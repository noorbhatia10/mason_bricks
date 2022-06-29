import 'package:app_ui/src/anim/slide_in_toast_message_animation.dart';
import 'package:app_ui/src/resources/app_colors.dart';
import 'package:flutter/material.dart';

OverlayEntry createOverlayEntry(
  BuildContext context,
  String message,
  Color bgColor,
) {
  final _screenWidth = MediaQuery.of(context).size.width;

  return OverlayEntry(
    builder: (context) => Positioned(
      top: 0,
      width: _screenWidth,
      child: SlideInToastMessageAnimation(
        Material(
          elevation: 10,
          borderRadius: BorderRadius.zero,
          child: Container(
            height: 110,
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
              bottom: 15,
            ),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.zero,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: message,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
