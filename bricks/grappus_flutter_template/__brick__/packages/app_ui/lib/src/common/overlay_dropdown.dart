import 'dart:math' as math;

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// [ValueKey] is required to update the widget when the selectedItem changes
/// useful when many OverlayDropDown widgets are there
class OverlayDropDown<T> extends StatefulWidget {
  const OverlayDropDown({
    required this.values,
    required this.hintText,
    required this.onValueSelected,
    ValueKey? key,
    this.offset = 0,
    this.minWidth,
    this.hintTextStyle = tsBlueGreyMedium16,
    this.subTextStyle = tsCoolGreyMedium16,
    this.selectedTrailingWidget,
    this.textStyle = tsBlackMedium16,
    this.backgroundColor = AppColors.paleGrey,
    this.borderRadius,
    this.preSelectedValue,
  }) : super(key: key);

  final List<OverlayDropDownItem<T>> values;
  final ValueChanged<T> onValueSelected;
  final String hintText;
  final TextStyle hintTextStyle;
  final TextStyle textStyle;
  final TextStyle subTextStyle;
  final OverlayDropDownItem<T>? preSelectedValue;
  final Widget? selectedTrailingWidget;
  final Color backgroundColor;
  final BorderRadius? borderRadius;
  final double? minWidth;

  ///It is how much below the widget the overlay will show
  final double offset;

  @override
  OverlayDropDownState<T> createState() => OverlayDropDownState<T>();
}

class OverlayDropDownState<T> extends State<OverlayDropDown<T>> {
  OverlayEntry? parentOverlay;
  OverlayEntry? childOverlay;
  bool isDropDownExpanded = false;
  bool isSizeReset = false;
  double maxHeight = 0;
  OverlayDropDownItem<T>? selectedValue;

  @override
  void initState() {
    if (widget.preSelectedValue != null) {
      selectedValue = widget.preSelectedValue;
    }
    super.initState();
  }

  void toggleDropDown(OverlayDropDownItem<T>? value) {
    if (isDropDownExpanded) {
      removeAllOverlays();
      isDropDownExpanded = false;
      if (value != null) {
        widget.onValueSelected(value.value);
        setState(() {
          selectedValue = value;
        });
      }
    } else {
      createOverlay();
    }
  }

  void createOverlay() {
    parentOverlay = parentOverLay();
    Overlay.of(context)!.insert(parentOverlay!);
    childOverlay = _createChildOverlayEntry();
    Overlay.of(context)!.insert(childOverlay!);
    isDropDownExpanded = true;
  }

  void removeAllOverlays() {
    if (parentOverlay != null) {
      parentOverlay?.remove();
    }
    if (childOverlay != null) {
      childOverlay?.remove();
    }

    isDropDownExpanded = false;
  }

  OverlayEntry _createChildOverlayEntry() {
    final renderBox = context.findRenderObject()! as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);
    FocusScope.of(context).unfocus();
    final screenSize = MediaQuery.of(context).size.height;
    final padding = MediaQuery.of(context).padding;
    return OverlayEntry(
      builder: (context) => Positioned(
        top: offset.dy + size.height + widget.offset,
        width: widget.minWidth == null
            ? size.width
            : math.max(widget.minWidth!, size.width),
        left: offset.dx,
        child: MeasureSize(
          onChange: (Size size) {
            debugPrint('ha ha main size changed ${size.height}');
          },
          child: Material(
            color: AppColors.white,
            elevation: 2,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            child: SizedBox(
              height: math.min(
                maxHeight,
                screenSize - (offset.dy + padding.top + padding.bottom + 80),
              ),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: widget.values.length,
                itemBuilder: (context, index) {
                  return MeasureSize(
                    onChange: (Size size) {
                      if (!isSizeReset) {
                        maxHeight += size.height;
                      }
                      if (!isSizeReset && index == widget.values.length - 1) {
                        removeAllOverlays();
                        createOverlay();
                        isSizeReset = true;
                      }
                    },
                    child: ListTile(
                      onTap: () => toggleDropDown(widget.values[index]),
                      contentPadding:
                          const EdgeInsets.only(left: 15, right: 15),
                      title: Row(
                        children: [
                          RichText(
                            key: ValueKey(widget.values[index].text),
                            text: TextSpan(
                              text:
                                  '''${widget.values[index].text} ${widget.values[index].subText.orEmpty}''',
                              style: widget.textStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  ///We create 2 OverlayEntries, the parentOverLay is Transparent and covers
  /// whole screen
  ///the child one is what shown on the dialog
  /// This is to remove overlay on outside touch
  OverlayEntry parentOverLay() {
    final screenSize = MediaQuery.of(context).size;
    return OverlayEntry(
      builder: (context) {
        return GestureDetector(
          onTap: removeAllOverlays,
          child: Container(
            color: AppColors.colorTransparent,
            width: screenSize.width,
            height: screenSize.height,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        toggleDropDown(null);
      },
      child: Container(
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: widget.borderRadius,
        ),
        padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              key: selectedValue == null
                  ? ValueKey(widget.hintText)
                  : ValueKey(selectedValue!.text),
              text: TextSpan(
                text: selectedValue == null
                    ? widget.hintText
                    : selectedValue!.text,
                style: selectedValue == null
                    ? widget.hintTextStyle
                    : widget.textStyle,
                children: [
                  if (selectedValue != null)
                    TextSpan(
                      text: selectedValue!.subText.orEmpty,
                      style: widget.subTextStyle,
                    )
                ],
              ),
            ),
            widget.selectedTrailingWidget ??
                Transform.rotate(
                  angle: 1.571,
                  child: SvgPicture.asset(icNextArrow),
                )
          ],
        ),
      ),
    );
  }
}

class OverlayDropDownItem<T> {
  OverlayDropDownItem({
    required this.value,
    required this.text,
    this.subText,
  });

  final T value;
  final String text;
  final String? subText;
}
