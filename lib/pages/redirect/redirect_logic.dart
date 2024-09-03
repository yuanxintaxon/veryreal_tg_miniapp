import 'package:get/get.dart';
import 'package:resource_common/resource_common.dart';

class RedirectLogic extends GetxController {
  @override
  void onInit() {
    final parameters = Get.rootDelegate.parameters;
    final vcode = parameters['vcode'];
    final sessionId = parameters['session_id'];

    if (vcode != null && vcode != 'error' && sessionId != null) {
      navigateTo("${Urls.tgMiniAppUrl}?startapp=${sessionId}_${vcode}");
    }
    super.onInit();
  }

  void navigateTo(String newUrl) {
    IMUtils.launch(newUrl, isNewTab: false);
  }
}
