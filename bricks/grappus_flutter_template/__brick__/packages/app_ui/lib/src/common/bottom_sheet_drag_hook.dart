import 'package:app_ui/app_ui.dart';
import 'package:flutter/widgets.dart';

/*
 * Created by Nimish Nandwana on 29/12/2021.
 * Description - 
 */

class BottomSheetDragHook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 49,
      height: 5,
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.5),
        color: AppColors.grey,
      ),
    );
  }
}
