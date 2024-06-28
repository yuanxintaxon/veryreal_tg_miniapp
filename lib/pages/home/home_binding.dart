import 'package:get/get.dart';

import 'frens_tab/frens_tab_logic.dart';
import 'home_logic.dart';
import 'home_tab/home_tab_logic.dart';
import 'task_tab/task_tab_logic.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    /// home logic
    Get.lazyPut(() => HomeLogic());

    /// tab pages logic
    Get.lazyPut(() => HomeTabLogic());
    Get.lazyPut(() => TaskTabLogic());
    Get.lazyPut(() => FrensTabLogic());
  }
}
