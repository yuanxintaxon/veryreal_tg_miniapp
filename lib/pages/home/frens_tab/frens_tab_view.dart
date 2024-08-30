import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource_common/resource_common.dart';
import 'frens_tab_logic.dart';
import 'package:sprintf/sprintf.dart';

class FrensTabPage extends StatelessWidget {
  final logic = Get.find<FrensTabLogic>();

  FrensTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.c_000000,
      body: Column(children: [
        30.vSpace,
        Expanded(child: _buildInvitationGuideView()),
      ]),
    );
  }

  Widget _buildInvitationGuideView() => Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImageRes.family.toImage
              ..width = 50
              ..height = 50,
            30.vSpace,
            StrRes.inviteFrensCaption.toText
              ..style = Styles.ts_FFFFFF_30sp_semibold
              ..textAlign = TextAlign.center,
            35.vSpace,
            Expanded(child: _buildHowItWorksView()),
            _buildInviteButton(),
            Styles.bottombar_height.vSpace,
            20.vSpace,
          ],
        ),
      );

  Widget _buildHowItWorksView() => Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StrRes.howItWorks.toText
              ..style = Styles.ts_FFFFFF_20sp_regular
              ..textAlign = TextAlign.start,
            30.vSpace,
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Row(
                          children: [
                            30.hSpace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    StrRes.stepOneTitle.toText
                                      ..style = Styles.ts_DBDBDB_16sp_regular
                                      ..textAlign = TextAlign.start,
                                    2.vSpace,
                                    sprintf(StrRes.stepOneSubtitle, ["🎟️"])
                                        .toText
                                      ..style = Styles.ts_8E8E8E_14sp_regular
                                      ..textAlign = TextAlign.start,
                                  ],
                                ),
                                35.vSpace,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    StrRes.stepTwoTitle.toText
                                      ..style = Styles.ts_DBDBDB_16sp_regular
                                      ..textAlign = TextAlign.start,
                                    2.vSpace,
                                    StrRes.stepTwoSubtitle.toText
                                      ..style = Styles.ts_8E8E8E_14sp_regular
                                      ..textAlign = TextAlign.start,
                                  ],
                                ),
                                35.vSpace,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    sprintf(StrRes.stepThreeTitle, ["${10}%"])
                                        .toText
                                      ..style = Styles.ts_DBDBDB_16sp_regular
                                      ..textAlign = TextAlign.start,
                                    2.vSpace,
                                    sprintf(StrRes.stepThreeSubtitle,
                                        ["${2.5}%"]).toText
                                      ..style = Styles.ts_8E8E8E_14sp_regular
                                      ..textAlign = TextAlign.start,
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Positioned.fill(child: _buildVerticalBulletTimeline()),
                      ],
                    ),
                    35.vSpace,
                  ],
                ),
              ),
            )
          ],
        ),
      );

  Widget _buildVerticalBulletTimeline() => Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(vertical: 17),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Styles.c_FFFFFF,
                borderRadius: BorderRadius.circular(100),
              ),
              width: 1,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Styles.c_FFFFFF,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  width: 10,
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Styles.c_FFFFFF,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  width: 10,
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Styles.c_FFFFFF,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  width: 10,
                  height: 10,
                )
              ],
            )
          ],
        ),
      );

  Widget _buildInviteButton() => SizedBox(
        width: double.infinity,
        child: Button(
          height: 56,
          text: sprintf(StrRes.inviteFrenXLeft, ["10"]),
          enabledColor: Styles.c_FFFFFF,
          textStyle: Styles.ts_000000_16sp_bold,
        ),
      );
}
