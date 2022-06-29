import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    Key? key,
    required this.buttonText,
    this.onTap,
  }) : super(key: key);
  final String buttonText;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: AppColors.whiteGrey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              icAdd,
              color: AppColors.pinkishOrange,
            ),
            const SizedBox(width: 10),
            RichText(
              text: TextSpan(
                text: buttonText,
                style: tsOrangeMedium16.copyWith(fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
