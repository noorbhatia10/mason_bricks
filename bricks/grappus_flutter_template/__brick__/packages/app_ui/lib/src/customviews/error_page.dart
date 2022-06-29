import 'package:app_ui/app_ui.dart';
import 'package:flutter/widgets.dart';

/*
 * Created by Nimish Nandwana on 27/01/2022.
 * Description - 
 */

class ErrorPageWidget extends StatelessWidget {
  const ErrorPageWidget({
    this.onClick,
    required this.message,
    Key? key,
  }) : super(key: key);

  final VoidCallback? onClick;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 100,
        child: Column(
          children: [
            Text(message, style: tsBlackSemiBold25),
            const SizedBox(height: 20),
            if (onClick != null)
              PrimarySmallButton(
                onButtonPressed: onClick,
                buttonText: 'Retry',
              ),
          ],
        ),
      ),
    );
  }
}
