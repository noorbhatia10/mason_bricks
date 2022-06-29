import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrimaryTextField extends StatefulWidget {
  const PrimaryTextField({
    Key? key,
    this.hintText = '',
    this.hintStyle = tsBlackSemiBold16,
    this.labelText = '',
    this.labelStyle = tsBlackMedium13,
    this.errorLabelStyle = tsBlackDarkSemiBold16,
    this.errorStyle = tsBlackSemiBold25,
    this.style = tsBlackSemiBold16,
    this.controller,
    this.outlineBorderRadius = 11,
    this.suffixIcon,
    this.autoFocus = false,
    this.fillHeight = false,
    this.readOnly = false,
    this.height = 50,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.onChanged,
    this.onTap,
    this.obscureText = false,
    this.hasToShowError = false,
    this.errorText = '',
    this.postTextWidget,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatter = const [],
    this.scrollPhysics,
    this.textFieldColor = AppColors.white,
  }) : super(key: key);

  final String hintText;
  final TextStyle hintStyle;
  final String labelText;
  final TextStyle labelStyle;
  final TextStyle errorStyle;
  final TextStyle errorLabelStyle;
  final TextStyle style;
  final TextEditingController? controller;
  final double outlineBorderRadius;
  final String? suffixIcon;
  final bool autoFocus;
  final List<TextInputFormatter> inputFormatter;
  final bool readOnly;
  final bool obscureText;
  final bool fillHeight;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final int? maxLines;
  final double height;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final bool hasToShowError;
  final String errorText;
  final Widget? postTextWidget;
  final ScrollPhysics? scrollPhysics;
  final Color textFieldColor;

  @override
  PrimaryTextFieldState createState() => PrimaryTextFieldState();
}

class PrimaryTextFieldState extends State<PrimaryTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: widget.labelText,
            style: widget.labelStyle,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          height: widget.height,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: widget.textFieldColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            showCursor: !widget.readOnly,
            scrollPhysics: widget.scrollPhysics,
            obscureText: widget.obscureText,
            obscuringCharacter: '*',
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: widget.hintText,
              hintStyle: widget.hintStyle,
              counterText: '',
            ),
            controller: widget.controller,
            style: widget.hasToShowError
                ? widget.errorStyle.copyWith(
                    decoration: TextDecoration.none,
                  )
                : widget.style.copyWith(decoration: TextDecoration.none),
            cursorColor: AppColors.pinkishOrange,
            inputFormatters: widget.inputFormatter,
            readOnly: widget.readOnly,
            autofocus: widget.autoFocus,
            keyboardType: widget.keyboardType,
            textCapitalization: widget.textCapitalization,
            textInputAction: widget.textInputAction,
            maxLines: widget.maxLines,
            onChanged: widget.onChanged,
            onTap: widget.onTap,
          ),
        ),
        /*if (widget.hasToShowError)*/
        Visibility(
          visible: widget.hasToShowError,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Text(
            widget.errorText,
            style: widget.errorLabelStyle,
          ),
        ),
      ],
    );
  }
}

class PrimaryIpadTextField extends StatefulWidget {
  const PrimaryIpadTextField({
    Key? key,
    this.hintText = '',
    this.hintStyle = tsBlackSemiBold19,
    this.hintColorOpacity = 0.3,
    this.labelText = '',
    this.labelStyle = tsBlueGreyMedium16,
    this.errorLabelStyle = tsBlackDarkSemiBold16,
    this.errorStyle = tsBlackSemiBold25,
    this.style = tsBlackSemiBold19,
    this.controller,
    this.outlineBorderRadius = 11,
    this.suffixIcon,
    this.autoFocus = false,
    this.fillHeight = false,
    this.readOnly = false,
    this.height = 50,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.onChanged,
    this.onTap,
    this.obscureText = false,
    this.hasToShowError = false,
    this.maintainErrorSize = true,
    this.showLabel = true,
    this.errorText = '',
    this.postTextWidget,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatter = const [],
    this.scrollPhysics,
    this.textFieldColor = AppColors.greyLight,
    this.textAlign = TextAlign.left,
  }) : super(key: key);
  final String hintText;
  final TextStyle hintStyle;
  final double hintColorOpacity;
  final String labelText;
  final TextStyle labelStyle;
  final TextStyle errorStyle;
  final TextStyle errorLabelStyle;
  final TextStyle style;
  final TextEditingController? controller;
  final double outlineBorderRadius;
  final String? suffixIcon;
  final bool autoFocus;
  final List<TextInputFormatter> inputFormatter;
  final bool readOnly;
  final bool obscureText;
  final bool fillHeight;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final int maxLines;
  final double height;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final bool hasToShowError;
  final bool maintainErrorSize;
  final String errorText;
  final Widget? postTextWidget;
  final ScrollPhysics? scrollPhysics;
  final Color textFieldColor;
  final bool showLabel;
  final TextAlign textAlign;

  @override
  PrimaryIpadTextFieldState createState() => PrimaryIpadTextFieldState();
}

class PrimaryIpadTextFieldState extends State<PrimaryIpadTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.showLabel)
          RichText(
            text: TextSpan(
              text: widget.labelText,
              style: widget.labelStyle,
            ),
          ),
        if (widget.showLabel) const SizedBox(height: 7),
        Container(
          height: widget.height,
          padding: const EdgeInsets.symmetric(horizontal: 17),
          decoration: BoxDecoration(
            color: widget.textFieldColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: TextField(
            showCursor: !widget.readOnly,
            scrollPhysics: widget.scrollPhysics,
            obscureText: widget.obscureText,
            obscuringCharacter: '*',
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: widget.hintText,
              hintStyle: widget.hintStyle.copyWith(
                color: AppColors.black.withOpacity(
                  widget.hintColorOpacity,
                ),
              ),
              counterText: '',
            ),
            controller: widget.controller,
            style: widget.hasToShowError
                ? widget.errorStyle.copyWith(
                    decoration: TextDecoration.none,
                  )
                : widget.style.copyWith(decoration: TextDecoration.none),
            cursorColor: AppColors.pinkishOrange,
            inputFormatters: widget.inputFormatter,
            readOnly: widget.readOnly,
            autofocus: widget.autoFocus,
            keyboardType: widget.keyboardType,
            textCapitalization: widget.textCapitalization,
            textInputAction: widget.textInputAction,
            maxLines: widget.maxLines,
            onChanged: widget.onChanged,
            onTap: widget.onTap,
            textAlign: widget.textAlign,
          ),
        ),
        /*if (widget.hasToShowError)*/
        Visibility(
          visible: widget.hasToShowError,
          maintainSize: widget.maintainErrorSize,
          maintainAnimation: true,
          maintainState: true,
          child: Text(
            widget.errorText,
            style: widget.errorLabelStyle,
          ),
        ),
      ],
    );
  }
}
