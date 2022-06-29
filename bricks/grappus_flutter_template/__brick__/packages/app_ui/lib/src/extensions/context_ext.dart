import 'dart:async';

import 'package:app_ui/app_ui.dart';
import 'package:app_ui/src/utils/automation_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

extension ContextExt on BuildContext {
  static Timer? _toastTimer;
  static OverlayEntry? _overlayEntry;

  void showSuccessToast(String? message, {Duration? time}) {
    final shortestSide = MediaQuery.of(this).size.shortestSide;
    const shortestSideInPixels = 600;
    final useMobileToast = shortestSide < shortestSideInPixels;
    if (time == null) {
      if (useMobileToast) {
        showCustomMobileToast(message.orEmpty);
      } else {
        showCustomTabletToast(message.orEmpty);
      }
    } else {
      if (useMobileToast) {
        showCustomMobileToast(
          message.orEmpty,
          time: time,
        );
      } else {
        showCustomTabletToast(
          message.orEmpty,
          time: time,
        );
      }
    }
  }

  void showErrorToast(String? message, {Duration? time}) {
    final shortestSide = MediaQuery.of(this).size.shortestSide;
    const shortestSideInPixels = 600;
    final useMobileToast = shortestSide < shortestSideInPixels;
    if (time == null) {
      if (useMobileToast) {
        showCustomMobileToast(
          message.orEmpty,
          bgColor: AppColors.redAccent,
          toastIcon: icErrorToastMobile,
        );
      } else {
        showCustomTabletToast(
          message.orEmpty,
          bgColor: AppColors.lightRed,
          toastIcon: icErrorToastTablet,
          borderColor: AppColors.redAccent,
        );
      }
    } else {
      if (useMobileToast) {
        showCustomMobileToast(
          message.orEmpty,
          bgColor: Colors.red,
          time: time,
          toastIcon: icErrorToastMobile,
        );
      } else {
        showCustomTabletToast(
          message.orEmpty,
          bgColor: AppColors.lightRed,
          time: time,
          toastIcon: icErrorToastTablet,
          borderColor: AppColors.redAccent,
        );
      }
    }
  }

  void showCustomMobileToast(
    String message, {
    Color bgColor = Colors.green,
    Duration time = const Duration(seconds: 3),
    String toastIcon = icSuccessToastMobile,
  }) {
    if (_toastTimer == null || !_toastTimer!.isActive) {
      _overlayEntry =
          createMobileOverlayEntry(this, message, bgColor, toastIcon);
      Overlay.of(this)!.insert(_overlayEntry!);
      _toastTimer = Timer(time, () {
        if (_overlayEntry != null) {
          _overlayEntry!.remove();
        }
      });
    }
  }

  static OverlayEntry createMobileOverlayEntry(
    BuildContext context,
    String message,
    Color bgColor,
    String toastIcon,
  ) {
    return OverlayEntry(
      builder: (context) => Positioned(
        top: 0,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.13,
        child: Container(
          color: bgColor,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 25,
              bottom: 4,
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  toastIcon,
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: SizedBox(
                    child: RichText(
                      key: const ValueKey(toastSuccessMessage),
                      text: TextSpan(
                        text: message,
                        style: tsWhiteBold16,
                      ),
                    ),
                  ),
                ),
                RichText(
                  text: const TextSpan(
                    text: 'now',
                    style: tsWhiteMedium11,
                  ),
                  textAlign: TextAlign.end,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showCustomTabletToast(
    String message, {
    Color bgColor = AppColors.lightGreen,
    Color borderColor = AppColors.mintGreen,
    Duration time = const Duration(seconds: 3),
    String toastIcon = icSuccessToastTablet,
  }) {
    if (_toastTimer == null || !_toastTimer!.isActive) {
      _overlayEntry = createTabletOverlayEntry(
        this,
        message,
        bgColor,
        borderColor,
        toastIcon,
      );
      Overlay.of(this)!.insert(_overlayEntry!);
      _toastTimer = Timer(time, () {
        if (_overlayEntry != null) {
          _overlayEntry!.remove();
        }
      });
    }
  }

  static OverlayEntry createTabletOverlayEntry(
    BuildContext context,
    String message,
    Color bgColor,
    Color borderColor,
    String toastIcon,
  ) {
    return OverlayEntry(
      builder: (context) => Positioned(
        top: 30,
        height: MediaQuery.of(context).size.height * 0.1,
        left: MediaQuery.of(context).size.width * 0.32,
        right: MediaQuery.of(context).size.width * 0.32,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: borderColor,
              width: 2,
            ),
            color: bgColor,
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 8,
              bottom: 8,
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  toastIcon,
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: SizedBox(
                    child: RichText(
                      text: TextSpan(
                        text: message,
                        style: tsWhiteBold18.copyWith(color: borderColor),
                      ),
                    ),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'now',
                    style: tsWhiteMedium14.copyWith(color: borderColor),
                  ),
                  textAlign: TextAlign.end,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showComingSoonToast() {
    final shortestSide = MediaQuery.of(this).size.shortestSide;
    const shortestSideInPixels = 600;
    final useMobileToast = shortestSide < shortestSideInPixels;
    if (useMobileToast) {
      showCustomMobileToast(
        'Coming Soon',
      );
    } else {
      showCustomTabletToast(
        'Coming Soon',
      );
    }
  }

  void cancelToast() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
    }
  }

  void pushFromRight(Widget child) {
    Navigator.push<void>(
      this,
      RouteAnimationSlideFromRight(widget: child),
    );
  }

  void pushReplacementFromRight(Widget child) {
    Navigator.pushReplacement<void, void>(
      this,
      RouteAnimationSlideFromRight(widget: child),
    );
  }

  void pushAndRemoveUntilFromRight(Widget child) {
    Navigator.pushAndRemoveUntil<void>(
      this,
      RouteAnimationSlideFromRight(widget: child),
      (Route<dynamic> route) => false,
    );
  }

  void pop({Object? result}) {
    Navigator.of(this).pop(result);
  }
}
