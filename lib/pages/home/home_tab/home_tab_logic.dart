import 'package:get/get.dart';
import 'package:telegram_web_app/telegram_web_app.dart';
import 'package:resource_common/resource_common.dart';
import 'dart:html' as html;

class HomeTabLogic extends GetxController {
  final inProgressPercent = 0.0.obs;
  final nextFarm = 0.obs;
  final String appId = "a_b507f99c6ff6451c";
  final String appKey =
      "5f8f7256b0aeb24e728c41993c02c726dc4892d73d54eb4ddab5771ac25d01b2";
  final code = "".obs;

  @override
  void onInit() {
    final parameters = Get.rootDelegate.parameters;
    final vcode = parameters['vcode'];
    final sessionId = parameters['session_id'];

    if (vcode != null && vcode != 'error' && sessionId != null) {
      navigateTo("${Urls.tgCallBackUrl}?startapp=${sessionId}_${vcode}");
    }

    DateTime now = DateTime.now();
    nextFarm.value = DateTime(
            now.year, now.month, now.day, now.hour + 1, now.minute, now.second)
        .millisecondsSinceEpoch;

    super.onInit();
  }

  @override
  void onReady() {
    final param = TelegramWebApp.instance.initDataUnsafe?.startParam;
    if (param != null) {
      var paramArr = param.split("_");
      var sessionId = paramArr[0];
      var vcode = paramArr[1];
      code.value = "sessionId: $sessionId vcode: $vcode";
      verify(sessionId: sessionId, vcode: vcode);
    }

    super.onReady();
  }

  void navigateTo(String newUrl) {
    IMUtils.launch(newUrl, isNewTab: false);
  }

  void download() async {
    final body = {
      "timestamp": DateTime.now().millisecondsSinceEpoch.toString(),
      "nonce_str": IMUtils.generateNonce(),
    };

    final sign = IMUtils.generateSignature(data: body, appKey: appKey);

    final sessionId = await Apis.requestHumanCodeSession(
        appId: appId, sign: sign, body: body);

    final _ = await Apis.registerHumanCode(sessionId: sessionId);
  }

  void verify({required String sessionId, required String vcode}) async {
    final body = {
      "session_id": sessionId,
      "vcode": vcode,
      "timestamp": DateTime.now().millisecondsSinceEpoch.toString(),
      "nonce_str": IMUtils.generateNonce(),
    };
    final sign = IMUtils.generateSignature(data: body, appKey: appKey);
    final humanId =
        await Apis.verifyVCode(appId: appId, sign: sign, body: body);
    code.value = "${code.value} human_id: $humanId";
  }
}
