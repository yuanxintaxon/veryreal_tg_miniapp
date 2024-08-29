import 'package:get/get.dart';
import 'package:telegram_web_app/telegram_web_app.dart';
import 'package:veryreal_common/veryreal_common.dart';
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
    DateTime now = DateTime.now();
    nextFarm.value = DateTime(
            now.year, now.month, now.day, now.hour + 1, now.minute, now.second)
        .millisecondsSinceEpoch;
    code.value =
        "${TelegramWebApp.instance.initData}${TelegramWebApp.instance.initDataUnsafe?.startParam}";
    super.onInit();
  }

  void download() async {
    final body = {
      "timestamp": DateTime.now().millisecondsSinceEpoch.toString(),
      "nonce_str": IMUtils.generateNonce(),
    };

    final sign = IMUtils.generateSignature(data: body, appKey: appKey);
    Logger.print("creturn html.window.location ${html.window.location}");
    Logger.print(
        "creturn html.window.location.host ${html.window.location.host}");
    IMViews.showToast("dada");
    final sessionId = await Apis.requestHumanCodeSession(
        appId: appId, sign: sign, body: body);
    Logger.print("creturn sessionId ${sessionId}");
    final params = await Apis.registerHumanCode(sessionId: sessionId);
    code.value = "sss ${params['vcode']}}";
    Logger.print("creturn params ${params}");

    final body2 = {
      "session_id": params['session_id'],
      "vcode": params['vcode'],
      "timestamp": DateTime.now().millisecondsSinceEpoch.toString(),
      "nonce_str": IMUtils.generateNonce(),
    };
    final sign2 = IMUtils.generateSignature(data: body2, appKey: appKey);
    final human_id =
        await Apis.verifyVCode(appId: appId, sign: sign2, body: body2);
    code.value = "${code.value} human_id $human_id";
  }
}
