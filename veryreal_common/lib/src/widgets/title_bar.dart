import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:veryreal_common/veryreal_common.dart';

class TitleBar extends StatelessWidget implements PreferredSizeWidget {
  const TitleBar({
    super.key,
    this.height,
    this.left,
    this.center,
    this.right,
    this.backgroundColor,
    this.showUnderline = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
  });
  final double? height;
  final Widget? left;
  final Widget? center;
  final Widget? right;
  final Color? backgroundColor;
  final bool showUnderline;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Container(
        color: backgroundColor ?? Styles.c_FFFFFF,
        padding: EdgeInsets.only(top: mq.padding.top),
        child: Container(
          height: height,
          padding: padding,
          decoration: showUnderline
              ? BoxDecoration(
                  border: BorderDirectional(
                    bottom: BorderSide(color: Styles.c_E8EAEF, width: .5),
                  ),
                )
              : null,
          child: Row(
            children: [
              if (null != left) left!,
              if (null != center) center!,
              if (null != right) right!,
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 44);

  TitleBar.mine({
    super.key,
    Color? backgroundColor,
    Function()? onInviteFriends,
    Function()? onViewWallet,
    required int unreadCount,
    this.left,
  })  : backgroundColor = backgroundColor ?? Styles.c_FFFFFF,
        height = 64,
        padding = const EdgeInsets.symmetric(horizontal: 16),
        showUnderline = false,
        center = Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 22, right: 17),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      IntrinsicWidth(
                        child: ExpandedImageTextButton.inviteFriends(
                          onTap: onInviteFriends,
                        ),
                      ),
                      Positioned(
                        top: -11,
                        right: -25,
                        child: GradientButton.rewards(),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      IntrinsicWidth(
                        child: ExpandedImageTextButton.viewWallet(
                          onTap: onViewWallet,
                        ),
                      ),
                      if (unreadCount > 0)
                        Positioned(
                          top: -14,
                          right: -0,
                          child: UnreadCountView(
                            count: unreadCount,
                            fontSize: 14,
                            size: 21,
                            horizontalPadding: 5.0,
                            radius: 20.0,
                            alwaysRectangle: true,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        right = null;

  TitleBar.conversation(
      {super.key,
      String? statusStr,
      bool isFailed = false,
      required bool hasNotification,
      required int notificationCount,
      Color? backgroundColor,
      Function()? onViewContacts,
      Function()? onScan,
      Function()? onAddFriend,
      Function()? onAddGroup,
      Function()? onCreateGroup,
      Function()? onVideoMeeting,
      CustomPopupMenuController? popCtrl,
      this.left})
      : backgroundColor = backgroundColor ?? Styles.c_FFFFFF,
        height = 62,
        padding = const EdgeInsets.symmetric(horizontal: 16),
        showUnderline = false,
        center = null,
        right = Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ImageRes.userGroup.toImage
                  ..width = 28
                  ..height = 28
                  ..onTap = onViewContacts,
                if (hasNotification)
                  Positioned(
                    top: -6,
                    right: -6,
                    child: UnreadCountView(
                      size: 14,
                      fontSize: 9,
                      count: notificationCount,
                    ),
                  ),
              ],
            ),
            16.hSpace,
            PopButton(
              popCtrl: popCtrl,
              menus: [
                PopMenuInfo(
                  text: StrRes.scan,
                  icon: ImageRes.popMenuScan,
                  onTap: onScan,
                ),
                PopMenuInfo(
                  text: StrRes.addFriend,
                  icon: ImageRes.popMenuAddFriend,
                  onTap: onAddFriend,
                ),
                PopMenuInfo(
                  text: StrRes.addGroup,
                  icon: ImageRes.popMenuAddGroup,
                  onTap: onAddGroup,
                ),
                PopMenuInfo(
                  text: StrRes.createGroup,
                  icon: ImageRes.popMenuCreateGroup,
                  onTap: onCreateGroup,
                ),
                PopMenuInfo(
                  text: StrRes.videoMeeting,
                  icon: ImageRes.popMenuVideoMeeting,
                  onTap: onVideoMeeting,
                ),
              ],
              child: ImageRes.addBlack.toImage
                ..width = 28
                ..height = 28 /*..onTap = onClickAddBtn*/,
            ),
          ],
        );

  TitleBar.chat({
    super.key,
    String? title,
    String? member,
    String? subTitle,
    bool showOnlineStatus = false,
    bool isOnline = false,
    bool isMultiModel = false,
    // bool showCallBtn = true,
    bool showContactBtn = false,
    bool showMagicTranslateStatus = false,
    bool showVIPOnly = false,
    Function()? onClickCallBtn,
    Function()? onClickMoreBtn,
    Function()? onCloseMultiModel,
  })  : backgroundColor = null,
        height = 48,
        padding = const EdgeInsets.symmetric(horizontal: 16),
        showUnderline = false,
        center = null,
        left = Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              isMultiModel
                  ? (StrRes.cancel.toText
                    ..style = Styles.ts_0C1C33_17sp
                    ..onTap = onCloseMultiModel)
                  : (ImageRes.leftChevronBlack.toImage
                    ..width = 24
                    ..height = 24
                    ..onTap = (() => Get.back())),
              8.hSpace,
              if (null != title)
                Flexible(
                  child: Container(
                    child: "${title.trim()} ".fixOverflowEllipsis.toText
                      ..style = Styles.ts_000000_16sp_medium
                      ..maxLines = 1
                      ..overflow = TextOverflow.ellipsis
                      ..textAlign = TextAlign.left
                      ..onTap = (() => Get.back()),
                  ),
                ),
              if (null != member)
                Row(
                  children: [
                    Container(
                        child: member.toText
                          ..style = Styles.ts_000000_16sp_medium
                          ..maxLines = 1),
                    4.hSpace,
                  ],
                ),
              if (subTitle?.isNotEmpty == true) ...[
                Row(
                  children: [
                    Container(
                        child: subTitle!.toText
                          ..style = Styles.ts_8E8E8E_16sp_medium
                          ..maxLines = 1),
                    4.hSpace,
                  ],
                ),
              ],
              if (showOnlineStatus)
                Row(
                  children: [
                    StatusDot(
                      isOnline: isOnline,
                      radius: 3.5,
                      marginLeft: 4,
                    ),
                    4.hSpace,
                  ],
                ),
            ],
          ),
        ),
        right = SizedBox(
            width: 16 +
                (showMagicTranslateStatus && showContactBtn
                    ? 84
                    : showMagicTranslateStatus || showContactBtn
                        ? 56
                        : 28),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                /*
                if (showCallBtn)
                  ImageRes.callBack.toImage
                    ..width = 20
                    ..height = 20
                    ..onTap = onClickCallBtn,
                */
                if (showContactBtn)
                  ImageRes.callBlack.toImage
                    ..width = 24
                    ..height = 24
                    ..onTap = onClickCallBtn,
                if (showMagicTranslateStatus) ...[
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ImageRes.magicTranslateBlack.toImage
                        ..width = 24
                        ..height = 24,
                      /*
                      if (showVIPOnly)
                        Positioned(
                          top: -8,
                          right: 15,
                          child: GradientTextButton.onlyVIP(
                            onTap: () => IMViews.showToast(StrRes.stayTuned),
                          ),
                        ),
                      */
                    ],
                  ),
                ],
                16.hSpace,
                ImageRes.moreBlack.toImage
                  ..width = 24
                  ..height = 24
                  ..onTap = onClickMoreBtn,
              ],
            ));

  TitleBar.back({
    super.key,
    String? title,
    String? leftTitle,
    TextStyle? titleStyle,
    TextStyle? leftTitleStyle,
    String? result,
    Color? backgroundColor,
    Color? backIconColor,
    EdgeInsets? padding,
    this.right,
    this.showUnderline = false,
    Function()? onTap,
  })  : height = 44,
        padding = padding ?? const EdgeInsets.symmetric(horizontal: 16),
        backgroundColor = backgroundColor ?? Styles.c_FFFFFF,
        center = Expanded(
          child: leftTitle == null
              ? Stack(
                  alignment: Alignment.center,
                  children: [
                    (title ?? '').toText
                      ..style = (titleStyle ?? Styles.ts_000000_16sp_medium)
                      ..textAlign = TextAlign.center,
                    Positioned(
                      left: 0,
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: onTap ?? (() => Get.back(result: result)),
                        child: Container(
                          color: Colors.transparent,
                          width: 80,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ImageRes.leftChevronBlack.toImage
                                ..width = 24
                                ..height = 24
                                ..color = backIconColor,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : ((title ?? '').toText
                ..style = (titleStyle ?? Styles.ts_000000_16sp_medium)
                ..textAlign = TextAlign.center),
        ),
        left = leftTitle == null
            ? null
            : GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: onTap ?? (() => Get.back(result: result)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ImageRes.leftChevronBlack.toImage
                      ..width = 24
                      ..height = 24
                      ..color = backIconColor,
                    leftTitle.toText
                      ..style =
                          (leftTitleStyle ?? Styles.ts_000000_16sp_medium),
                  ],
                ),
              );

  TitleBar.backLeftExpanded({
    super.key,
    String? leftTitle,
    TextStyle? leftTitleStyle,
    String? result,
    Color? backgroundColor,
    Color? backIconColor,
    EdgeInsets? padding,
    this.right,
    this.showUnderline = false,
    Function()? onTap,
  })  : height = 44,
        padding = padding ?? const EdgeInsets.symmetric(horizontal: 16),
        backgroundColor = backgroundColor ?? Styles.c_FFFFFF,
        center = null,
        left = Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ImageRes.leftChevronBlack.toImage
                ..width = 24
                ..height = 24
                ..color = backIconColor
                ..onTap = onTap ?? (() => Get.back(result: result)),
              8.hSpace,
              if (null != leftTitle)
                Flexible(
                  child: leftTitle.trim().fixOverflowEllipsis.toText
                    ..style = (leftTitleStyle ?? Styles.ts_000000_16sp_medium)
                    ..maxLines = 1
                    ..overflow = TextOverflow.ellipsis
                    ..textAlign = TextAlign.left
                    ..onTap = onTap ?? (() => Get.back(result: result)),
                ),
            ],
          ),
        );

  TitleBar.backWithRightActionWidget({
    super.key,
    String? title,
    TextStyle? titleStyle,
    String? result,
    Color? backgroundColor,
    Color? backIconColor,
    EdgeInsets? padding,
    Widget? rightActionWidget,
    this.showUnderline = false,
    Function()? onTap,
  })  : height = 44,
        padding = padding ?? const EdgeInsets.symmetric(horizontal: 16),
        backgroundColor = backgroundColor ?? Styles.c_FFFFFF,
        center = Expanded(
            child: Stack(
          alignment: Alignment.center,
          children: [
            (title ?? '').toText
              ..style = (titleStyle ?? Styles.ts_000000_16sp_medium)
              ..textAlign = TextAlign.center,
            Positioned(
              left: 0,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: onTap ?? (() => Get.back(result: result)),
                child: Container(
                  color: Colors.transparent,
                  width: 80,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ImageRes.leftChevronBlack.toImage
                        ..width = 24
                        ..height = 24
                        ..color = backIconColor,
                    ],
                  ),
                ),
              ),
            ),
            if (rightActionWidget != null)
              Positioned(
                right: 0,
                child: rightActionWidget,
              ),
          ],
        )),
        left = null,
        right = null;

  TitleBar.skip({
    super.key,
    String? title,
    String? leftTitle,
    TextStyle? titleStyle,
    TextStyle? leftTitleStyle,
    String? result,
    Color? backgroundColor,
    Color? backIconColor,
    EdgeInsets? padding,
    this.showUnderline = false,
    bool withBack = false,
    Function()? onTap,
    Function()? onSkip,
  })  : height = 44,
        padding = padding ?? const EdgeInsets.symmetric(horizontal: 16),
        backgroundColor = backgroundColor ?? Styles.c_FFFFFF,
        center = Expanded(
          child: leftTitle == null
              ? Stack(
                  alignment: Alignment.center,
                  children: [
                    (title ?? '').toText
                      ..style = (titleStyle ?? Styles.ts_000000_16sp_medium)
                      ..textAlign = TextAlign.center,
                    if (withBack)
                      Positioned(
                        left: 0,
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: onTap ?? (() => Get.back(result: result)),
                          child: Container(
                            color: Colors.transparent,
                            width: 80,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ImageRes.leftChevronBlack.toImage
                                  ..width = 24
                                  ..height = 24
                                  ..color = backIconColor,
                              ],
                            ),
                          ),
                        ),
                      ),
                    if (onSkip != null)
                      Positioned(
                        right: 0,
                        child: StrRes.skip.capitalizeFirstLetterOnly.toText
                          ..style = Styles.ts_000000_16sp_medium
                          ..onTap = onSkip,
                      ),
                  ],
                )
              : ((title ?? '').toText
                ..style = (titleStyle ?? Styles.ts_000000_16sp_medium)
                ..textAlign = TextAlign.center),
        ),
        left = null,
        right = null;

  TitleBar.WorldMoments({
    super.key,
    EdgeInsets? padding,
    Widget? leftActionButtons,
    Widget? rightActionButtons,
    this.showUnderline = false,
  })  : height = 44,
        padding = padding ?? const EdgeInsets.symmetric(horizontal: 16),
        backgroundColor = Colors.transparent,
        center = Expanded(
          child: StrRes.world.toText
            ..style = Styles.ts_FFFFFF_22sp_medium
            ..textAlign = TextAlign.center,
        ),
        left = leftActionButtons,
        right = rightActionButtons;

  TitleBar.contacts({
    super.key,
    this.showUnderline = false,
    Function()? onClickSearch,
    Function()? onClickAddContacts,
    Function()? onTap,
  })  : height = 44,
        padding = const EdgeInsets.symmetric(horizontal: 16),
        backgroundColor = Styles.c_FFFFFF,
        center = const Spacer(),
        left = GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: onTap ?? (() => Get.back()),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ImageRes.leftChevronBlack.toImage
                ..width = 24
                ..height = 24
            ],
          ),
        ),
        right = Row(
          children: [
            ImageRes.searchBlack.toImage
              ..width = 28
              ..height = 28
              ..onTap = onClickSearch,
            16.hSpace,
            ImageRes.addContacts.toImage
              ..width = 28
              ..height = 28
              ..onTap = onClickAddContacts,
          ],
        );

  TitleBar.workbench({
    super.key,
    this.showUnderline = false,
  })  : height = 44,
        padding = const EdgeInsets.symmetric(horizontal: 16),
        backgroundColor = Styles.c_FFFFFF,
        center = null,
        left = StrRes.workbench.toText..style = Styles.ts_0C1C33_20sp_semibold,
        right = null;

  TitleBar.search({
    super.key,
    String? hintText,
    TextEditingController? controller,
    FocusNode? focusNode,
    bool autofocus = true,
    Function(String)? onSubmitted,
    Function()? onCleared,
    ValueChanged<String>? onChanged,
  })  : height = 44,
        padding = const EdgeInsets.symmetric(horizontal: 16),
        backgroundColor = Styles.c_FFFFFF,
        center = Expanded(
          child: Container(
              child: SearchBox(
            enabled: true,
            autofocus: autofocus,
            hintText: hintText,
            controller: controller,
            focusNode: focusNode,
            onSubmitted: onSubmitted,
            onCleared: onCleared,
            onChanged: onChanged,
          )),
        ),
        showUnderline = true,
        right = null,
        left = ImageRes.leftChevronBlack.toImage
          ..width = 24
          ..height = 24
          ..onTap = (() => Get.back());

  TitleBar.carechats({super.key, Function()? onClickAddBtn})
      : backgroundColor = Styles.c_FFFFFF,
        height = 62,
        padding = const EdgeInsets.symmetric(horizontal: 16),
        showUnderline = false,
        left = Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: StrRes.carechats.toText
                  ..style = Styles.ts_0C1C33_20sp_semibold
                  ..maxLines = 1
                  ..overflow = TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        center = null,
        right = Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ImageRes.addBlack.toImage
              ..width = 28
              ..height = 28
              ..onTap = onClickAddBtn,
          ],
        );

  TitleBar.myWallet({super.key, required Function() languageSwitch})
      : backgroundColor = Styles.c_FFFFFF,
        height = 62,
        padding = const EdgeInsets.symmetric(horizontal: 16),
        showUnderline = false,
        left = Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: StrRes.myWallet.toText
                  ..style = Styles.ts_0C1C33_20sp_semibold
                  ..maxLines = 1
                  ..overflow = TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        center = null,
        right = Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ImageTextButton.languageSwitch(
              onTap: languageSwitch,
            ),
          ],
        );

  TitleBar.myWallet2({
    super.key,
    String? result,
    this.showUnderline = false,
    Function()? onClickMore,
    Function()? onTap,
    this.left,
    this.right,
  })  : height = 44,
        padding = const EdgeInsets.symmetric(horizontal: 16),
        backgroundColor = Styles.c_FFFFFF,
        center = Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: [
              StrRes.myWallet.toText
                ..style = Styles.ts_000000_16sp_medium
                ..textAlign = TextAlign.center,
              Positioned(
                left: 0,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: onTap ?? (() => Get.back(result: result)),
                  child: Container(
                    color: Colors.transparent,
                    width: 80,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ImageRes.leftChevronBlack.toImage
                          ..width = 24
                          ..height = 24
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: ImageRes.moreBlack.toImage
                  ..width = 24
                  ..height = 24
                  ..onTap = onClickMore,
              ),
            ],
          ),
        );
}
