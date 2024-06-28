import 'package:get/get.dart';

import 'frens_tab_logic.dart';

class FrensTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FrensTabLogic());
  }
}
