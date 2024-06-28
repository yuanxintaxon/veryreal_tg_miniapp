import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:veryreal_common/veryreal_common.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.text,
    this.enabled = true,
    this.enabledColor,
    this.disabledColor,
    this.radius,
    this.border,
    this.textStyle,
    this.disabledTextStyle,
    this.onTap,
    this.onTapWhenDisabled,
    this.onDoubleTap,
    this.height,
    this.margin,
    this.padding,
    this.gradient,
    this.boxShadow,
  });
  final Color? enabledColor;
  final Color? disabledColor;
  final double? radius;
  final Border? border;
  final TextStyle? textStyle;
  final TextStyle? disabledTextStyle;
  final String text;
  final double? height;
  final Function()? onTap;
  final Function()? onTapWhenDisabled;
  final Function()? onDoubleTap;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final bool enabled;
  final Gradient? gradient;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: enabled ? onTap : onTapWhenDisabled,
          onDoubleTap: enabled ? onDoubleTap : null,
          borderRadius: BorderRadius.circular(radius ?? 4),
          child: Ink(
            height: height ?? 44,
            decoration: BoxDecoration(
              color: enabled
                  ? enabledColor ?? Styles.c_000000
                  : disabledColor ?? Styles.c_000000_opacity50,
              borderRadius: BorderRadius.circular(radius ?? 4),
              gradient: (gradient != null) ? gradient : null,
              border: (border != null) ? border : null,
            ),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: (boxShadow != null) ? boxShadow : null,
              ),
              padding: padding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  text.toText
                    ..maxLines = 1
                    ..overflow = TextOverflow.ellipsis
                    ..style = (disabledTextStyle == null)
                        ? textStyle ?? Styles.ts_FFFFFF_17sp_semibold
                        : (enabled)
                            ? textStyle ?? Styles.ts_FFFFFF_17sp_semibold
                            : disabledTextStyle ??
                                Styles.ts_FFFFFF_17sp_semibold,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ImageTextButton extends StatelessWidget {
  const ImageTextButton({
    super.key,
    required this.icon,
    required this.text,
    this.disabledIcon,
    this.iconTrailing = false,
    this.textStyle,
    this.disabledTextStyle,
    this.enabledColor,
    this.disabledColor,
    this.radius,
    this.height,
    this.padding = EdgeInsets.zero,
    this.enabled = true,
    this.onTap,
    this.onTapWhenDisabled,
  });
  final String icon;
  final String text;
  final String? disabledIcon;
  final bool iconTrailing;
  final TextStyle? textStyle;
  final TextStyle? disabledTextStyle;
  final Color? enabledColor;
  final Color? disabledColor;
  final double? radius;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final bool enabled;
  final Function()? onTap;
  final Function()? onTapWhenDisabled;

  ImageTextButton.call({super.key, this.onTap, this.onTapWhenDisabled})
      : icon = ImageRes.audioAndVideoCall,
        text = StrRes.audioAndVideoCall,
        disabledIcon = null,
        iconTrailing = false,
        enabledColor = Styles.c_FFFFFF,
        disabledColor = null,
        radius = null,
        textStyle = null,
        disabledTextStyle = null,
        height = null,
        padding = EdgeInsets.zero,
        enabled = true;

  ImageTextButton.message({super.key, this.onTap, this.onTapWhenDisabled})
      : icon = ImageRes.message,
        text = StrRes.sendMessage,
        disabledIcon = null,
        iconTrailing = false,
        enabledColor = Styles.c_000000,
        disabledColor = null,
        radius = null,
        textStyle = Styles.ts_FFFFFF_17sp,
        disabledTextStyle = null,
        height = null,
        padding = EdgeInsets.zero,
        enabled = true;

  ImageTextButton.next({super.key, this.onTap, this.onTapWhenDisabled})
      : icon = ImageRes.rightArrWhite,
        text = StrRes.next,
        disabledIcon = null,
        iconTrailing = true,
        enabledColor = Styles.c_000000,
        disabledColor = null,
        radius = null,
        textStyle = Styles.ts_FFFFFF_16sp_semibold_ls5_montserrat,
        disabledTextStyle = null,
        height = 56,
        padding = const EdgeInsets.symmetric(horizontal: 16),
        enabled = true;

  ImageTextButton.nextOrSkip(
      {super.key, this.onTap, this.onTapWhenDisabled, required this.text})
      : icon = ImageRes.rightArrWhite,
        disabledIcon = null,
        iconTrailing = true,
        enabledColor = Styles.c_000000,
        disabledColor = null,
        radius = null,
        textStyle = Styles.ts_FFFFFF_16sp_semibold_ls5_montserrat,
        disabledTextStyle = null,
        height = 56,
        padding = const EdgeInsets.symmetric(horizontal: 16),
        enabled = true;

  ImageTextButton.conditionalNext(
      {super.key, this.onTap, this.onTapWhenDisabled, required this.enabled})
      : icon = ImageRes.rightArrWhite,
        text = StrRes.next,
        disabledIcon = ImageRes.rightArrGrey,
        iconTrailing = true,
        enabledColor = Styles.c_000000,
        disabledColor = Styles.c_000000,
        radius = null,
        textStyle = Styles.ts_FFFFFF_16sp_semibold_ls5_montserrat,
        disabledTextStyle = Styles.ts_8E8E8E_16sp_semibold_ls5_montserrat,
        height = 56,
        padding = const EdgeInsets.symmetric(horizontal: 16);

  ImageTextButton.backTransparent(
      {super.key, this.onTap, this.onTapWhenDisabled})
      : icon = ImageRes.leftArrBlack,
        text = StrRes.back.toUpperCase(),
        disabledIcon = null,
        iconTrailing = false,
        enabledColor = Colors.transparent,
        disabledColor = null,
        radius = null,
        textStyle = Styles.ts_000000_16sp_semibold_ls5_montserrat,
        disabledTextStyle = null,
        height = 56,
        padding = const EdgeInsets.symmetric(horizontal: 0),
        enabled = true;

  ImageTextButton.languageSwitch(
      {super.key, this.onTap, this.onTapWhenDisabled})
      : icon = ImageRes.languageSwitch,
        text = StrRes.language,
        disabledIcon = null,
        iconTrailing = false,
        enabledColor = Styles.c_FFFFFF,
        disabledColor = null,
        radius = null,
        textStyle = Styles.ts_000000_16sp_semibold_montserrat,
        disabledTextStyle = null,
        height = 24,
        padding = const EdgeInsets.symmetric(horizontal: 0),
        enabled = true;

  ImageTextButton.inviteFriends({super.key, this.onTap, this.onTapWhenDisabled})
      : icon = ImageRes.inviteFriendsWhite,
        text = StrRes.inviteFriends,
        disabledIcon = null,
        iconTrailing = false,
        enabledColor = Styles.c_868686,
        disabledColor = null,
        radius = 5,
        textStyle = Styles.ts_FFFFFF_16sp_light,
        disabledTextStyle = null,
        height = 26,
        padding = const EdgeInsets.only(left: 8, right: 14),
        enabled = true;

  ImageTextButton.viewVisitors({super.key, this.onTap, this.onTapWhenDisabled})
      : icon = ImageRes.eyeVisitorsWhite,
        text = StrRes.visitors,
        disabledIcon = null,
        iconTrailing = false,
        enabledColor = Styles.c_868686,
        disabledColor = null,
        radius = 30,
        textStyle = Styles.ts_FFFFFF_16sp_light,
        disabledTextStyle = null,
        height = 26,
        padding = const EdgeInsets.symmetric(horizontal: 8),
        enabled = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: enabled ? onTap : onTapWhenDisabled,
        borderRadius: BorderRadius.circular(radius ?? 6),
        child: Ink(
          height: height ?? 46,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? 6),
            color: (disabledTextStyle == null)
                ? enabled
                    ? enabledColor ?? Styles.c_000000
                    : disabledColor ?? Styles.c_000000_opacity50
                : enabledColor ?? Styles.c_000000,
          ),
          child: Container(
            padding: padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (iconTrailing == true) ...[
                  text.toText
                    ..style = (disabledTextStyle == null)
                        ? textStyle ?? Styles.ts_0C1C33_17sp
                        : (enabled)
                            ? textStyle ?? Styles.ts_0C1C33_17sp
                            : disabledTextStyle ?? Styles.ts_0C1C33_17sp,
                  6.hSpace,
                  (disabledIcon == null)
                      ? (icon.toImage
                        ..width = 20
                        ..height = 20)
                      : (enabled)
                          ? (icon.toImage
                            ..width = 20
                            ..height = 20)
                          : (disabledIcon!.toImage
                            ..width = 20
                            ..height = 20),
                ] else ...[
                  (disabledIcon == null)
                      ? (icon.toImage
                        ..width = 20
                        ..height = 20)
                      : (enabled)
                          ? (icon.toImage
                            ..width = 20
                            ..height = 20)
                          : (disabledIcon!.toImage
                            ..width = 20
                            ..height = 20),
                  6.hSpace,
                  text.toText..style = textStyle ?? Styles.ts_0C1C33_17sp,
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ExpandedImageTextButton extends StatelessWidget {
  const ExpandedImageTextButton({
    super.key,
    required this.icon,
    required this.text,
    this.iconSize,
    this.iconTextGap,
    this.iconBottomPadding,
    this.disabledIcon,
    this.iconTrailing = false,
    this.textStyle,
    this.disabledTextStyle,
    this.enabledColor,
    this.disabledColor,
    this.radius,
    this.height,
    this.padding = EdgeInsets.zero,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.enabled = true,
    this.onTap,
  });
  final String icon;
  final double? iconSize;
  final double? iconTextGap;
  final double? iconBottomPadding;
  final String text;
  final String? disabledIcon;
  final bool iconTrailing;
  final TextStyle? textStyle;
  final TextStyle? disabledTextStyle;
  final Color? enabledColor;
  final Color? disabledColor;
  final double? radius;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final MainAxisAlignment mainAxisAlignment;
  final bool enabled;
  final Function()? onTap;

  ExpandedImageTextButton.inviteFriends({super.key, this.onTap})
      : icon = ImageRes.inviteFriendsWhite,
        text = StrRes.inviteFriends,
        iconSize = null,
        iconTextGap = null,
        iconBottomPadding = null,
        disabledIcon = null,
        iconTrailing = false,
        enabledColor = Styles.c_868686,
        disabledColor = null,
        radius = 5,
        textStyle = Styles.ts_FFFFFF_16sp_light,
        disabledTextStyle = null,
        height = 26,
        padding = const EdgeInsets.only(left: 8, right: 14),
        mainAxisAlignment = MainAxisAlignment.center,
        enabled = true;

  ExpandedImageTextButton.viewVisitors({super.key, this.onTap})
      : icon = ImageRes.eyeVisitorsWhite,
        text = StrRes.visitors,
        iconSize = null,
        iconTextGap = null,
        iconBottomPadding = null,
        disabledIcon = null,
        iconTrailing = false,
        enabledColor = Styles.c_868686,
        disabledColor = null,
        radius = 30,
        textStyle = Styles.ts_FFFFFF_16sp_light,
        disabledTextStyle = null,
        height = 26,
        padding = const EdgeInsets.symmetric(horizontal: 8),
        mainAxisAlignment = MainAxisAlignment.center,
        enabled = true;

  ExpandedImageTextButton.viewWallet({super.key, this.onTap})
      : icon = ImageRes.walletWhiteOutline,
        text = StrRes.wallet,
        iconSize = null,
        iconTextGap = null,
        iconBottomPadding = null,
        disabledIcon = null,
        iconTrailing = false,
        enabledColor = Styles.c_868686,
        disabledColor = null,
        radius = 30,
        textStyle = Styles.ts_FFFFFF_16sp_light,
        disabledTextStyle = null,
        height = 26,
        padding = const EdgeInsets.symmetric(horizontal: 8),
        mainAxisAlignment = MainAxisAlignment.center,
        enabled = true;

  ExpandedImageTextButton.continueWithEmail({super.key, this.onTap})
      : icon = ImageRes.emailTrackingWhite,
        text = StrRes.continueWithEmail,
        iconSize = 28,
        iconTextGap = 12,
        iconBottomPadding = null,
        disabledIcon = null,
        iconTrailing = false,
        enabledColor = Styles.c_2A2A2A,
        disabledColor = null,
        radius = 50,
        textStyle = Styles.ts_FFFFFFF_20sp_medium_montserrat,
        disabledTextStyle = null,
        height = 54,
        padding = const EdgeInsets.symmetric(horizontal: 35),
        mainAxisAlignment = MainAxisAlignment.start,
        enabled = true;

  ExpandedImageTextButton.continueWithPhone({super.key, this.onTap})
      : icon = ImageRes.callWhite,
        text = StrRes.continueWithPhone,
        iconSize = 28,
        iconTextGap = 12,
        iconBottomPadding = null,
        disabledIcon = null,
        iconTrailing = false,
        enabledColor = Styles.c_2A2A2A,
        disabledColor = null,
        radius = 50,
        textStyle = Styles.ts_FFFFFFF_20sp_medium_montserrat,
        disabledTextStyle = null,
        height = 54,
        padding = const EdgeInsets.symmetric(horizontal: 35),
        mainAxisAlignment = MainAxisAlignment.start,
        enabled = true;

  ExpandedImageTextButton.continueWithUsername({super.key, this.onTap})
      : icon = ImageRes.username,
        text = StrRes.continueWithUsername,
        iconSize = 28,
        iconTextGap = 12,
        iconBottomPadding = null,
        disabledIcon = null,
        iconTrailing = false,
        enabledColor = Styles.c_2A2A2A,
        disabledColor = null,
        radius = 50,
        textStyle = Styles.ts_FFFFFFF_20sp_medium_montserrat,
        disabledTextStyle = null,
        height = 54,
        padding = const EdgeInsets.symmetric(horizontal: 35),
        mainAxisAlignment = MainAxisAlignment.start,
        enabled = true;

  ExpandedImageTextButton.continueWithGoogle({super.key, this.onTap})
      : icon = ImageRes.google,
        text = StrRes.continueWithGoogle,
        iconSize = 28,
        iconTextGap = 12,
        iconBottomPadding = null,
        disabledIcon = null,
        iconTrailing = false,
        enabledColor = Styles.c_FFFFFF,
        disabledColor = null,
        radius = 50,
        textStyle = Styles.ts_000000_20sp_medium_montserrat,
        disabledTextStyle = null,
        height = 54,
        padding = const EdgeInsets.symmetric(horizontal: 35),
        mainAxisAlignment = MainAxisAlignment.start,
        enabled = true;

  ExpandedImageTextButton.continueWithApple({super.key, this.onTap})
      : icon = ImageRes.apple,
        text = StrRes.continueWithApple,
        iconSize = 28,
        iconTextGap = 12,
        iconBottomPadding = 4,
        disabledIcon = null,
        iconTrailing = false,
        enabledColor = Styles.c_FFFFFF,
        disabledColor = null,
        radius = 50,
        textStyle = Styles.ts_000000_20sp_medium_montserrat,
        disabledTextStyle = null,
        height = 54,
        padding = const EdgeInsets.symmetric(horizontal: 35),
        mainAxisAlignment = MainAxisAlignment.start,
        enabled = true;

  ExpandedImageTextButton.continueWithFacebook({super.key, this.onTap})
      : icon = ImageRes.facebook,
        text = StrRes.continueWithFacebook,
        iconSize = 28,
        iconTextGap = 12,
        iconBottomPadding = null,
        disabledIcon = null,
        iconTrailing = false,
        enabledColor = Styles.c_FFFFFF,
        disabledColor = null,
        radius = 50,
        textStyle = Styles.ts_000000_20sp_medium_montserrat,
        disabledTextStyle = null,
        height = 54,
        padding = const EdgeInsets.symmetric(horizontal: 35),
        mainAxisAlignment = MainAxisAlignment.start,
        enabled = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Ink(
        height: height ?? 46,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 6),
          color: (disabledTextStyle == null)
              ? enabled
                  ? enabledColor ?? Styles.c_000000
                  : disabledColor ?? Styles.c_000000_opacity50
              : enabledColor ?? Styles.c_000000,
        ),
        child: InkWell(
          onTap: (enabled) ? onTap : null,
          borderRadius: BorderRadius.circular(radius ?? 6),
          child: Container(
            padding: padding,
            child: Row(
              mainAxisAlignment: mainAxisAlignment,
              children: [
                if (iconTrailing == true) ...[
                  Flexible(
                    child: text.fixOverflowEllipsis.toText
                      ..overflow = TextOverflow.ellipsis
                      ..maxLines = 1
                      ..style = (disabledTextStyle == null)
                          ? textStyle ?? Styles.ts_0C1C33_17sp
                          : (enabled)
                              ? textStyle ?? Styles.ts_0C1C33_17sp
                              : disabledTextStyle ?? Styles.ts_0C1C33_17sp,
                  ),
                  (iconTextGap ?? 6).hSpace,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (disabledIcon == null)
                          ? (icon.toImage
                            ..width = iconSize ?? 20
                            ..height = iconSize ?? 20)
                          : (enabled)
                              ? (icon.toImage
                                ..width = iconSize ?? 20
                                ..height = iconSize ?? 20)
                              : (disabledIcon!.toImage
                                ..width = iconSize ?? 20
                                ..height = iconSize ?? 20),
                      if (iconBottomPadding != null) iconBottomPadding!.vSpace,
                    ],
                  ),
                ] else ...[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (disabledIcon == null)
                          ? (icon.toImage
                            ..width = iconSize ?? 20
                            ..height = iconSize ?? 20)
                          : (enabled)
                              ? (icon.toImage
                                ..width = iconSize ?? 20
                                ..height = iconSize ?? 20)
                              : (disabledIcon!.toImage
                                ..width = iconSize ?? 20
                                ..height = iconSize ?? 20),
                      if (iconBottomPadding != null) iconBottomPadding!.vSpace,
                    ],
                  ),
                  (iconTextGap ?? 6).hSpace,
                  Flexible(
                      child: text.fixOverflowEllipsis.toText
                        ..overflow = TextOverflow.ellipsis
                        ..maxLines = 1
                        ..style = textStyle ?? Styles.ts_0C1C33_17sp),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ImageTwoLineTextButton extends StatelessWidget {
  const ImageTwoLineTextButton({
    super.key,
    required this.icon,
    required this.text,
    this.iconTrailing = false,
    this.iconOpacity = 1.0,
    this.textStyle,
    this.color,
    this.radius,
    this.height,
    this.width,
    this.padding = EdgeInsets.zero,
    this.onTap,
  });
  final String icon;
  final double iconOpacity;
  final String text;
  final bool iconTrailing;
  final TextStyle? textStyle;
  final Color? color;
  final double? radius;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final Function()? onTap;

  ImageTwoLineTextButton.signup({super.key, this.onTap})
      : icon = ImageRes.rightArrBlack,
        iconOpacity = 0.0,
        text = StrRes.signup,
        iconTrailing = true,
        color = Styles.c_F3E7C2,
        radius = 5,
        textStyle = Styles.ts_000000_16sp_semibold_ls5_montserrat,
        height = 56,
        width = 120,
        padding = const EdgeInsets.symmetric(horizontal: 16);

  ImageTwoLineTextButton.login({super.key, this.onTap})
      : icon = ImageRes.rightArrBlack,
        iconOpacity = 1.0,
        text = StrRes.login,
        iconTrailing = true,
        color = Styles.c_FFFFFF,
        radius = 5,
        textStyle = Styles.ts_000000_16sp_semibold_ls5_montserrat,
        height = 56,
        width = 120,
        padding = const EdgeInsets.symmetric(horizontal: 16);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(radius ?? 6),
        child: Ink(
          height: height ?? 46,
          width: width ?? 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? 6),
            color: color,
          ),
          child: Container(
            padding: padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (iconTrailing == true) ...[
                  Expanded(
                    child: text.toText
                      ..style = textStyle ?? Styles.ts_0C1C33_17sp
                      ..maxLines = 2
                      ..overflow = TextOverflow.ellipsis,
                  ),
                  6.hSpace,
                  icon.toImage
                    ..width = 20
                    ..height = 20
                    ..opacity = iconOpacity,
                ] else ...[
                  icon.toImage
                    ..width = 20
                    ..height = 20
                    ..opacity = iconOpacity,
                  6.hSpace,
                  Expanded(
                    child: text.toText
                      ..style = textStyle ?? Styles.ts_0C1C33_17sp
                      ..maxLines = 2
                      ..overflow = TextOverflow.ellipsis,
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    required this.icon,
    this.disabledIcon,
    this.enabledColor,
    this.disabledColor,
    this.topRightRadius,
    this.topLeftRadius,
    this.bottomRightRadius,
    this.bottomLeftRadius,
    required this.gradient,
    this.height,
    this.padding = EdgeInsets.zero,
    this.enabled = true,
    this.onTap,
  });
  final String icon;
  final String? disabledIcon;
  final Color? enabledColor;
  final Color? disabledColor;
  final double? topRightRadius;
  final double? topLeftRadius;
  final double? bottomRightRadius;
  final double? bottomLeftRadius;
  final Gradient gradient;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final bool enabled;
  final Function()? onTap;

  GradientButton.rewards({super.key, this.onTap})
      : icon = ImageRes.rewards,
        disabledIcon = null,
        enabledColor = null,
        disabledColor = null,
        topRightRadius = 15,
        topLeftRadius = 22,
        bottomRightRadius = 15,
        bottomLeftRadius = 2,
        gradient = Styles.linear_gradient_DFC554_FFEBAE,
        height = 21,
        padding = const EdgeInsets.only(left: 6, right: 0, top: 1, bottom: 1),
        enabled = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: (enabled) ? onTap : null,
        child: Ink(
          height: height ?? 46,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeftRadius ?? 6),
              topRight: Radius.circular(topRightRadius ?? 6),
              bottomLeft: Radius.circular(bottomLeftRadius ?? 6),
              bottomRight: Radius.circular(bottomRightRadius ?? 6),
            ),
            gradient: gradient,
          ),
          child: Container(
            padding: padding,
            child: (disabledIcon == null)
                ? (icon.toImage
                  ..width = 29.55
                  ..height = 19)
                : (enabled)
                    ? (icon.toImage
                      ..width = 29.55
                      ..height = 19)
                    : (disabledIcon!.toImage
                      ..width = 29.55
                      ..height = 19),
          ),
        ),
      ),
    );
  }
}

