import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
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
  // static String get operationID =>
  //     DateTime.now().millisecondsSinceEpoch.toString();

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

  /// login
  static Future<LoginCertificate> login({
    String? areaCode,
    String? phoneNumber,
    String? email,
    String? username,
    String? password,
    String? verificationCode,
  }) async {
    try {
      var data = await HttpUtil.post(Urls.login, showErrorToast: false, data: {
        if (IMUtils.emptyStrToNull(areaCode) != null) 'areaCode': areaCode,
        if (IMUtils.emptyStrToNull(phoneNumber) != null)
          'phoneNumber': phoneNumber,
        if (IMUtils.emptyStrToNull(email) != null) 'account': email,
        if (IMUtils.emptyStrToNull(username) != null) 'username': username,
        'password': null != password ? IMUtils.generateMD5(password) : null,
        'platform': IMUtils.getPlatform(),
        if (IMUtils.emptyStrToNull(verificationCode) != null)
          'verifyCode': verificationCode,
        // 'operationID': operationID,
      });
      return LoginCertificate.fromJson(data!);
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return Future.error(e);
    }
  }
}
