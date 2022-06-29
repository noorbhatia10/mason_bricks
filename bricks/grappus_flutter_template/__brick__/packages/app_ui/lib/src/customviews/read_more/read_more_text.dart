import 'package:app_ui/app_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

/// usage

/// ReadMoreText(
/// '''Flutter is Google’s mobile UI open source framework to build
/// high-quality native (super fast) interfaces for iOS and Android
/// apps with the unified codebase.''',
/// trimLines: 2,
/// colorClickableText: Colors.pink,
/// trimMode: TrimMode.line,
/// trimCollapsedText: 'Show more',
/// trimExpandedText: 'Show less',
/// moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
/// );
enum TrimMode {
  length,
  line,
}

class ReadMoreText extends StatefulWidget {
  const ReadMoreText(
    this.data, {
    Key? key,
    this.trimExpandedText = 'show less',
    this.trimCollapsedText = 'read more',
    this.colorClickableText,
    this.trimLength = 240,
    this.trimLines = 2,
    this.trimMode = TrimMode.length,
    this.style,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.textScaleFactor,
    this.semanticsLabel,
    this.moreStyle,
    this.lessStyle,
    this.delimiter = '$_kEllipsis ',
    this.delimiterStyle,
    this.callback,
    this.isHtml = false,
  }) : super(key: key);

  /// Used on TrimMode.Length
  final int trimLength;

  /// Used on TrimMode.Lines
  final int trimLines;

  /// Determines the type of trim. TrimMode.Length takes into account
  /// the number of letters, while TrimMode.Lines takes into account
  /// the number of lines
  final TrimMode trimMode;

  /// TextStyle for expanded text
  final TextStyle? moreStyle;

  /// TextStyle for compressed text
  final TextStyle? lessStyle;

  ///Called when state change between expanded/compress
  final Function(bool val)? callback;

  final String delimiter;
  final String data;
  final String trimExpandedText;
  final String trimCollapsedText;
  final Color? colorClickableText;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final double? textScaleFactor;
  final String? semanticsLabel;
  final TextStyle? delimiterStyle;
  // whether to render text as html
  final bool isHtml;

  @override
  ReadMoreTextState createState() => ReadMoreTextState();
}

const String _kEllipsis = '\u2026';

const String _kLineSeparator = '\u2028';

class ReadMoreTextState extends State<ReadMoreText> {
  bool _readMore = true;