class GradientTextButton extends StatelessWidget {
  const GradientTextButton({
    super.key,
    this.icon,
    this.iconSize,
    this.iconTopPadding,
    required this.text,
    this.disabledIcon,
    this.iconTrailing = false,
    this.textStyle,
    this.disabledTextStyle,
    this.enabledColor,
    this.disabledColor,
    this.topRightRadius,
    this.topLeftRadius,
    this.bottomRightRadius,
    this.bottomLeftRadius,
    required this.gradient,
    this.height,
    this.padding = EdgeInsets.zero,
    this.enabled = true,
    this.border,
    this.onTap,
  });
  final String? icon;
  final double? iconSize;
  final double? iconTopPadding;
  final String text;
  final String? disabledIcon;
  final bool iconTrailing;
  final TextStyle? textStyle;
  final TextStyle? disabledTextStyle;
  final Color? enabledColor;
  final Color? disabledColor;
  final double? topRightRadius;
  final double? topLeftRadius;
  final double? bottomRightRadius;
  final double? bottomLeftRadius;
  final Gradient gradient;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final bool enabled;
  final Border? border;
  final Function()? onTap;

  GradientTextButton.rewards({super.key, this.onTap})
      : icon = null,
        iconSize = null,
        iconTopPadding = null,
        text = StrRes.rewards,
        disabledIcon = null,
        iconTrailing = false,
        enabledColor = null,
        disabledColor = null,
        topRightRadius = 15,
        topLeftRadius = 22,
        bottomRightRadius = 15,
        bottomLeftRadius = 2,
        gradient = Styles.linear_gradient_DFC554_FFEBAE,
        textStyle = Styles.ts_694B12_14sp_regular_abril_fatface,
        disabledTextStyle = null,
        height = 21,
        padding = const EdgeInsets.symmetric(horizontal: 10),
        enabled = true,
        border = null;

