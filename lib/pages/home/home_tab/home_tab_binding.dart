import 'package:get/get.dart';

import 'home_tab_logic.dart';

class HomeTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeTabLogic());
  }
}
