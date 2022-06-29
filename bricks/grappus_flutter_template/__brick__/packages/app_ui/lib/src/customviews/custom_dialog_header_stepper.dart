import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class CustomDialogStepper extends StatelessWidget {
  const CustomDialogStepper({
    Key? key,
    required this.activeStep,
    required this.totalSteps,
  }) : super(key: key);
  final int activeStep;
  final int totalSteps;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        totalSteps,
        (index) => Expanded(
          child: Container(
            height: 3,
            margin: index != totalSteps - 1
                ? const EdgeInsets.only(right: 5)
                : EdgeInsets.zero,
            color: index == activeStep
                ? AppColors.bluePurple
                : AppColors.whiteShade,
          ),
        ),
      ),
    );
  }
}