  GradientTextButton.freeVIP({super.key, this.onTap})
      : icon = null,
        iconSize = null,
        iconTopPadding = null,
        text = StrRes.freeVIP,
        disabledIcon = null,
        iconTrailing = false,
        enabledColor = null,
        disabledColor = null,
        topRightRadius = 15,
        topLeftRadius = 22,
        bottomRightRadius = 15,
        bottomLeftRadius = 2,
        gradient = Styles.linear_gradient_DFC554_FFEBAE,
        textStyle = Styles.ts_694B12_14sp_regular_abril_fatface,
        disabledTextStyle = null,
        height = 21,
        padding = const EdgeInsets.symmetric(horizontal: 16),
        enabled = true,
        border = null;

  GradientTextButton.onlyVIP({super.key, this.onTap})
      : icon = null,
        iconSize = null,
        iconTopPadding = null,
        text = StrRes.vipOnly,
        disabledIcon = null,
        iconTrailing = false,
        enabledColor = null,
        disabledColor = null,
        topRightRadius = 22,
        topLeftRadius = 15,
        bottomRightRadius = 2,
        bottomLeftRadius = 15,
        gradient = Styles.linear_gradient_DFC554_FFEBAE,
        textStyle = Styles.ts_694B12_14sp_regular_abril_fatface,
        disabledTextStyle = null,
        height = 21,
        padding = const EdgeInsets.symmetric(horizontal: 16),
        enabled = true,
        border = null;

