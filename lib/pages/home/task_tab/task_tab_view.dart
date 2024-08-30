import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource_common/resource_common.dart';
import 'task_tab_logic.dart';

class TaskTabPage extends StatelessWidget {
  final logic = Get.find<TaskTabLogic>();

  TaskTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.c_000000,
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        30.vSpace,
        _buildTaskHeaderView(),
        30.vSpace,
        Expanded(child: _buildTaskListView()),
      ]),
    );
  }

  Widget _buildTaskHeaderView() => Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            ImageRes.diamond.toImage
              ..width = 36
              ..height = 36,
            15.vSpace,
            StrRes.tasks.toText..style = Styles.ts_FFFFFF_30sp_semibold,
            15.vSpace,
            StrRes.taskRewardCaption.toText
              ..style = Styles.ts_8E8E8E_16sp_regular
              ..textAlign = TextAlign.center,
          ],
        ),
      );

  Widget _buildTaskListView() => SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 20,
                itemBuilder: (context, index) =>
                    _buildTaskTile(canClaim: index % 2 == 0),
                separatorBuilder: (BuildContext context, int index) => Divider(
                  color: Styles.c_8E8E8E,
                  thickness: 0.1,
                ),
              ),
              80.vSpace,
            ],
          ),
        ),
      );

  Widget _buildTaskTile({required bool canClaim}) => Container(
        constraints: const BoxConstraints(minHeight: 60),
        child: Row(
          children: [
            ImageRes.diamond.toImage
              ..width = 24
              ..height = 24,
            20.hSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  "${StrRes.farm} ${"9999".currencyFormat(withDecimal: false, withoutSymbol: true)} ${StrRes.credits}"
                      .toText
                    ..style = Styles.ts_FFFFFF_16sp_regular,
                  5.vSpace,
                  "${"57.60/100"} ${StrRes.credits}, +${"9999".currencyFormat(withDecimal: false, withoutSymbol: true)} ${StrRes.credits}"
                      .toText
                    ..style = Styles.ts_B3B3B3_14sp_regular
                ],
              ),
            ),
            _buildClaimButton(canClaim: canClaim),
          ],
        ),
      );

  Widget _buildClaimButton({required bool canClaim}) => Button(
        height: 42,
        enabled: canClaim,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        text: StrRes.claim,
        radius: 100,
        enabledColor: Styles.c_26252B,
        disabledColor: Styles.c_2A2A2A,
        textStyle: Styles.ts_FFFFFF_14sp_medium,
        disabledTextStyle: Styles.ts_5E5E5E_14sp_medium,
      );
}