  void _onTapLink() {
    setState(() {
      _readMore = !_readMore;
      widget.callback?.call(_readMore);
    });
  }

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context);
    var effectiveTextStyle = widget.style;
    if (widget.style?.inherit ?? false) {
      effectiveTextStyle = defaultTextStyle.style.merge(widget.style);
    }

    final textAlign =
        widget.textAlign ?? defaultTextStyle.textAlign ?? TextAlign.start;
    final textDirection = widget.textDirection ?? Directionality.of(context);
    final textScaleFactor =
        widget.textScaleFactor ?? MediaQuery.textScaleFactorOf(context);
    final overflow = defaultTextStyle.overflow;
    final locale = widget.locale ?? Localizations.maybeLocaleOf(context);

    final colorClickableText =
        widget.colorClickableText ?? Theme.of(context).colorScheme.secondary;
    final _defaultLessStyle = widget.lessStyle ??
        effectiveTextStyle?.copyWith(color: colorClickableText);
    final _defaultMoreStyle = widget.moreStyle ??
        effectiveTextStyle?.copyWith(color: colorClickableText);
    final _defaultDelimiterStyle = widget.delimiterStyle ?? effectiveTextStyle;

    if (widget.isHtml) {
      var htmlData = _readMore
          ? widget.data.truncate(
              widget.trimMode == TrimMode.line
                  ? widget.trimLines <= 1
                      ? 45
                      : (widget.trimLines - 1) * 45
                  : widget.trimLength,
              ellipse: true,
            )
          : widget.data;
      if (_readMore) {
        htmlData += "<a custom='more'></a>";
      } else {
        htmlData += "<a custom='less'></a>";
      }
      return Stack(
        children: [
          HtmlWidget(
            htmlData,
            textStyle: effectiveTextStyle,
            customWidgetBuilder: (element) {
              if (element.attributes.containsKey('custom')) {
                return TransparentInkWell(
                  onTap: _onTapLink,
                  child: Text(
                    _readMore
                        ? widget.trimCollapsedText
                        : widget.trimExpandedText,
                    style: _readMore ? _defaultMoreStyle : _defaultLessStyle,
                  ),
                );
              }
              return null;
            },
          ),
        ],
      );
    }
    final link = TextSpan(
      text: _readMore ? widget.trimCollapsedText : widget.trimExpandedText,
      style: _readMore ? _defaultMoreStyle : _defaultLessStyle,
      recognizer: TapGestureRecognizer()..onTap = _onTapLink,
    );

    final _delimiter = TextSpan(
      text: _readMore
          ? widget.trimCollapsedText.isNotEmpty
              ? widget.delimiter
              : ''
          : '',
      style: _defaultDelimiterStyle,
      recognizer: TapGestureRecognizer()..onTap = _onTapLink,
    );

    Widget result = LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        assert(constraints.hasBoundedWidth, '');
        final maxWidth = constraints.maxWidth;

        // Create a TextSpan with data
        final text = TextSpan(
          style: effectiveTextStyle,
          text: widget.data,
        );

        // Layout and measure link
        final textPainter = TextPainter(
          text: link,
          textAlign: textAlign,
          textDirection: textDirection,
          textScaleFactor: textScaleFactor,
          maxLines: widget.trimLines,
          ellipsis: overflow == TextOverflow.ellipsis ? widget.delimiter : null,
          locale: locale,
        )
          ..layout(maxWidth: maxWidth)

          // Layout and measure delimiter
          ..text = _delimiter
          ..layout(maxWidth: maxWidth)

          // Layout and measure text
          ..text = text
          ..layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final textSize = textPainter.size;

        // Get the endIndex of data
        var linkLongerThanLine = false;
        int endIndex;
        final linkSize = textPainter.size;
        final delimiterSize = textPainter.size;

        if (linkSize.width < maxWidth) {
          final readMoreSize = linkSize.width + delimiterSize.width;
          final pos = textPainter.getPositionForOffset(
            Offset(
              textDirection == TextDirection.rtl
                  ? readMoreSize
                  : textSize.width - readMoreSize,
              textSize.height,
            ),
          );
          endIndex = textPainter.getOffsetBefore(pos.offset) ?? 0;
        } else {
          final pos = textPainter.getPositionForOffset(
            textSize.bottomLeft(Offset.zero),
          );
          endIndex = pos.offset;
          linkLongerThanLine = true;
        }

        TextSpan textSpan;
        switch (widget.trimMode) {
          case TrimMode.length:
            if (widget.trimLength < widget.data.length) {
              textSpan = TextSpan(
                style: effectiveTextStyle,
                text: _readMore
                    ? widget.data.substring(0, widget.trimLength)
                    : widget.data,
                children: <TextSpan>[_delimiter, link],
              );
            } else {
              textSpan = TextSpan(
                style: effectiveTextStyle,
                text: widget.data,
              );
            }
            break;
          case TrimMode.line:
            if (textPainter.didExceedMaxLines) {
              textSpan = TextSpan(
                style: effectiveTextStyle,
                text: _readMore
                    ? widget.data.substring(0, endIndex) +
                        (linkLongerThanLine ? _kLineSeparator : '')
                    : widget.data,
                children: <TextSpan>[_delimiter, link],
              );
            } else {
              textSpan = TextSpan(
                style: effectiveTextStyle,
                text: widget.data,
              );
            }
            break;
        }

        return RichText(
          textAlign: textAlign,
          textDirection: textDirection,
          textScaleFactor: textScaleFactor,
          text: textSpan,
        );
      },
    );
    if (widget.semanticsLabel != null) {
      result = Semantics(
        textDirection: widget.textDirection,
        label: widget.semanticsLabel,
        child: ExcludeSemantics(
          child: result,
        ),
      );
    }
    return result;
  }
}