  GradientTextButton.aiModeOn({super.key, this.onTap})
      : icon = null,
        iconSize = null,
        iconTopPadding = null,
        text = StrRes.aiModeOn,
        disabledIcon = null,
        iconTrailing = false,
        enabledColor = null,
        disabledColor = null,
        topRightRadius = 5,
        topLeftRadius = 5,
        bottomRightRadius = 5,
        bottomLeftRadius = 5,
        gradient = Styles.linear_gradient_02A3FE_F902FE,
        textStyle = Styles.ts_FFFFFF_14sp,
        disabledTextStyle = null,
        height = 20,
        padding = const EdgeInsets.only(
          left: 5,
          right: 5,
          bottom: 2,
        ),
        enabled = true,
        border = null;

  GradientTextButton.stayTuned({super.key, this.onTap})
      : icon = null,
        iconSize = null,
        iconTopPadding = null,
        text = StrRes.stayTuned,
        disabledIcon = null,
        iconTrailing = false,
        enabledColor = null,
        disabledColor = null,
        topRightRadius = 15,
        topLeftRadius = 22,
        bottomRightRadius = 15,
        bottomLeftRadius = 2,
        gradient = Styles.linear_gradient_DFC554_FFEBAE,
        textStyle = Styles.ts_694B12_14sp_regular_abril_fatface,
        disabledTextStyle = null,
        height = 31,
        padding = const EdgeInsets.symmetric(horizontal: 16),
        enabled = true,
        border = null;

