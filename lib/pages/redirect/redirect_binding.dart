import 'package:get/get.dart';

import 'redirect_logic.dart';

class RedirectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RedirectLogic());
  }
}
