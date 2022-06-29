import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class EmptyStateView extends StatelessWidget {
  const EmptyStateView({
    required this.message,
    this.shouldShowRetryButton = false,
    this.backgroundColor = AppColors.white,
    this.buttonColor = AppColors.lightOrange,
    this.onRetryButtonPressed,
    this.textStyle = tsBlackDarkSemiBold16,
    this.verticalSpace = 50,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.padding,
    Key? key,
  }) : super(key: key);

  final String message;
  final bool shouldShowRetryButton;
  final Color backgroundColor;
  final Color buttonColor;
  final VoidCallback? onRetryButtonPressed;
  final TextStyle textStyle;
  final double verticalSpace;
  final MainAxisAlignment mainAxisAlignment;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return TextStyles.isMobileView
        ? _MobileEmptyStateView(
            padding: padding,
            message: message,
            textStyle: textStyle,
            buttonColor: buttonColor,
            backgroundColor: backgroundColor,
            shouldShowRetryButton: shouldShowRetryButton,
            onRetryButtonPressed: onRetryButtonPressed,
            key: key,
          )
        : _TabletEmptyStateView(
            message: message,
            verticalSpace: verticalSpace,
            mainAxisAlignment: mainAxisAlignment,
          );
  }
}

class _TabletEmptyStateView extends StatelessWidget {
  const _TabletEmptyStateView({
    Key? key,
    required this.message,
    required this.verticalSpace,
    required this.mainAxisAlignment,
  }) : super(key: key);

  final String message;
  final double verticalSpace;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        width: double.infinity,
        color: AppColors.white,
        child: Column(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            const SizedBox(height: 10),
            Text(
              message,
              style: tsBlackDarkMedium23,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: verticalSpace),
            Image.asset(
              icEmptyStateLight,
              width: screenSize.width * 0.2,
              height: screenSize.height * 0.3,
            )
          ],
        ),
      ),
    );
  }
}

class _MobileEmptyStateView extends StatelessWidget {
  const _MobileEmptyStateView({
    required this.message,
    this.shouldShowRetryButton = false,
    this.backgroundColor = AppColors.white,
    this.buttonColor = AppColors.lightOrange,
    this.onRetryButtonPressed,
    this.textStyle = tsBlackDarkSemiBold16,
    this.padding,
    Key? key,
  }) : super(key: key);

  final String message;
  final bool shouldShowRetryButton;
  final Color backgroundColor;
  final Color buttonColor;
  final VoidCallback? onRetryButtonPressed;
  final TextStyle textStyle;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: padding ?? const EdgeInsets.all(12),
      child: Container(
        width: double.infinity,
        color: backgroundColor,
        child: Column(
          children: [
            SizedBox(height: screenSize.height * 0.06),
            Image.asset(
              icEmptyStateLight,
              width: screenSize.width * 0.25,
              height: screenSize.height * 0.35,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Text(
                message,
                style: textStyle,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            if (shouldShowRetryButton)
              InkWell(
                onTap: onRetryButtonPressed,
                child: Container(
                  width: 120,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: buttonColor,
                  ),
                  child: const Center(
                    child: Text(
                      'Retry',
                      style: tsBlackMedium16,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
