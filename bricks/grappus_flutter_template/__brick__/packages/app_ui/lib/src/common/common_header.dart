import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CenterTitleHeader extends StatelessWidget {
  const CenterTitleHeader({Key? key, required this.title, this.textStyle})
      : super(key: key);
  final String title;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TransparentInkWell(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SvgPicture.asset(icLeftArrow),
            ),
            onTap: () => Navigator.of(context).pop(),
          ),
          RichText(
            key: ValueKey(
              title,
            ),
            text: TextSpan(
              text: title,
              style:
                  textStyle ?? tsBlackSemiBold25.copyWith(letterSpacing: -0.13),
            ),
          ),
          const SizedBox(width: 20)
        ],
      ),
    );
  }
}
