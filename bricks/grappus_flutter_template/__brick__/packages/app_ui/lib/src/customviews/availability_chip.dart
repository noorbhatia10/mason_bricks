import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AvailabilityChip extends StatelessWidget {
  const AvailabilityChip({
    required this.productEachesQuantity,
    required this.locationId,
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  final int productEachesQuantity;
  final String locationId;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 13, right: 13, top: 4, bottom: 6),
      margin: const EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.plumpPurple : AppColors.lightGrey2,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.plumpPurple),
      ),
      child: RichText(
        key: ValueKey('$locationId $productEachesQuantity'),
        text: TextSpan(
          children: [
            TextSpan(
              text: locationId,
              style: isSelected
                  ? tsWhiteBold16
                  : tsWhiteBold16.withColor(AppColors.plumpPurple),
            ),
            if (productEachesQuantity > 0)
              TextSpan(
                text: ' : $productEachesQuantity',
                style: isSelected
                    ? tsWhiteSemiBold16
                    : tsWhiteSemiBold16.withColor(AppColors.plumpPurple),
              )
          ],
        ),
      ),
    );
  }
}
