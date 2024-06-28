import 'package:flutter/material.dart';
import 'package:veryreal_common/veryreal_common.dart';

class ExpandedText extends StatefulWidget {
  const ExpandedText({
    super.key,
    required this.text,
    this.actionTextStyle,
    this.textStyle,
    this.maxLines = 4,
  });
  final String text;
  final TextStyle? textStyle;
  final TextStyle? actionTextStyle;
  final int maxLines;

  @override
  State<ExpandedText> createState() => _ExpandedTextState();
}

class _ExpandedTextState extends State<ExpandedText> {
  bool _isExpand = false;

  TextStyle get _textStyle => widget.textStyle ?? Styles.ts_0C1C33_17sp;

  TextStyle get _actionTextStyle =>
      widget.actionTextStyle ?? Styles.ts_0C1C33_17sp;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, cons) {
      final tp = IMUtils.getTextPainter(
        widget.text,
        _textStyle,
        maxLines: widget.maxLines,
        maxWidth: cons.maxWidth,
      );
      return tp.didExceedMaxLines
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _isExpand
                    ? Text(widget.text, style: _textStyle)
                    : Text(
                        widget.text,
                        style: _textStyle,
                        maxLines: widget.maxLines,
                        overflow: TextOverflow.ellipsis,
                      ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    setState(() {
                      _isExpand = !_isExpand;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: (_isExpand ? StrRes.rollUp : StrRes.fullText).toText
                      ..style = _actionTextStyle,
                  ),
                ),
              ],
            )
          : Text(widget.text, style: _textStyle);
    });
  }
}
