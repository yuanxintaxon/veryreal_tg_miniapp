import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veryreal_common/veryreal_common.dart';
import 'frens_tab/frens_tab_view.dart';
import 'home_logic.dart';
import 'home_tab/home_tab_view.dart';
import 'task_tab/task_tab_view.dart';

class HomePage extends StatelessWidget {
  final logic = Get.find<HomeLogic>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Scaffold(
              extendBody: true,
              key: logic.scaffoldKey,
              backgroundColor: Colors.transparent,
              body: IndexedStack(
                index: logic.index.value,
                children: [
                  HomeTabPage(),
                  TaskTabPage(),
                  FrensTabPage(),
                ],
              ),
              bottomNavigationBar: SafeArea(
                bottom: false,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(0),
                    topLeft: Radius.circular(0),
                  ),
                  child: BottomBar(
                    index: logic.index.value,
                    items: [
                      BottomBarItem(
                        selectedImgResDark: ImageRes.homeTab1SelWhite,
                        unselectedImgResDark: ImageRes.homeTab1NorWhite,
                        selectedImgResLight: ImageRes.homeTab1SelBlack,
                        unselectedImgResLight: ImageRes.homeTab1NorBlack,
                        label: StrRes.home,
                        imgWidth: 28,
                        imgHeight: 28,
                        onClick: logic.switchTab,
                        // onDoubleClick: logic.scrollToUnreadMessage,
                        // count: logic.unhandledCount.value,
                      ),
                      BottomBarItem(
                        selectedImgResDark: ImageRes.homeTab2SelWhite,
                        unselectedImgResDark: ImageRes.homeTab2NorWhite,
                        selectedImgResLight: ImageRes.homeTab2SelBlack,
                        unselectedImgResLight: ImageRes.homeTab2NorBlack,
                        label: StrRes.tasks,
                        imgWidth: 28,
                        imgHeight: 28,
                        onClick: logic.switchTab,
                        // count: logic.totalUnhandledCount.value,
                      ),
                      BottomBarItem(
                        selectedImgResDark: ImageRes.homeTab3SelWhite,
                        unselectedImgResDark: ImageRes.homeTab3NorWhite,
                        selectedImgResLight: ImageRes.homeTab3SelBlack,
                        unselectedImgResLight: ImageRes.homeTab3NorBlack,
                        label: StrRes.frens,
                        imgWidth: 28,
                        imgHeight: 28,
                        onClick: logic.switchTab,
                        // count: logic.momentNewMessageCount,
                        // useNotifDot: true,
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
