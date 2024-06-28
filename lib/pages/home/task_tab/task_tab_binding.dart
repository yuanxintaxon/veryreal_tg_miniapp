import 'package:get/get.dart';

import 'task_tab_logic.dart';

class TaskTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaskTabLogic());
  }
}
