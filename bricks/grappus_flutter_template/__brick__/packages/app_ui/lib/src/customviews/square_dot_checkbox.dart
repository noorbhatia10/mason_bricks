import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SquareDotCheckbox extends StatelessWidget {
  const SquareDotCheckbox({
    Key? key,
    required this.isSelected,
    required this.text,
    required this.onClick,
    this.size = 23,
  }) : super(key: key);

  final bool isSelected;
  final String text;
  final VoidCallback onClick;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: size,
          height: size,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.pinkishOrange),
            borderRadius: BorderRadius.circular(6),
            color: AppColors.white,
          ),
          child: isSelected ? filledSquare : const SizedBox(),
        ),
        const SizedBox(width: 9),
        Text(
          text,
          style: tsDarkMedium16.copyWith(
            color: AppColors.dark2.withOpacity(.7),
          ),
        )
      ],
    );
  }

  Widget get filledSquare {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: AppColors.pinkishOrange,
      ),
    );
  }
}
