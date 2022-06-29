import 'package:app_ui/app_ui.dart';
import 'package:app_ui/src/utils/automation_constants.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class ViewAll extends StatelessWidget {
  const ViewAll({Key? key, required this.onClick}) : super(key: key);
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return TransparentInkWell(
      onTap: onClick,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          RichText(
            key: const ValueKey(ipadMonitorStoreDevicesViewAll),
            text: TextSpan(
              text: 'VIEW ALL',
              style: tsBlackMedium16.copyWith(
                color: AppColors.blackDark.withOpacity(0.5),
              ),
            ),
          ),
          const SizedBox(width: 5),
          SvgPicture.asset(
            icCircularNextArrow,
            color: AppColors.blackDark,
          )
        ],
      ),
    );
  }
}