  GradientTextButton.trendy({super.key, this.onTap})
      : icon = null,
        iconSize = null,
        iconTopPadding = null,
        text = StrRes.trendy.toUpperCase(),
        disabledIcon = null,
        iconTrailing = false,
        enabledColor = null,
        disabledColor = null,
        topRightRadius = 15,
        topLeftRadius = 22,
        bottomRightRadius = 15,
        bottomLeftRadius = 2,
        gradient = Styles.linear_gradient_DFC554_FFEBAE,
        textStyle = Styles.ts_694B12_14sp_regular,
        disabledTextStyle = null,
        height = 20,
        padding = const EdgeInsets.symmetric(horizontal: 10),
        enabled = true,
        border = null;

  GradientTextButton.hot({super.key, this.onTap})
      : icon = null,
        iconSize = null,
        iconTopPadding = null,
        text = StrRes.hot.toUpperCase(),
        disabledIcon = null,
        iconTrailing = false,
        enabledColor = null,
        disabledColor = null,
        topRightRadius = 15,
        topLeftRadius = 22,
        bottomRightRadius = 15,
        bottomLeftRadius = 2,
        gradient = Styles.linear_gradient_DFC554_FFEBAE,
        textStyle = Styles.ts_694B12_14sp_regular,
        disabledTextStyle = null,
        height = 20,
        padding = const EdgeInsets.symmetric(horizontal: 10),
        enabled = true,
        border = null;

