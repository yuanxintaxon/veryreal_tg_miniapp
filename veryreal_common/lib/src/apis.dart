import 'package:dio/dio.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:veryreal_common/veryreal_common.dart';

class Apis {
  static Future<Options> get imTokenOptions async => Options(headers: {
        'token': await DataSp.imToken,
        'platform': IMUtils.getPlatform(),
      });

  static Future<Options> get chatTokenOptions async => Options(headers: {
        'token': await DataSp.chatToken,
        'platform': IMUtils.getPlatform(),
      });

  static Options get langOptions => Options(headers: {
        'lang': TranslationService.reverseLanguageKeys[
            IMUtils.geAppElseDeviceLocale().toLanguageCountryCode()],
        'platform': IMUtils.getPlatform(),
      });
  static Future<Options> get chatTokenAndlangOptions async => Options(headers: {
        'lang': TranslationService.reverseLanguageKeys[
            IMUtils.geAppElseDeviceLocale().toLanguageCountryCode()],
        'token': await DataSp.chatToken,
        'platform': IMUtils.getPlatform(),
      });
  static Future<Options> get imTokenAndlangOptions async => Options(headers: {
        'lang': TranslationService.reverseLanguageKeys[
            IMUtils.geAppElseDeviceLocale().toLanguageCountryCode()],
        'token': await DataSp.imToken,
        'platform': IMUtils.getPlatform(),
      });

  static Future<String> requestHumanCodeSession({
    required String appId,
    required String sign,
    required dynamic body,
  }) async {
    final result = await HttpUtil.post(
      Urls.requestHumanCodeSession,
      queryParameters: {
        'app_id': appId,
        'sign': sign,
      },
      data: body,
    );

    return result['session_id'];
  }

  static Future<Map<String, String>> registerHumanCode(
      {required String sessionId}) async {
    // Present the dialog to the user
    final result = await FlutterWebAuth2.authenticate(
      url:
          '${Urls.humanCodeRegistration}?session_id=$sessionId&callback_url=${Urls.callBackUrl}',
      callbackUrlScheme: "https",
    );

    // Extract token from resulting url
    final params = Uri.parse(result).queryParameters;
    IMViews.showToast("params $params");
    final vcode = params['vcode'];
    final code = params['error_code'];
    final session_id = params['session_id'];

    return params;
  }

  static Future<Map<String, String>> verifyHumanCode(
      {required String sessionId}) async {
    // Present the dialog to the user
    IMViews.showToast("callback url $Urls.callBackUrl");
    final result = await FlutterWebAuth2.authenticate(
      url:
          '${Urls.humanCodeVerification}?session_id=$sessionId&callback_url=${Urls.callBackUrl}',
      callbackUrlScheme: "https",
    );

    // Extract token from resulting url
    final params = Uri.parse(result).queryParameters;

    return params;
  }

  static Future<String> verifyVCode({
    required String appId,
    required String sign,
    required dynamic body,
  }) async {
    final result = await HttpUtil.post(
      Urls.verifyVCode,
      queryParameters: {
        'app_id': appId,
        'sign': sign,
      },
      data: body,
    );

    return result['human_id'];
  }
}
