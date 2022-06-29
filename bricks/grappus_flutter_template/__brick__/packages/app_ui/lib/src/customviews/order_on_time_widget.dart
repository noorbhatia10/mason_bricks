import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

enum OrderStatus { onTime, delayed, flagged }

class OrderTimeStatusWidget extends StatelessWidget {
  const OrderTimeStatusWidget({
    required this.text,
    required this.orderStatus,
    this.padding = const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    this.textStyle,
    Key? key,
  }) : super(key: key);

  final String text;
  final OrderStatus orderStatus;
  final EdgeInsets padding;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.5),
        color: Colors.white,
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: Text(
        text,
        style: textStyle ??
            tsWhiteSemiBold12.copyWith(
              color: textColor,
            ),
      ),
    );
  }

  Color get borderColor {
    switch (orderStatus) {
      case OrderStatus.onTime:
        return AppColors.mintGreenLightDark;
      case OrderStatus.delayed:
        return AppColors.coralRed.withOpacity(.2);
      case OrderStatus.flagged:
        return AppColors.lightOrange.withOpacity(.2);
    }
  }

  Color get textColor {
    switch (orderStatus) {
      case OrderStatus.onTime:
        return AppColors.mintGreen;
      case OrderStatus.delayed:
        return AppColors.coralRed;
      case OrderStatus.flagged:
        return AppColors.lightOrange;
    }
  }
}

class OrderTimeStatusDot extends StatelessWidget {
  const OrderTimeStatusDot(
    this.orderStatus, {
    Key? key,
  }) : super(key: key);

  final OrderStatus orderStatus;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 14,
      height: 14,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(3),
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          color: circleColor,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Color get borderColor {
    switch (orderStatus) {
      case OrderStatus.onTime:
        return AppColors.mintGreen.withOpacity(.2);
      case OrderStatus.delayed:
        return AppColors.coralRed.withOpacity(.2);
      case OrderStatus.flagged:
        return AppColors.lightOrange.withOpacity(.2);
    }
  }

  Color get circleColor {
    switch (orderStatus) {
      case OrderStatus.onTime:
        return AppColors.mintGreen;
      case OrderStatus.delayed:
        return AppColors.coralRed;
      case OrderStatus.flagged:
        return AppColors.lightOrange;
    }
  }
}

class OrderTimeStatus extends StatelessWidget {
  const OrderTimeStatus(this.text, this.orderStatus);

  final String text;
  final OrderStatus orderStatus;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 9),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.5),
      ),
      child: Text(
        text.toUpperCase(),
        style: tsBlackDarkSemiBold12.copyWith(color: textColor),
        key: ValueKey(text.toUpperCase()),
      ),
    );
  }

  Color get textColor {
    switch (orderStatus) {
      case OrderStatus.onTime:
        return AppColors.blackDark;
      case OrderStatus.delayed:
        return AppColors.coralRed;
      case OrderStatus.flagged:
        return AppColors.lightOrange;
    }
  }
}
