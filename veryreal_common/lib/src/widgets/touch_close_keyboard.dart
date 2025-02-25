import 'package:flutter/material.dart';
import 'package:veryreal_common/veryreal_common.dart';

/// 触摸关闭键盘
class TouchCloseSoftKeyboard extends StatelessWidget {
  final Widget child;
  final Function? onTouch;
  final bool isGradientBg;

  const TouchCloseSoftKeyboard({
    super.key,
    required this.child,
    this.onTouch,
    this.isGradientBg = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        // 触摸收起键盘
        FocusScope.of(context).requestFocus(FocusNode());
        onTouch?.call();
      },
      onVerticalDragDown: (details) {
        // 触摸收起键盘
        FocusScope.of(context).requestFocus(FocusNode());
        onTouch?.call();
      },
      child: isGradientBg
          ? Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Styles.c_000000_opacity10,
                    Styles.c_FFFFFF_opacity0,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: child,
            )
          : child,
    );
  }
}
