import 'package:app_ui/app_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PrimaryOutlineButton extends StatelessWidget {
  PrimaryOutlineButton({
    required this.buttonText,
    required this.onButtonPressed,
    this.includeHorizontalPadding = true,
    this.includeBottomPadding = true,
    this.height = 50,
    this.textStyle = tsOrangeSemiBold12,
  });

  final String buttonText;
  final VoidCallback onButtonPressed;
  final bool includeHorizontalPadding;
  final bool includeBottomPadding;
  final double height;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      height: height,
      margin: EdgeInsets.only(
        bottom: includeBottomPadding ? 30 : 0,
        left: includeHorizontalPadding ? 27 : 0,
        right: includeHorizontalPadding ? 27 : 0,
      ),
      child: TextButton(
        key: const Key('TextButton key'),
        style: flatButtonStyle,
        onPressed: onButtonPressed,
        child: RichText(
          text: TextSpan(text: buttonText, style: textStyle),
        ),
      ),
    );
  }

  final ButtonStyle flatButtonStyle = OutlinedButton.styleFrom(
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(44),
    ),
    side: const BorderSide(width: 1.5, color: AppColors.orange),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('buttonText', buttonText))
      ..add(
        StringProperty(
          'includeHorizontalPadding',
          includeHorizontalPadding.toString(),
        ),
      )
      ..add(
        StringProperty(
          'includeBottomPadding',
          includeBottomPadding.toString(),
        ),
      )
      ..add(StringProperty('buttonText', buttonText))
      ..add(DiagnosticsProperty<Function>('onButtonPressed', onButtonPressed));
  }
}
