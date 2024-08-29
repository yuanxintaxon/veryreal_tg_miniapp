import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:veryreal_common/veryreal_common.dart';
import 'home_tab_logic.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeTabPage extends StatelessWidget {
  final logic = Get.find<HomeTabLogic>();

  HomeTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Styles.c_000000,
      body: Obx(
        () => Stack(
          alignment: Alignment.center,
          children: [
            ImageRes.homeBg2.toImage
              ..width = width
              ..height = height
              ..fit = BoxFit.cover,
            _buildUserInfoView(),
            Positioned(
              bottom: Styles.bottombar_height + 10,
              left: 0,
              right: 0,
              child: _buildBannerAndProgressView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfoView() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            30.vSpace,
            AvatarView(
              isCircle: true,
              text: logic.code.value,
              url: "https://picsum.photos/id/237/200/300",
              textStyle: Styles.ts_FFFFFF_10sp,
              width: 80,
              height: 80,
            ),
            15.vSpace,
            "BlackPink388".toText..style = Styles.ts_FFFFFF_18sp_semibold,
            30.vSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageRes.diamond.toImage..height = 24,
                10.hSpace,
                "${"9999".currencyFormat(withDecimal: false, withoutSymbol: true)}"
                    .toText
                  ..style = Styles.ts_FFFFFF_30sp_semibold,
              ],
            ),
          ],
        ),
      );

  Widget _buildBannerAndProgressView() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          _buildBannerView(),
          30.vSpace,
          _buildProgressView(),
          10.vSpace,
        ]),
      );

  Widget _buildBannerView() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Styles.c_000000.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            _buildLogo(),
            15.vSpace,
            Align(
              alignment: Alignment.center,
              child: _buildDownloadButton(),
            ),
            5.vSpace,
          ],
        ),
      );

  Widget _buildLogo() => Row(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: Styles.box_shadow_avatar,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: ImageRes.appLogo.toImage
                ..width = 51
                ..height = 51,
            ),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageRes.logoTextGold.toImage
                  ..width = 179
                  ..height = 38,
                3.vSpace,
                Transform.translate(
                  offset: const Offset(7, -7),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Styles.c_8E8E8E_opacity30,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: StrRes.appIntroSubtitle.toText
                      ..style = Styles.ts_FFFFFF_14sp_regular,
                  ),
                )
              ],
            ),
          ),
        ],
      );

  Widget _buildDownloadButton() => Button(
        height: 36,
        radius: 100,
        text: StrRes.download,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        textStyle: Styles.ts_000000_16sp_semibold,
        enabledColor: Styles.c_FFFFFF,
        onTap: logic.download,
      );

  Widget _buildProgressView() => Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearPercentIndicator(
              padding: EdgeInsets.zero,
              animation: true,
              animationDuration: 1000,
              animateFromLastPercent: true,
              isRTL: false,
              lineHeight: 60.0,
              percent: 0.5,
              barRadius: const Radius.circular(0),
              backgroundColor: Styles.c_8E8E8E,
              linearGradient: LinearGradient(
                colors: [
                  Styles.c_000000_opacity70,
                  Styles.c_000000_opacity85,
                  Styles.c_000000_opacity88,
                ],
                stops: const [0.0, 0.9, 1.0],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StrRes.farming.toText..style = Styles.ts_DBDBDB_16sp_medium,
              4.hSpace,
              ImageRes.diamond.toImage..height = 16,
              4.hSpace,
              "${"999".currencyFormat(withDecimal: false, withoutSymbol: true)}"
                  .toText
                ..style = Styles.ts_DBDBDB_16sp_medium,
            ],
          ),
          Positioned(
            right: 20,
            child: VeryTextCountdown(
              style: Styles.ts_DBDBDB_12sp_medium,
              targetDate: IMUtils.getDateTimeByMs(logic.nextFarm.value),
            ),
          ),
        ],
      );
}
