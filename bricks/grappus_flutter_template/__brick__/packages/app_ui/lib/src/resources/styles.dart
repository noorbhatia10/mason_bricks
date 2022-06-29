import 'package:flutter/material.dart';

const interRegular = FontWeight.w400;
const interMedium = FontWeight.w500;
const interSemiBold = FontWeight.w600;
const interBold = FontWeight.w700;
const fontInter = 'Inter';

// ignore: avoid_classes_with_only_static_members
class TextStyles {
  static bool isSmallScreen = false;
  static bool isBigScreen = false;
  static bool _isMobile = false;
  static const smallHeightParameterInPixels = 700;

  static void setScreenHeight(double height) {
    final isSmall = height < smallHeightParameterInPixels;
    isSmallScreen = isSmall;
    isBigScreen = !isSmall;
  }

  static set isMobileView(bool isMobile) {
    _isMobile = isMobile;
  }

  //ignore: unnecessary_getters_setters
  static bool get isMobileView => _isMobile;

  static bool get isTabletView => !_isMobile;
}
