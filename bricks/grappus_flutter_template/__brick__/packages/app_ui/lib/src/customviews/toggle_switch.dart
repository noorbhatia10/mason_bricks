import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ToggleSwitch extends StatelessWidget {
  const ToggleSwitch({
    Key? key,
    required this.value,
    required this.onClick,
    required this.leftText,
    required this.rightText,
  }) : super(key: key);

  final bool value;
  final VoidCallback onClick;
  final String leftText;
  final String rightText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(leftText, style: value ? tsCoolGreyMedium18 : tsdark2Medium18),
        const SizedBox(width: 8),
        TransparentInkWell(
          onTap: onClick,
          child: Container(
            width: 49,
            height: 25,
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.5),
            ),
            child: Align(
              alignment: value ? Alignment.centerRight : Alignment.centerLeft,
              child: circle,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(rightText, style: value ? tsdark2Medium18 : tsCoolGreyMedium18)
      ],
    );
  }

  Widget get circle {
    return Container(
      width: 19,
      height: 19,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.pinkishOrange2,
      ),
    );
  }
}
