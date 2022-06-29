import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActionTile extends StatelessWidget {
  const ActionTile({
    Key? key,
    required this.title,
    required this.onTap,
    this.subTitle,
    this.leadIconSvg,
    this.trailIconSvg,
    this.backgroundColor = AppColors.blackLight,
    this.height = 70,
    this.titleSpace = 16,
    this.trailIconSpace = 20,
    this.elevation = 4,
    this.borderRadius = 8,
    this.trailIconColor,
  }) : super(key: key);

  final RichText title;
  final RichText? subTitle;
  final String? leadIconSvg;
  final String? trailIconSvg;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final double height;
  final double titleSpace;
  final double trailIconSpace;
  final double elevation;
  final double borderRadius;
  final Color? trailIconColor;

  @override
  Widget build(BuildContext context) {
    return TransparentInkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        color: backgroundColor,
        elevation: elevation,
        child: Container(
          height: height,
          padding: const EdgeInsets.only(
            left: 20,
          ),
          child: Row(
            children: [
              if (leadIconSvg.isNotNullOrEmpty)
                Container(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(leadIconSvg!),
                ),
              Padding(
                padding: EdgeInsets.only(left: titleSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    title,
                    const SizedBox(
                      height: 3.9,
                    ),
                    if (subTitle != null) subTitle!,
                  ],
                ),
              ),
              if (trailIconSvg.isNotNullOrEmpty)
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: trailIconSpace),
                    child: SvgPicture.asset(
                      trailIconSvg!,
                      color: trailIconColor,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