  GradientTextButton.newS({super.key, this.onTap})
      : icon = null,
        iconSize = null,
        iconTopPadding = null,
        text = StrRes.newS.toUpperCase(),
        disabledIcon = null,
        iconTrailing = false,
        enabledColor = null,
        disabledColor = null,
        topRightRadius = 15,
        topLeftRadius = 22,
        bottomRightRadius = 15,
        bottomLeftRadius = 2,
        gradient = Styles.linear_gradient_DFC554_FFEBAE,
        textStyle = Styles.ts_694B12_14sp_regular,
        disabledTextStyle = null,
        height = 20,
        padding = const EdgeInsets.symmetric(horizontal: 10),
        enabled = true,
        border = null;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: (enabled) ? onTap : null,
        child: Ink(
          height: height ?? 46,
          decoration: BoxDecoration(
            border: border,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeftRadius ?? 6),
              topRight: Radius.circular(topRightRadius ?? 6),
              bottomLeft: Radius.circular(bottomLeftRadius ?? 6),
              bottomRight: Radius.circular(bottomRightRadius ?? 6),
            ),
            gradient: gradient,
          ),
          child: Container(
            padding: padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (iconTrailing == true) ...[
                  text.toText
                    ..style = (disabledTextStyle == null)
                        ? textStyle ?? Styles.ts_0C1C33_17sp
                        : (enabled)
                            ? textStyle ?? Styles.ts_0C1C33_17sp
                            : disabledTextStyle ?? Styles.ts_0C1C33_17sp,
                  if (icon != null)
                    if (disabledIcon == null && icon != null) 6.hSpace,
                  if (icon != null)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (iconTopPadding != null) iconTopPadding!.vSpace,
                        (disabledIcon == null && icon != null)
                            ? (icon!.toImage
                              ..width = iconSize ?? 20
                              ..height = iconSize ?? 20)
                            : (enabled)
                                ? (icon!.toImage
                                  ..width = iconSize ?? 20
                                  ..height = iconSize ?? 20)
                                : (disabledIcon!.toImage
                                  ..width = iconSize ?? 20
                                  ..height = iconSize ?? 20),
                      ],
                    ),
                ] else ...[
                  if (icon != null)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (iconTopPadding != null) iconTopPadding!.vSpace,
                        (disabledIcon == null)
                            ? (icon!.toImage
                              ..width = iconSize ?? 20
                              ..height = iconSize ?? 20)
                            : (enabled)
                                ? (icon!.toImage
                                  ..width = iconSize ?? 20
                                  ..height = iconSize ?? 20)
                                : (disabledIcon!.toImage
                                  ..width = iconSize ?? 20
                                  ..height = iconSize ?? 20),
                      ],
                    ),
                  if (icon != null) 6.hSpace,
                  text.toText..style = textStyle ?? Styles.ts_0C1C33_17sp,
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GradientTextBorderButton extends StatelessWidget {
  const GradientTextBorderButton({
    super.key,
    this.icon,
    this.iconSize,
    this.iconTopPadding,
    required this.text,
    this.disabledIcon,
    this.iconTrailing = false,
    this.textStyle,
    this.disabledTextStyle,
    this.enabledColor,
    this.disabledColor,
    this.topRightRadius,
    this.topLeftRadius,
    this.bottomRightRadius,
    this.bottomLeftRadius,
    required this.gradient,
    this.height,
    this.padding = EdgeInsets.zero,
    this.enabled = true,
    this.boxBorder,
    this.onTap,
  });
  final String? icon;
  final double? iconSize;
  final double? iconTopPadding;
  final String text;
  final String? disabledIcon;
  final bool iconTrailing;
  final TextStyle? textStyle;
  final TextStyle? disabledTextStyle;
  final Color? enabledColor;
  final Color? disabledColor;
  final double? topRightRadius;
  final double? topLeftRadius;
  final double? bottomRightRadius;
  final double? bottomLeftRadius;
  final Gradient gradient;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final bool enabled;
  final BoxBorder? boxBorder;
  final Function()? onTap;

  GradientTextBorderButton.vip({super.key, this.onTap, double? height})
      : icon = null,
        iconSize = null,
        iconTopPadding = null,
        text = StrRes.vip,
        disabledIcon = null,
        iconTrailing = false,
        enabledColor = null,
        disabledColor = null,
        topRightRadius = 2,
        topLeftRadius = 2,
        bottomRightRadius = 2,
        bottomLeftRadius = 2,
        gradient = Styles.sweep_gradient_E0C655_FFEBAC,
        textStyle = Styles.ts_694B12_10sp_regular_abril_fatface,
        disabledTextStyle = null,
        height = height ?? 24,
        padding = const EdgeInsets.symmetric(horizontal: 8),
        enabled = true,
        boxBorder = GradientBoxBorder(
          gradient: Styles.linear_gradient_FFFBEF_806703,
          width: 1,
        );

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: (enabled) ? onTap : null,
        child: Ink(
          height: height ?? 46,
          decoration: BoxDecoration(
            border: boxBorder,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeftRadius ?? 6),
              topRight: Radius.circular(topRightRadius ?? 6),
              bottomLeft: Radius.circular(bottomLeftRadius ?? 6),
              bottomRight: Radius.circular(bottomRightRadius ?? 6),
            ),
            gradient: gradient,
          ),
          child: Container(
            padding: padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (iconTrailing == true) ...[
                  text.toText
                    ..style = (disabledTextStyle == null)
                        ? textStyle ?? Styles.ts_0C1C33_17sp
                        : (enabled)
                            ? textStyle ?? Styles.ts_0C1C33_17sp
                            : disabledTextStyle ?? Styles.ts_0C1C33_17sp
                    ..maxLines = 1,
                  if (icon != null)
                    if (disabledIcon == null && icon != null) 6.hSpace,
                  if (icon != null)
                    (disabledIcon == null && icon != null)
                        ? (icon!.toImage
                          ..width = 20
                          ..height = 20)
                        : (enabled)
                            ? (icon!.toImage
                              ..width = 20
                              ..height = 20)
                            : (disabledIcon!.toImage
                              ..width = 20
                              ..height = 20),
                ] else ...[
                  if (icon != null)
                    (disabledIcon == null)
                        ? (icon!.toImage
                          ..width = 20
                          ..height = 20)
                        : (enabled)
                            ? (icon!.toImage
                              ..width = 20
                              ..height = 20)
                            : (disabledIcon!.toImage
                              ..width = 20
                              ..height = 20),
                  if (icon != null) 6.hSpace,
                  text.toText
                    ..style = textStyle ?? Styles.ts_0C1C33_17sp
                    ..maxLines = 1,
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GradientTextBorderFixWidthButton extends StatelessWidget {
  const GradientTextBorderFixWidthButton({
    super.key,
    this.icon,
    this.iconSize,
    this.iconTopPadding,
    required this.text,
    this.disabledIcon,
    this.iconTrailing = false,
    this.textStyle,
    this.disabledTextStyle,
    this.enabledColor,
    this.disabledColor,
    this.topRightRadius,
    this.topLeftRadius,
    this.bottomRightRadius,
    this.bottomLeftRadius,
    required this.gradient,
    this.height,
    this.width,
    this.padding = EdgeInsets.zero,
    this.enabled = true,
    this.boxBorder,
    this.onTap,
  });
  final String? icon;
  final double? iconSize;
  final double? iconTopPadding;
  final String text;
  final String? disabledIcon;
  final bool iconTrailing;
  final TextStyle? textStyle;
  final TextStyle? disabledTextStyle;
  final Color? enabledColor;
  final Color? disabledColor;
  final double? topRightRadius;
  final double? topLeftRadius;
  final double? bottomRightRadius;
  final double? bottomLeftRadius;
  final Gradient gradient;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final bool enabled;
  final BoxBorder? boxBorder;
  final Function()? onTap;

  GradientTextBorderFixWidthButton.goldw110(
      {super.key, this.onTap, double? height})
      : icon = null,
        iconSize = null,
        iconTopPadding = null,
        text = StrRes.gold,
        disabledIcon = null,
        iconTrailing = false,
        enabledColor = null,
        disabledColor = null,
        topRightRadius = 10,
        topLeftRadius = 10,
        bottomRightRadius = 10,
        bottomLeftRadius = 10,
        gradient = Styles.sweep_gradient_E0C655_FFEBAC_w110,
        textStyle = Styles.ts_694B12_16sp_regular_abril_fatface,
        disabledTextStyle = null,
        height = height ?? 24,
        width = 110,
        padding = const EdgeInsets.symmetric(horizontal: 8),
        enabled = true,
        boxBorder = GradientBoxBorder(
          gradient: Styles.linear_gradient_FFFBEF_806703,
          width: 1,
        );

  GradientTextBorderFixWidthButton.goldw125(
      {super.key, this.onTap, double? height})
      : icon = null,
        iconSize = null,
        iconTopPadding = null,
        text = StrRes.gold,
        disabledIcon = null,
        iconTrailing = false,
        enabledColor = null,
        disabledColor = null,
        topRightRadius = 10,
        topLeftRadius = 10,
        bottomRightRadius = 10,
        bottomLeftRadius = 10,
        gradient = Styles.sweep_gradient_E0C655_FFEBAC_w125,
        textStyle = Styles.ts_694B12_16sp_regular_abril_fatface,
        disabledTextStyle = null,
        height = height ?? 24,
        width = 125,
        padding = const EdgeInsets.symmetric(horizontal: 8),
        enabled = true,
        boxBorder = GradientBoxBorder(
          gradient: Styles.linear_gradient_FFFBEF_806703,
          width: 1,
        );

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: (enabled) ? onTap : null,
        child: Ink(
          width: width,
          height: height ?? 46,
          decoration: BoxDecoration(
            border: boxBorder,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeftRadius ?? 6),
              topRight: Radius.circular(topRightRadius ?? 6),
              bottomLeft: Radius.circular(bottomLeftRadius ?? 6),
              bottomRight: Radius.circular(bottomRightRadius ?? 6),
            ),
            gradient: gradient,
          ),
          child: Container(
            padding: padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (iconTrailing == true) ...[
                  Flexible(
                    child: text.toText
                      ..style = (disabledTextStyle == null)
                          ? textStyle ?? Styles.ts_0C1C33_17sp
                          : (enabled)
                              ? textStyle ?? Styles.ts_0C1C33_17sp
                              : disabledTextStyle ?? Styles.ts_0C1C33_17sp
                      ..maxLines = 1
                      ..textAlign = TextAlign.center,
                  ),
                  if (icon != null)
                    if (disabledIcon == null && icon != null) 6.hSpace,
                  if (icon != null)
                    (disabledIcon == null && icon != null)
                        ? (icon!.toImage
                          ..width = 20
                          ..height = 20)
                        : (enabled)
                            ? (icon!.toImage
                              ..width = 20
                              ..height = 20)
                            : (disabledIcon!.toImage
                              ..width = 20
                              ..height = 20),
                ] else ...[
                  if (icon != null)
                    (disabledIcon == null)
                        ? (icon!.toImage
                          ..width = 20
                          ..height = 20)
                        : (enabled)
                            ? (icon!.toImage
                              ..width = 20
                              ..height = 20)
                            : (disabledIcon!.toImage
                              ..width = 20
                              ..height = 20),
                  if (icon != null) 6.hSpace,
                  Flexible(
                    child: text.toText
                      ..style = textStyle ?? Styles.ts_0C1C33_17sp
                      ..maxLines = 1
                      ..textAlign = TextAlign.center,
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ExpandedGradientTextBorderButton extends StatelessWidget {
  const ExpandedGradientTextBorderButton({
    super.key,
    this.icon,
    this.iconSize,
    this.iconTopPadding,
    required this.text,
    this.disabledIcon,
    this.iconTrailing = false,
    this.textStyle,
    this.disabledTextStyle,
    this.enabledColor,
    this.disabledColor,
    this.topRightRadius,
    this.topLeftRadius,
    this.bottomRightRadius,
    this.bottomLeftRadius,
    required this.gradient,
    this.height,
    this.padding = EdgeInsets.zero,
    this.enabled = true,
    this.boxBorder,
    this.onTap,
  });
  final String? icon;
  final double? iconSize;
  final double? iconTopPadding;
  final String text;
  final String? disabledIcon;
  final bool iconTrailing;
  final TextStyle? textStyle;
  final TextStyle? disabledTextStyle;
  final Color? enabledColor;
  final Color? disabledColor;
  final double? topRightRadius;
  final double? topLeftRadius;
  final double? bottomRightRadius;
  final double? bottomLeftRadius;
  final Gradient gradient;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final bool enabled;
  final BoxBorder? boxBorder;
  final Function()? onTap;

  ExpandedGradientTextBorderButton.defineYourFeatures({super.key, this.onTap})
      : icon = ImageRes.profileTickBlackShadow,
        iconSize = 28,
        iconTopPadding = 2,
        text = StrRes.defineYourFeatures,
        disabledIcon = null,
        iconTrailing = false,
        enabledColor = null,
        disabledColor = null,
        topRightRadius = 5,
        topLeftRadius = 5,
        bottomRightRadius = 5,
        bottomLeftRadius = 5,
        gradient = Styles.linear_gradient_E5C86C_8C7511,
        textStyle = Styles.ts_000000_20sp_regular_shadow,
        disabledTextStyle = null,
        height = 50,
        padding = const EdgeInsets.symmetric(horizontal: 16),
        enabled = true,
        boxBorder = GradientBoxBorder(
          gradient: Styles.linear_gradient_F3E7C2_75610E,
          width: 1,
        );

  ExpandedGradientTextBorderButton.findAClub({super.key, this.onTap})
      : icon = ImageRes.peopleBlackShadow,
        iconSize = 28,
        iconTopPadding = 2,
        text = StrRes.findAClub,
        disabledIcon = null,
        iconTrailing = false,
        enabledColor = null,
        disabledColor = null,
        topRightRadius = 5,
        topLeftRadius = 5,
        bottomRightRadius = 5,
        bottomLeftRadius = 5,
        gradient = Styles.linear_gradient_E5C86C_8C7511,
        textStyle = Styles.ts_000000_20sp_regular_shadow,
        disabledTextStyle = null,
        height = 50,
        padding = const EdgeInsets.symmetric(horizontal: 16),
        enabled = true,
        boxBorder = GradientBoxBorder(
          gradient: Styles.linear_gradient_F3E7C2_75610E,
          width: 1,
        );

  ExpandedGradientTextBorderButton.continueXPerMonth(
      {super.key, required String buttonText, this.onTap, this.enabledColor})
      : icon = null,
        iconSize = null,
        iconTopPadding = null,
        text = buttonText,
        disabledIcon = null,
        iconTrailing = false,
        disabledColor = null,
        topRightRadius = 20,
        topLeftRadius = 20,
        bottomRightRadius = 20,
        bottomLeftRadius = 20,
        gradient = Styles.linear_gradient_FEE9A8_E3C95D,
        textStyle = Styles.ts_000000_16sp_bold,
        disabledTextStyle = null,
        height = 35,
        padding = const EdgeInsets.symmetric(horizontal: 16),
        enabled = true,
        boxBorder = null;

  ExpandedGradientTextBorderButton.purchaseNow(
      {super.key, required String buttonText, this.onTap, this.enabledColor})
      : icon = null,
        iconSize = null,
        iconTopPadding = null,
        text = buttonText,
        disabledIcon = null,
        iconTrailing = false,
        disabledColor = null,
        topRightRadius = 20,
        topLeftRadius = 20,
        bottomRightRadius = 20,
        bottomLeftRadius = 20,
        gradient = Styles.linear_gradient_FEE9A8_E3C95D,
        textStyle = Styles.ts_000000_16sp_medium,
        disabledTextStyle = null,
        height = 35,
        padding = const EdgeInsets.symmetric(horizontal: 16),
        enabled = true,
        boxBorder = null;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: (enabled) ? onTap : null,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topLeftRadius ?? 6),
          topRight: Radius.circular(topRightRadius ?? 6),
          bottomLeft: Radius.circular(bottomLeftRadius ?? 6),
          bottomRight: Radius.circular(bottomRightRadius ?? 6),
        ),
        child: Ink(
          height: height ?? 46,
          decoration: BoxDecoration(
            color: enabledColor,
            border: boxBorder,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeftRadius ?? 6),
              topRight: Radius.circular(topRightRadius ?? 6),
              bottomLeft: Radius.circular(bottomLeftRadius ?? 6),
              bottomRight: Radius.circular(bottomRightRadius ?? 6),
            ),
            gradient: enabledColor != null ? null : gradient,
          ),
          child: Container(
            padding: padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (iconTrailing == true) ...[
                  text.toText
                    ..style = (disabledTextStyle == null)
                        ? textStyle ?? Styles.ts_0C1C33_17sp
                        : (enabled)
                            ? textStyle ?? Styles.ts_0C1C33_17sp
                            : disabledTextStyle ?? Styles.ts_0C1C33_17sp
                    ..maxLines = 1
                    ..overflow = TextOverflow.ellipsis,
                  if (icon != null)
                    if (disabledIcon == null && icon != null) 6.hSpace,
                  if (icon != null)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (iconTopPadding != null) iconTopPadding!.vSpace,
                        (disabledIcon == null && icon != null)
                            ? (icon!.toImage
                              ..width = iconSize ?? 20
                              ..height = iconSize ?? 20)
                            : (enabled)
                                ? (icon!.toImage
                                  ..width = iconSize ?? 20
                                  ..height = iconSize ?? 20)
                                : (disabledIcon!.toImage
                                  ..width = iconSize ?? 20
                                  ..height = iconSize ?? 20),
                      ],
                    ),
                ] else ...[
                  if (icon != null)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (iconTopPadding != null) iconTopPadding!.vSpace,
                        (disabledIcon == null && icon != null)
                            ? (icon!.toImage
                              ..width = iconSize ?? 20
                              ..height = iconSize ?? 20)
                            : (enabled)
                                ? (icon!.toImage
                                  ..width = iconSize ?? 20
                                  ..height = iconSize ?? 20)
                                : (disabledIcon!.toImage
                                  ..width = iconSize ?? 20
                                  ..height = iconSize ?? 20),
                      ],
                    ),
                  if (icon != null) 6.hSpace,
                  Flexible(
                    child: text.toText
                      ..style = textStyle ?? Styles.ts_0C1C33_17sp
                      ..maxLines = 1
                      ..overflow = TextOverflow.ellipsis,
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GradientTextBorderSquareButton extends StatelessWidget {
  const GradientTextBorderSquareButton({
    super.key,
    this.icon,
    this.iconSize,
    this.iconTopPadding,
    required this.text,
    this.disabledIcon,
    this.iconTrailing = false,
    this.textStyle,
    this.disabledTextStyle,
    this.enabledColor,
    this.disabledColor,
    this.topRightRadius,
    this.topLeftRadius,
    this.bottomRightRadius,
    this.bottomLeftRadius,
    required this.gradient,
    this.height,
    this.width,
    this.padding = EdgeInsets.zero,
    this.enabled = true,
    this.boxBorder,
    this.onTap,
  });
  final String? icon;
  final double? iconSize;
  final double? iconTopPadding;
  final String text;
  final String? disabledIcon;
  final bool iconTrailing;
  final TextStyle? textStyle;
  final TextStyle? disabledTextStyle;
  final Color? enabledColor;
  final Color? disabledColor;
  final double? topRightRadius;
  final double? topLeftRadius;
  final double? bottomRightRadius;
  final double? bottomLeftRadius;
  final Gradient gradient;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final bool enabled;
  final BoxBorder? boxBorder;
  final Function()? onTap;

  GradientTextBorderSquareButton.vip({super.key, this.onTap})
      : icon = null,
        iconSize = null,
        iconTopPadding = null,
        text = StrRes.vip,
        disabledIcon = null,
        iconTrailing = false,
        enabledColor = null,
        disabledColor = null,
        topRightRadius = 2,
        topLeftRadius = 2,
        bottomRightRadius = 2,
        bottomLeftRadius = 2,
        gradient = Styles.sweep_gradient_E0C655_FFEBAC,
        textStyle = Styles.ts_694B12_10sp_regular_abril_fatface,
        disabledTextStyle = null,
        height = 24,
        width = 24,
        padding = const EdgeInsets.symmetric(horizontal: 0),
        enabled = true,
        boxBorder = GradientBoxBorder(
          gradient: Styles.linear_gradient_FFFBEF_806703,
          width: 1,
        );

  GradientTextBorderSquareButton.friend({super.key, this.onTap})
      : icon = ImageRes.userAddWhiteShadow,
        iconSize = 28,
        iconTopPadding = 2,
        text = StrRes.friend,
        disabledIcon = null,
        iconTrailing = false,
        enabledColor = null,
        disabledColor = null,
        topRightRadius = 5,
        topLeftRadius = 5,
        bottomRightRadius = 5,
        bottomLeftRadius = 5,
        gradient = Styles.linear_gradient_E5C86C_8C7511,
        textStyle = Styles.ts_ffffff_20sp_regular_shadow,
        disabledTextStyle = null,
        height = 50,
        width = 200,
        padding = const EdgeInsets.symmetric(horizontal: 16),
        enabled = true,
        boxBorder = GradientBoxBorder(
          gradient: Styles.linear_gradient_F3E7C2_75610E,
          width: 1,
        );

  GradientTextBorderSquareButton.message({super.key, this.onTap})
      : icon = ImageRes.messageWhiteShadow,
        iconSize = 28,
        iconTopPadding = 2,
        text = StrRes.message,
        disabledIcon = null,
        iconTrailing = false,
        enabledColor = null,
        disabledColor = null,
        topRightRadius = 5,
        topLeftRadius = 5,
        bottomRightRadius = 5,
        bottomLeftRadius = 5,
        gradient = Styles.linear_gradient_E5C86C_8C7511,
        textStyle = Styles.ts_ffffff_20sp_regular_shadow,
        disabledTextStyle = null,
        height = 50,
        width = 200,
        padding = const EdgeInsets.symmetric(horizontal: 16),
        enabled = true,
        boxBorder = GradientBoxBorder(
          gradient: Styles.linear_gradient_F3E7C2_75610E,
          width: 1,
        );

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: (enabled) ? onTap : null,
        child: Ink(
          height: height ?? 46,
          width: width ?? 46,
          decoration: BoxDecoration(
            border: boxBorder,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeftRadius ?? 6),
              topRight: Radius.circular(topRightRadius ?? 6),
              bottomLeft: Radius.circular(bottomLeftRadius ?? 6),
              bottomRight: Radius.circular(bottomRightRadius ?? 6),
            ),
            gradient: gradient,
          ),
          child: Container(
            padding: padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (iconTrailing == true) ...[
                  text.toText
                    ..style = (disabledTextStyle == null)
                        ? textStyle ?? Styles.ts_0C1C33_17sp
                        : (enabled)
                            ? textStyle ?? Styles.ts_0C1C33_17sp
                            : disabledTextStyle ?? Styles.ts_0C1C33_17sp,
                  if (icon != null)
                    if (disabledIcon == null && icon != null) 6.hSpace,
                  if (icon != null)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (iconTopPadding != null) iconTopPadding!.vSpace,
                        (disabledIcon == null && icon != null)
                            ? (icon!.toImage
                              ..width = iconSize ?? 20
                              ..height = iconSize ?? 20)
                            : (enabled)
                                ? (icon!.toImage
                                  ..width = iconSize ?? 20
                                  ..height = iconSize ?? 20)
                                : (disabledIcon!.toImage
                                  ..width = iconSize ?? 20
                                  ..height = iconSize ?? 20),
                      ],
                    ),
                ] else ...[
                  if (icon != null)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (iconTopPadding != null) iconTopPadding!.vSpace,
                        (disabledIcon == null && icon != null)
                            ? (icon!.toImage
                              ..width = iconSize ?? 20
                              ..height = iconSize ?? 20)
                            : (enabled)
                                ? (icon!.toImage
                                  ..width = iconSize ?? 20
                                  ..height = iconSize ?? 20)
                                : (disabledIcon!.toImage
                                  ..width = iconSize ?? 20
                                  ..height = iconSize ?? 20),
                      ],
                    ),
                  if (icon != null) 6.hSpace,
                  text.toText..style = textStyle ?? Styles.ts_0C1C33_17sp,
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
