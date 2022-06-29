import 'package:app_ui/app_ui.dart';
import 'package:app_ui/src/utils/automation_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.buttonText,
    required this.onButtonPressed,
    this.textStyle = tsBlackDarkSemiBold16,
    this.height = 55,
    this.width = double.infinity,
    this.buttonColor = AppColors.orange,
    this.padding = const EdgeInsets.only(left: 20, right: 13),
    this.trailingWidget,
    this.leadingWidget,
    this.isActive = true,
    this.borderRadius = 4,
    Key? key,
  }) : super(key: key);

  final String buttonText;
  final VoidCallback? onButtonPressed;
  final double height;
  final double width;
  final Color buttonColor;
  final EdgeInsetsGeometry padding;
  final Widget? leadingWidget;
  final Widget? trailingWidget;
  final TextStyle textStyle;
  final bool isActive;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onButtonPressed,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: isActive ? 1 : .2,
        child: Container(
          height: height,
          width: width,
          padding: padding,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (leadingWidget != null) leadingWidget!,
                  Text(
                    buttonText,
                    style: textStyle,
                    key: ValueKey(buttonText),
                  ),
                ],
              ),
              if (trailingWidget != null) trailingWidget!
            ],
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('buttonText', buttonText))
      ..add(StringProperty('buttonText', buttonText))
      ..add(DiagnosticsProperty<Function>('onButtonPressed', onButtonPressed));
  }
}

class PrimarySmallButton extends StatelessWidget {
  const PrimarySmallButton({
    required this.buttonText,
    required this.onButtonPressed,
    this.textStyle = tsBlackDarkSemiBold16,
    this.buttonColor = AppColors.orange,
    this.trailingWidget,
    this.leadingWidget,
    this.borderRadius,
    Key? key,
    this.horizontalPadding,
    this.verticalPadding,
    this.alignment,
    this.width,
  }) : super(key: key);

  final String buttonText;
  final VoidCallback? onButtonPressed;
  final Color buttonColor;
  final Widget? leadingWidget;
  final Widget? trailingWidget;
  final TextStyle textStyle;
  final BorderRadius? borderRadius;
  final double? horizontalPadding;
  final double? verticalPadding;
  final AlignmentGeometry? alignment;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onButtonPressed,
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 25,
          vertical: verticalPadding ?? 10,
        ),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: borderRadius ?? BorderRadius.circular(6),
        ),
        alignment: alignment,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            leadingWidget ?? const SizedBox.shrink(),
            SizedBox(width: leadingWidget == null ? 0 : 8),
            RichText(
              key: ValueKey(buttonText),
              text: TextSpan(
                text: buttonText,
                style: textStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IPadPrimaryCloseButton extends StatelessWidget {
  const IPadPrimaryCloseButton({Key? key, this.radius = 15, this.onTap})
      : super(key: key);
  final double radius;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TransparentInkWell(
      onTap: onTap ?? () => context.pop(),
      child: CircleAvatar(
        key: const ValueKey(ipadPopUpClose),
        backgroundColor: AppColors.black,
        radius: radius,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: SvgPicture.asset(icCloseWhite),
        ),
      ),
    );
  }
}

class PrimarySortButton extends StatelessWidget {
  const PrimarySortButton({
    Key? key,
    required this.buttonText,
    required this.onTap,
  }) : super(key: key);

  final String buttonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TransparentInkWell(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(icSort),
          const SizedBox(width: 5),
          RichText(
            text: TextSpan(
              text: buttonText,
              style: tsBlackSemiBold15,
            ),
          )
        ],
      ),
    );
  }
}

class CustomViewAllButton extends StatelessWidget {
  const CustomViewAllButton({
    Key? key,
    required this.buttonText,
    required this.onTap,
  }) : super(key: key);
  final String buttonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TransparentInkWell(
      onTap: onTap,
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              text: buttonText,
              style: tsBlackMedium16.copyWith(
                color: AppColors.blackDark.withOpacity(0.5),
              ),
            ),
          ),
          const SizedBox(width: 5),
          SvgPicture.asset(
            icCircularNextArrow,
            color: AppColors.charcoalGrey,
          ),
        ],
      ),
    );
  }
}
