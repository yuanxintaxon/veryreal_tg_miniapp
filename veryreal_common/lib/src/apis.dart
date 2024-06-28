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

  /// reset password
  static Future<dynamic> resetPassword({
    String? areaCode,
    String? phoneNumber,
    String? email,
    String? username,
    required String password,
    required String verificationCode,
  }) async {
    return HttpUtil.post(
      Urls.resetPwd,
      data: {
        if (IMUtils.emptyStrToNull(areaCode) != null) 'areaCode': areaCode,
        if (IMUtils.emptyStrToNull(phoneNumber) != null)
          'phoneNumber': phoneNumber,
        if (IMUtils.emptyStrToNull(email) != null) 'email': email,
        if (IMUtils.emptyStrToNull(username) != null) 'username': username,
        'password': IMUtils.generateMD5(password),
        if (IMUtils.emptyStrToNull(verificationCode) != null)
          'verifyCode': verificationCode,
        'platform': IMUtils.getPlatform(),
        // 'operationID': operationID,
      },
      options: await chatTokenOptions,
    );
  }

  /// change password
  static Future<bool> changePassword({
    required String userID,
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      await HttpUtil.post(
        Urls.changePwd,
        data: {
          "userID": userID,
          'currentPassword': IMUtils.generateMD5(currentPassword),
          'newPassword': IMUtils.generateMD5(newPassword),
          'platform': IMUtils.getPlatform(),
          // 'operationID': operationID,
        },
        options: await chatTokenOptions,
      );
      return true;
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return false;
    }
  }

  /// update user info
  static Future<dynamic> updateUserInfo({
    required String userID,
    String? account,
    String? phoneNumber,
    String? areaCode,
    String? email,
    String? nickname,
    String? faceURL,
    int? gender,
    int? birth,
    int? level,
    int? allowAddFriend,
    int? allowBeep,
    int? allowVibration,
    String? language,
    String? igUsername,
    String? location,
    String? aboutMe,
    String? introVideo,
    int? height,
    int? weight,
  }) async {
    Map<String, dynamic> param = {'userID': userID};
    void put(String key, dynamic value) {
      if (null != value) {
        param[key] = value;
      }
    }

    put('account', account);
    put('phoneNumber', phoneNumber);
    put('areaCode', areaCode);
    put('email', email);
    put('nickname', nickname);
    put('faceURL', faceURL);
    put('gender', gender);
    put('level', level);
    put('birth', birth);
    put('allowAddFriend', allowAddFriend);
    put('allowBeep', allowBeep);
    put('allowVibration', allowVibration);
    put('language', language);
    put('igUsername', igUsername);
    put('location', location);
    put('aboutMe', aboutMe);
    put('introVideo', introVideo);
    put('height', height);
    put('weight', weight);

    return HttpUtil.post(
      Urls.updateUserInfo,
      data: {
        ...param,
        'platform': IMUtils.getPlatform(),
        // 'operationID': operationID,
      },
      options: await chatTokenOptions,
    );
  }

  static Future<List<UserFullInfo>?> getUserFullInfo({
    int pageNumber = 0,
    int showNumber = 10,
    required List<String> userIDList,
  }) async {
    final data = await HttpUtil.post(
      Urls.getUsersFullInfo,
      data: {
        'pagination': {'pageNumber': pageNumber, 'showNumber': showNumber},
        'userIDs': userIDList,
        'platform': IMUtils.getPlatform(),
        // 'operationID': operationID,
      },
      options: await chatTokenOptions,
    );
    if (data['users'] is List) {
      Logger.print("creturn ${jsonEncode(data['users'])}");
      return (data['users'] as List)
          .map((e) => UserFullInfo.fromJson(e))
          .toList();
    }
    return null;
  }

  static Future<List<UserFullInfo>?> searchUserFullInfo({
    required String content,
    int pageNumber = 1,
    int showNumber = 10,
  }) async {
    final data = await HttpUtil.post(
      Urls.searchUserFullInfo,
      data: {
        'pagination': {'pageNumber': pageNumber, 'showNumber': showNumber},
        'keyword': content,
        // 'operationID': operationID,
      },
      options: await chatTokenOptions,
    );
    if (data['users'] is List) {
      return (data['users'] as List)
          .map((e) => UserFullInfo.fromJson(e))
          .toList();
    }
    return null;
  }

  static Future<UserFullInfo> getUserInfoOfB({
    required String userID,
  }) async {
    final data = await HttpUtil.post(
      Urls.queryUserInfo,
      showErrorToast: false,
      data: {'userID': userID},
      options: await chatTokenOptions,
    );
    return UserFullInfo.fromJson(data);
  }

  /// 获取验证码
  /// [usedFor] 1：注册，2：重置密码 3：登录
  static Future<bool> requestVerificationCode({
    String? areaCode,
    String? phoneNumber,
    String? email,
    required int usedFor,
    String? invitationCode,
  }) async {
    return HttpUtil.post(
      Urls.getVerificationCode,
      data: {
        "areaCode": areaCode,
        "phoneNumber": phoneNumber,
        "email": email,
        // 'operationID': operationID,
        'usedFor': usedFor,
        'invitationCode': invitationCode
      },
    ).then((value) {
      IMViews.showToast(StrRes.sentSuccessfully);
      return true;
    }).catchError((e, s) {
      Logger.print('e:$e s:$s');
      return false;
    });
  }

  /// 校验验证码
  static Future<dynamic> checkVerificationCode({
    String? areaCode,
    String? phoneNumber,
    String? email,
    required String verificationCode,
    required int usedFor,
    String? invitationCode,
  }) {
    return HttpUtil.post(
      Urls.checkVerificationCode,
      showErrorToast: false,
      data: {
        "phoneNumber": phoneNumber,
        "areaCode": areaCode,
        "email": email,
        "verifyCode": verificationCode,
        "usedFor": usedFor,
        // 'operationID': operationID,
        'invitationCode': invitationCode
      },
    );
  }

  /// 蒲公英更新检测
  /*
  static Future<UpgradeInfoV2> checkUpgradeV2() {
    return dio.post<Map<String, dynamic>>(
      '',
      options: Options(
        contentType: 'application/x-www-form-urlencoded',
      ),
      data: {
        '_api_key': '6f43600074306e8bc506ed0cd3275e9e',
        'appKey': 'dbccc0c5d85ca2e87dc20f9c13f8cf3a',
      },
    ).then((resp) {
      Map<String, dynamic> map = resp.data!;
      if (map['code'] == 0) {
        return UpgradeInfoV2.fromJson(map['data']);
      }
      return Future.error(map);
    });
  }
  */

  static void queryUserOnlineStatus({
    required List<String> uidList,
    Function(Map<String, String>)? onlineStatusDescCallback,
    Function(Map<String, bool>)? onlineStatusCallback,
  }) async {
    var resp = await HttpUtil.post(
      Urls.userOnlineStatus,
      data: <String, dynamic>{"userIDList": uidList},
      options: await imTokenOptions,
    );
    Map<String, dynamic> map = resp.data!;
    if (map['errCode'] == 0 && map['data'] is List) {
      _handleStatus(
        (map['data'] as List).map((e) => OnlineStatus.fromJson(e)).toList(),
        onlineStatusCallback: onlineStatusCallback,
        onlineStatusDescCallback: onlineStatusDescCallback,
      );
    }
  }

  /// discoverPageURL
  /// ordinaryUserAddFriend,
  /// bossUserID,
  /// adminURL ,
  /// allowSendMsgNotFriend
  /// needInvitationCodeRegister
  /// robots
  static Future<Map<String, dynamic>> getClientConfig() async {
    var result = await HttpUtil.post(
      Urls.getClientConfig,
      data: {
        // 'operationID': operationID,
      },
      options: await chatTokenOptions,
      showErrorToast: false,
    );
    return result['config'] ?? {};
  }

  static _handleStatus(
    List<OnlineStatus> list, {
    Function(Map<String, String>)? onlineStatusDescCallback,
    Function(Map<String, bool>)? onlineStatusCallback,
  }) {
    final statusDesc = <String, String>{};
    final status = <String, bool>{};
    for (var e in list) {
      if (e.status == 'online') {
        // IOSPlatformStr     = "IOS"
        // AndroidPlatformStr = "Android"
        // WindowsPlatformStr = "Windows"
        // OSXPlatformStr     = "OSX"
        // WebPlatformStr     = "Web"
        // MiniWebPlatformStr = "MiniWeb"
        // LinuxPlatformStr   = "Linux"
        final pList = <String>[];
        for (var platform in e.detailPlatformStatus!) {
          if (platform.platform == "Android" || platform.platform == "IOS") {
            pList.add(StrRes.phoneOnline);
          } else if (platform.platform == "Windows") {
            pList.add(StrRes.pcOnline);
          } else if (platform.platform == "Web") {
            pList.add(StrRes.webOnline);
          } else if (platform.platform == "MiniWeb") {
            pList.add(StrRes.webMiniOnline);
          } else {
            statusDesc[e.userID!] = StrRes.online;
          }
        }
        statusDesc[e.userID!] = '${pList.join('/')}${StrRes.online}';
        status[e.userID!] = true;
      } else {
        statusDesc[e.userID!] = StrRes.offline;
        status[e.userID!] = false;
      }
    }
    onlineStatusDescCallback?.call(statusDesc);
    onlineStatusCallback?.call(status);
  }

  static Future<List<UniMPInfo>> queryUniMPList() async {
    var result = await HttpUtil.post(
      Urls.uniMPUrl,
      data: {
        // 'operationID': operationID,
      },
      options: await chatTokenOptions,
      showErrorToast: false,
    );
    return (result as List).map((e) => UniMPInfo.fromJson(e)).toList();
  }

  /// 查询tag组
  static Future<TagGroup> getUserTags({String? userID}) async => HttpUtil.post(
        Urls.getUserTags,
        data: {'userID': userID},
        options: await chatTokenOptions,
      ).then((value) => TagGroup.fromJson(value));

  /// 创建tag
  static createTag({
    required String tagName,
    required List<String> userIDList,
  }) async =>
      HttpUtil.post(
        Urls.createTag,
        data: {'tagName': tagName, 'userIDs': userIDList},
        options: await chatTokenOptions,
      );

  /// 创建tag
  static deleteTag({required String tagID}) async => HttpUtil.post(
        Urls.deleteTag,
        data: {'tagID': tagID},
        options: await chatTokenOptions,
      );

  /// 创建tag
  static updateTag({
    required String tagID,
    required String name,
    required List<String> increaseUserIDList,
    required List<String> reduceUserIDList,
  }) async =>
      HttpUtil.post(
        Urls.updateTag,
        data: {
          'tagID': tagID,
          'name': name,
          'addUserIDs': increaseUserIDList,
          'delUserIDs': reduceUserIDList,
        },
        options: await chatTokenOptions,
      );

  static Future<List<TagChip>> getCitiesList() async {
    final result = await HttpUtil.getV(
      Urls.getCitiesList,
      options: langOptions,
    );
    if (result is List) {
      return result.map((e) => TagChip.fromJson(e)).toList();
    }
    return [];
  }

  static Future<List<TagChip>> getTopicsList() async {
    final result = await HttpUtil.getV(
      Urls.getTopicsList,
      options: langOptions,
    );
    if (result is List) {
      return result.map((e) => TagChip.fromJson(e)).toList();
    }
    return [];
  }

  static Future<List<TagChip>> getFeaturesList() async {
    final result = await HttpUtil.getV(
      Urls.getTagsList,
      options: langOptions,
    );
    if (result is List) {
      return result.map((e) => TagChip.fromJson(e)).toList();
    }
    return [];
  }

  static Future<String> uploadAvatar({
    required String sourcePath,
    required Uint8List bytes,
  }) async {
    final result = await HttpUtil.uploadImageBytes(
      Urls.uploadAvatar,
      sourcePath: sourcePath,
      bytes: bytes,
      options: langOptions,
    );
    return result;
  }

  static Future<LoginCertificate> registerUser({
    required String nickname,
    required String password,
    String? faceURL,
    required String areaCode,
    required String phoneNumber,
    String? email,
    String? username,
    required int birthday,
    required int gender,
    required String verificationCode,
    required String invitationCode,
    required List<TagChip> cities,
    required List<TagChip> topics,
    required List<TagChip> features,
  }) async {
    try {
      dynamic body = {
        'deviceID': await DataSp.getDeviceID(),
        if (IMUtils.emptyStrToNull(verificationCode) != null)
          'verifyCode': verificationCode,
        'platform': IMUtils.getPlatform(),
        // 'platform': 10,
        // 'operationID': operationID,
        'invitationCode': invitationCode,
        'autoLogin': true,
        'user': {
          "nickname": nickname,
          "faceURL": faceURL,
          'birth': birthday,
          'gender': gender,
          if (IMUtils.emptyStrToNull(email) != null) 'email': email,
          if (IMUtils.emptyStrToNull(username) != null) 'username': username,
          if (IMUtils.emptyStrToNull(areaCode) != null) 'areaCode': areaCode,
          if (IMUtils.emptyStrToNull(phoneNumber) != null)
            'phoneNumber': phoneNumber,
          'password': IMUtils.generateMD5(password),
          'language': TranslationService.reverseLanguageKeys[
              IMUtils.geAppElseDeviceLocale().toLanguageCountryCode()],
          'location': await DataSp.getRegisterLocation(),
          'cities': cities.map((city) => city.toJson()).toList(),
          'topics': topics.map((topic) => topic.toJson()).toList(),
          'features': features.map((feature) => feature.toJson()).toList(),
        },
      };
      Logger.print("creturn $body");
      var data = await HttpUtil.postV(Urls.registerUser, data: body);

      return LoginCertificate.fromJson(data!);
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return Future.error(e);
    }
  }

  static Future<bool> getAIMode() async {
    final result = await HttpUtil.getV(
      Urls.getAIMode,
      options: await chatTokenAndlangOptions,
    );
    return result['enabled'] ?? false;
  }

  static Future<void> switchAIMode({required bool enabled}) async {
    try {
      await HttpUtil.postV(Urls.switchAIMode,
          options: await chatTokenAndlangOptions,
          data: {
            'enabled': enabled,
          });
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return Future.error(e);
    }
  }

  static Future<List<VoiceModel>> getVoiceModelsList() async {
    final result = await HttpUtil.getV(
      Urls.getVoiceModels,
      options: await chatTokenAndlangOptions,
    );
    if (result is List) {
      return result.map((e) => VoiceModel.fromJson(e)).toList();
    }
    return [];
  }

  static Future<void> saveVoiceModels(
      Map<String, List<dynamic>> languagesSelectedVoiceMap) async {
    try {
      List<Map<String, dynamic>> voiceModels = languagesSelectedVoiceMap.entries
          .map((entry) => {
                "language": entry.key,
                "languageId": entry.value[0],
                "voiceModelId": entry.value[1],
                "customized": entry.value[2],
              })
          .toList();

      await HttpUtil.postV(
        Urls.saveVoiceModels,
        options: await chatTokenAndlangOptions,
        data: {'voiceModels': voiceModels},
      );
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return Future.error(e);
    }
  }

  static Future<AIAvatar> getAIAvatar() async {
    final result = await HttpUtil.getV(
      Urls.getAIAvatar,
      options: await chatTokenAndlangOptions,
    );
    return AIAvatar.fromJson(result);
  }

  static Future<void> saveAIAvatar(AIAvatar aiAvatar) async {
    try {
      await HttpUtil.postV(
        Urls.saveAIAvatar,
        options: await chatTokenAndlangOptions,
        data: {
          'selfIntroduction': aiAvatar.selfIntroduction,
          'talkTopic': aiAvatar.talkTopic,
          'speakStyle': aiAvatar.speakStyle,
        },
      );
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return Future.error(e);
    }
  }

  static Future<List<MyTag>> getMyTagsList() async {
    final result = await HttpUtil.getV(
      Urls.getMyTags,
      options: await chatTokenAndlangOptions,
    );
    if (result is List) {
      return result.map((e) => MyTag.fromJson(e)).toList();
    }
    return [];
  }

  static Future<List<MyTag>> getOthersTagsList({required String userId}) async {
    final result = await HttpUtil.getV(
      Urls.getUsersTagsList,
      options: await chatTokenAndlangOptions,
      queryParameters: {
        'userId': userId,
      },
    );
    if (result is List) {
      return result.map((e) => MyTag.fromJson(e)).toList();
    }
    return [];
  }

  static Future<void> deleteAccount({required String userID}) async {
    try {
      await HttpUtil.post(
        Urls.deleteAccount,
        options: await chatTokenOptions,
        data: {
          'userId': userID,
        },
      );
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return Future.error(e);
    }
  }

  static Future<List<String>>
      getExcludedCountryCodeForPhoneRegistration() async {
    var result = await HttpUtil.getV(
      Urls.excludedCountryCodeForPhoneRegistration,
      options: langOptions,
    );
    if (result is List) {
      List<String> countryCodeList =
          result.map((element) => element['abbr'].toString()).toList();
      return countryCodeList;
    }
    return [];
  }

  static Future<String> getVoicePrompt() async {
    var result = await HttpUtil.getV(
      Urls.getVoicePrompt,
      options: await chatTokenAndlangOptions,
    );

    return result['prompt'];
  }

  static Future<int> generateUserVoiceModel() async {
    final result = await HttpUtil.postV(
      Urls.generateUserVoiceModel,
      options: await chatTokenAndlangOptions,
    );
    return result['taskId'] as int;
  }

  static Future<PreviewVoiceModel> getUserPreviewVoiceModel(int taskId) async {
    try {
      final result = await HttpUtil.postV(
        Urls.getUserPreviewVoiceModel,
        options: await chatTokenAndlangOptions,
        data: {
          'taskId': taskId,
        },
      );
      return PreviewVoiceModel.fromJson(result);
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return Future.error(e);
    }
  }

  static Future<List<SupportedLanguage>>
      getGeneratedVoiceModelLangsList() async {
    var result = await HttpUtil.getV(
      Urls.getGeneratedVoiceModelLangsList,
      options: await chatTokenAndlangOptions,
    );
    if (result is List) {
      return result.map((e) => SupportedLanguage.fromJson(e)).toList();
    }
    return [];
  }

  static Future<int> generateUserOwnVoices({
    String? modelName,
  }) async {
    final result = await HttpUtil.postV(
      Urls.generateUserOwnVoices,
      options: await chatTokenAndlangOptions,
      data: {
        'modelName': modelName,
      },
    );
    return result['taskId'] as int;
  }

  static Future<VoiceCloningStatus> getGenerateVoiceModelStatus(
      int taskId) async {
    try {
      final result = await HttpUtil.postV(
        Urls.getGenerateVoiceModelStatus,
        options: await chatTokenAndlangOptions,
        data: {
          'taskId': taskId,
        },
      );
      return VoiceCloningStatus.fromJson(result);
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return Future.error(e);
    }
  }

  static Future<void> setVoiceCloningCurrentStep(int step,
      [int? taskId]) async {
    try {
      final _ = await HttpUtil.postV(
        Urls.setVoiceCloningCurrentStep,
        options: await chatTokenAndlangOptions,
        data: {
          'step': step,
          if (taskId != null) 'taskId': taskId,
        },
      );
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return Future.error(e);
    }
  }

  static Future<VoiceCloningStepTaskHistory>
      getVoiceCloningCurrentStep() async {
    var result = await HttpUtil.getV(
      Urls.getVoiceCloningCurrentStep,
      options: await chatTokenAndlangOptions,
    );

    return VoiceCloningStepTaskHistory.fromJson(result);
  }

  static Future<RecordedUserVoiceFile> uploadRecordedUserVoice({
    required String sourcePath,
  }) async {
    final result = await HttpUtil.uploadFile(
      Urls.uploadRecordedUserVoice,
      sourcePath: sourcePath,
      options: await chatTokenAndlangOptions,
    );
    return RecordedUserVoiceFile.fromJson(result);
  }

  static Future<RecordedUserVoiceFile?> getRecordedUserVoice() async {
    var result = await HttpUtil.getV(
      Urls.getRecordedUserVoice,
      options: await chatTokenAndlangOptions,
    );
    Logger.print("creturn getRecordedUserVoice ${jsonEncode(result)}");

    return result != null ? RecordedUserVoiceFile.fromJson(result) : null;
  }

  static Future<void> deleteRecordedUserVoice(int fileId) async {
    try {
      final _ = await HttpUtil.postV(
        Urls.deleteRecordedUserVoice,
        options: await chatTokenAndlangOptions,
        data: {
          'fileId': fileId,
        },
      );
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return Future.error(e);
    }
  }

  static Future<bool> checkUserDelete() async {
    var result = await HttpUtil.getV(
      Urls.checkUserDelete,
      options: await chatTokenAndlangOptions,
    );

    return result['passed'] ?? false;
  }

  static Future<List<MyTagCat>> getAllCatTags() async {
    final result = await HttpUtil.getV(
      Urls.getAllCatTags,
      options: await chatTokenAndlangOptions,
    );
    if (result is List) {
      return result.map((e) => MyTagCat.fromJson(e)).toList();
    }
    return [];
  }

  static Future<List<TagChip>> getMyCitiesList() async {
    final result = await HttpUtil.getV(
      Urls.getMyCitiesList,
      options: await chatTokenAndlangOptions,
    );
    if (result is List) {
      return result.map((e) => TagChip.fromJson(e)).toList();
    }
    return [];
  }

  static Future<WorldUserResult> searchUsers(
      {WorldFilterData? filterData,
      required String searchType,
      required int pageSize,
      List<int>? sort}) async {
    try {
      Logger.print("creturn searchType $searchType");
      final result = await HttpUtil.postV(
        Urls.searchUsers,
        options: await chatTokenAndlangOptions,
        data: {
          'body': {
            'searchType': searchType,
            if (filterData != null) 'gender': filterData.gender,
            if (filterData != null)
              'cities': filterData.selectedCities.map((e) => e.id).toList(),
            if (filterData != null)
              'tags': filterData.selectedFeatures.map((e) => e.id).toList(),
            if (filterData != null)
              'age': {
                'min': filterData.age.min.toInt(),
                'max': filterData.age.max.toInt(),
              },
            if (filterData != null)
              'height': {
                'min': filterData.height.min.toInt(),
                'max': filterData.height.max.toInt(),
              },
            if (filterData != null)
              'weight': {
                'min': filterData.weight.min.toInt(),
                'max': filterData.weight.max.toInt(),
              },
          },
          'pageSize': pageSize,
          if (sort != null) 'sort': sort,
        },
      );

      return WorldUserResult.fromJson(result);
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return Future.error(e);
    }
  }

  static Future<ClubResult?> getUserClubs(
      {required int showNumber,
      required int pageNumber,
      required int userId}) async {
    try {
      final result = await HttpUtil.postV(
        Urls.getUserClubs,
        options: await chatTokenAndlangOptions,
        data: {
          'pagination': {
            'showNumber': showNumber,
            'pageNumber': pageNumber,
          },
          'userId': userId,
        },
      );
      if (result == null) return null;
      return ClubResult.fromJson(result);
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return Future.error(e);
    }
  }

  static Future<WorldClubResult> searchClubs(
      {String? searchType,
      required int pageSize,
      String? keyword,
      List<int>? sort}) async {
    try {
      final result = await HttpUtil.postV(
        Urls.searchClubs,
        options: await chatTokenAndlangOptions,
        data: {
          'body': {
            'searchType': searchType,
            if (keyword != null && keyword.isNotEmpty) 'keyword': keyword,
          },
          'pageSize': pageSize,
          if (sort != null) 'sort': sort,
        },
      );

      return WorldClubResult.fromJson(result);
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return Future.error(e);
    }
  }

  static Future<WorldMomentsResult> getWorldMomentsList({
    required int pageSize,
    List<dynamic>? sort,
  }) async {
    try {
      final result = await HttpUtil.postV(
        Urls.getWorldMomentsList,
        options: await chatTokenAndlangOptions,
        data: {
          'pageSize': pageSize,
          'sort': sort,
        },
      );

      return WorldMomentsResult.fromJson(result);
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return Future.error(e);
    }
  }

  static Future<void> addVisitRecord({
    required int visitedUserId,
  }) async {
    try {
      await HttpUtil.postV(
        Urls.addVisitRecord,
        options: await chatTokenAndlangOptions,
        data: {
          'visitedUserId': visitedUserId,
        },
      );
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return Future.error(e);
    }
  }

  static Future<VisitorsResult> getVisitorsList({
    required int page,
    required int pageSize,
  }) async {
    final result = await HttpUtil.getV(
      Urls.getVisitorsList,
      options: await chatTokenAndlangOptions,
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
      },
    );
    return VisitorsResult.fromJson(result);
  }

  static Future<MyTag> createCustomTag({
    required String name,
  }) async {
    try {
      final result = await HttpUtil.postV(
        Urls.createCustomTag,
        options: await chatTokenAndlangOptions,
        data: {
          'name': name,
        },
      );

      return MyTag.fromJson(result);
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return Future.error(e);
    }
  }

  static Future<List<MyTag>> getMyCustomTags() async {
    final result = await HttpUtil.getV(
      Urls.getMyCustomTags,
      options: await chatTokenAndlangOptions,
    );
    if (result is List) {
      return result.map((e) => MyTag.fromJson(e)).toList();
    }
    return [];
  }

  static Future<void> updateMyTags({
    required List<MyTag> updatedMyTags,
  }) async {
    try {
      await HttpUtil.postV(
        Urls.updateMyTags,
        options: await chatTokenAndlangOptions,
        data: {
          'tags': updatedMyTags.map((e) => e.toJson()).toList(),
        },
      );
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return Future.error(e);
    }
  }

  static Future<List<LocationOption>> getLocationOptions(
      {required int parentId}) async {
    final result = await HttpUtil.getV(
      Urls.getLocationOptions,
      options: await chatTokenAndlangOptions,
      queryParameters: {
        'parentId': parentId,
      },
    );
    if (result is List) {
      return result.map((e) => LocationOption.fromJson(e)).toList();
    }
    return [];
  }

  static Future<WorldUser> getWorldUser({
    required int userId,
  }) async {
    final result = await HttpUtil.getV(
      Urls.getWorldUser,
      options: await chatTokenAndlangOptions,
      queryParameters: {
        'userId': userId,
      },
    );
    return WorldUser.fromJson(result);
  }

  static Future<ThirdPartyLoginCertificate> continueWithSSO(
      {required String ssoType, required String body}) async {
    try {
      final result = await HttpUtil.postV(
        Urls.continueWithSSO,
        options: await chatTokenAndlangOptions,
        data: {
          'body': body,
          'type': ssoType,
          'platform': IMUtils.getPlatform(),
          'deviceID': await DataSp.getDeviceID(),
        },
      );

      return ThirdPartyLoginCertificate.fromJson(result);
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return Future.error(e);
    }
  }

  static Future<void> switchDoNotDisturbMode({required bool enabled}) async {
    try {
      await HttpUtil.postV(Urls.switchDoNotDisturbMode,
          options: await chatTokenAndlangOptions,
          data: {
            'enable': enabled,
          });
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return Future.error(e);
    }
  }

  static Future<bool> getDoNotDisturbMode({required String userId}) async {
    try {
      final result = await HttpUtil.postV(
        Urls.getDoNotDisturbMode,
        options: await chatTokenAndlangOptions,
        data: {
          'applyFriendUserId': userId,
        },
      );
      return result['enabled'] ?? false;
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return Future.error(e);
    }
  }

  static Future<bool> verifyReceipt({required String verificationData}) async {
    try {
      final result = await HttpUtil.postV(
        Urls.verifyReceipt,
        options: await chatTokenAndlangOptions,
        data: {
          'receiptData': verificationData,
        },
      );
      return result['success'] ?? false;
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return Future.error(e);
    }
  }

  static Future<SubscriptionTierInfo> getSubscriptionTierInfo() async {
    final result = await HttpUtil.getV(
      Urls.getSubscriptionTierInfo,
      options: await chatTokenAndlangOptions,
    );
    return SubscriptionTierInfo.fromJson(result);
  }

  static Future<SubscriptionQuotaInfo> getSubscriptionQuotaInfo(
      {required String userId}) async {
    try {
      final result = await HttpUtil.postV(
        Urls.getSubscriptionQuotaInfo,
        options: await chatTokenAndlangOptions,
        data: {
          'recvId': userId,
        },
      );

      return SubscriptionQuotaInfo.fromJson(result);
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return Future.error(e);
    }
  }

  static Future<bool> getSubscriptionAIAvatarQuotaInfo() async {
    try {
      final result = await HttpUtil.getV(
        Urls.getSubscriptionAIAvatarQuotaInfo,
        options: await chatTokenAndlangOptions,
      );

      return result['aiAvatarValid'] ?? false;
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return Future.error(e);
    }
  }

  static Future<int> getFriendNum() async {
    final result = await HttpUtil.getV(
      Urls.getFriendNum,
      options: await chatTokenAndlangOptions,
    );
    return result['friendNum'] ?? 0;
  }

  static Future<List<MeetingVirtualUser>> getMeetingVirtualUsers(
      {required String meetingId}) async {
    final result = await HttpUtil.postV(
      Urls.getMeetingVirtualUsers,
      options: await chatTokenAndlangOptions,
      data: {
        'meetingId': meetingId,
      },
    );
    if (result is List) {
      return result.map((e) => MeetingVirtualUser.fromJson(e)).toList();
    }
    return [];
  }

  static Future<void> updateMeetingVirtualUsersSettings(
      {required String meetingId,
      required bool virtualUserEnabled,
      required int virtualUserCount}) async {
    try {
      await HttpUtil.postV(
        Urls.updateMeetingVirtualUsersSettings,
        options: await chatTokenAndlangOptions,
        data: {
          'meetingId': meetingId,
          'virtualUserEnabled': virtualUserEnabled,
          'virtualUserCount': virtualUserCount,
        },
      );
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return Future.error(e);
    }
  }

  static Future<MeetingInfoV> getMeetingInfo(
      {required String meetingId}) async {
    final result = await HttpUtil.getV(
      Urls.getMeetingInfo,
      options: await chatTokenAndlangOptions,
      queryParameters: {
        'meetingId': meetingId,
      },
    );

    return MeetingInfoV.fromJson(result);
  }

  static Future<MeetingConfig> getMeetingConfig() async {
    final result = await HttpUtil.getV(
      Urls.getMeetingConfig,
      options: await chatTokenAndlangOptions,
    );

    return MeetingConfig.fromJson(result);
  }

  static Future<GroupVirtualUserConfig> getGroupVirtualUserConfig() async {
    final result = await HttpUtil.getV(
      Urls.getGroupVirtualUserConfig,
      options: await chatTokenAndlangOptions,
    );

    return GroupVirtualUserConfig.fromJson(result);
  }

  static Future<GroupChatbotConfig> getGroupChatbotConfig() async {
    final result = await HttpUtil.getV(
      Urls.getGroupChatbotConfig,
      options: await chatTokenAndlangOptions,
    );

    return GroupChatbotConfig.fromJson(result);
  }

  static Future<void> updateGroupVirtualUserSettings(
      {required String groupId,
      required bool virtualUserEnabled,
      required int virtualUserCount}) async {
    try {
      await HttpUtil.postV(
        Urls.updateGroupVirtualUserSettings,
        options: await chatTokenAndlangOptions,
        data: {
          'groupId': groupId,
          'virtualUserEnabled': virtualUserEnabled,
          'virtualUserCount': virtualUserCount,
        },
      );
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return Future.error(e);
    }
  }

  static Future<void> updateGroupChatbotSettings(
      {required String groupId,
      required bool aiChatEnabled,
      required int aiChatUsers,
      required int aiChatPeriod}) async {
    try {
      await HttpUtil.postV(
        Urls.updateGroupChatbotSettings,
        options: await chatTokenAndlangOptions,
        data: {
          'groupId': groupId,
          'aiChatEnabled': aiChatEnabled,
          'aiChatUsers': aiChatUsers,
          'aiChatPeriod': aiChatPeriod,
        },
      );
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return Future.error(e);
    }
  }

  static Future<List<GroupVirtualUser>> getGroupVirtualUsers(
      {required String groupId}) async {
    final result = await HttpUtil.postV(
      Urls.getGroupVirtualUsers,
      options: await chatTokenAndlangOptions,
      data: {
        'groupId': groupId,
      },
    );
    if (result is List) {
      return result.map((e) => GroupVirtualUser.fromJson(e)).toList();
    }
    return [];
  }

  static Future<bool> checkAccount({
    String? areaCode,
    String? phoneNumber,
    String? email,
    String? username,
  }) async {
    final result = await HttpUtil.postV(
      Urls.checkAccount,
      data: {
        'email': email,
        "areaCode": areaCode,
        'phoneNumber': phoneNumber,
        'username': username,
      },
    );
    Logger.print("result $result");
    return result;
  }

  static Future<AppUpgradeInfo> checkAppVersion(
      {required String version}) async {
    try {
      final result = await HttpUtil.postV(
        Urls.checkAppVersion,
        data: {
          'app': "WLD3",
          "version": version,
        },
      );

      return AppUpgradeInfo.fromJson(result);
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return Future.error(e);
    }
  }

  static Future<AISoulStatus> checkAISoulStatus() async {
    final result = await HttpUtil.getV(
      Urls.checkAISoulStatus,
      options: await chatTokenAndlangOptions,
    );
    return AISoulStatus.fromJson(result);
  }

  static Future<AISoul> getAISoulGuides() async {
    final result = await HttpUtil.getV(
      Urls.getAISoulGuides,
      options: await chatTokenAndlangOptions,
    );
    return AISoul.fromJson(result);
  }

  static Future<void> generateAISoul(
      {required String uploadName,
      required Map<String, String> fileMap}) async {
    try {
      await HttpUtil.uploadMultipleFiles(
        Urls.generateAISoul,
        uploadName: uploadName,
        fileMap: fileMap,
        options: await chatTokenAndlangOptions,
      );
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return Future.error(e);
    }
  }

  static Future<bool> checkSecurityLockStatus() async {
    final result = await HttpUtil.getV(
      Urls.checkSecurityLockStatus,
      options: await chatTokenAndlangOptions,
    );
    return result['enabled'] ?? false;
  }

  static Future<bool> verifySecurityLock({required String lockKey}) async {
    try {
      final result = await HttpUtil.postV(
        Urls.verifySecurityLock,
        options: await chatTokenAndlangOptions,
        data: {
          'lockKey': lockKey,
        },
      );
      return result['success'] ?? false;
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return Future.error(e);
    }
  }

  static Future<void> createSecurityLock({required String lockkey}) async {
    try {
      await HttpUtil.postV(
        Urls.createSecurityLock,
        options: await chatTokenAndlangOptions,
        data: {
          'deviceID': await DataSp.getDeviceID(),
          if (Platform.isAndroid)
            'deviceType': "android"
          else if (Platform.isIOS)
            'deviceType': "ios",
          'lockKey': lockkey,
        },
      );
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return Future.error(e);
    }
  }

  static Future<void> switchOffSecurityLockStatus() async {
    try {
      await HttpUtil.postV(
        Urls.switchSecurityLockStatus,
        options: await chatTokenAndlangOptions,
        data: {
          'enabled': false, // switch off only
        },
      );
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return Future.error(e);
    }
  }

  static Future<String?> getSecurityLock() async {
    final result = await HttpUtil.getV(
      Urls.getSecurityLock,
      options: await chatTokenAndlangOptions,
    );
    return result['lockKey'];
  }

  static Future<List<WalletAddress>> getWalletAddresses(
      {String? tokenId}) async {
    try {
      final result = await HttpUtil.postV(
        Urls.getWalletAddresses,
        options: await chatTokenAndlangOptions,
        data: {
          'tokenId': tokenId,
        },
      );

      if (result is List) {
        return result.map((e) => WalletAddress.fromJson(e)).toList();
      }
      return [];
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return Future.error(e);
    }
  }

  static Future<WalletAsset> getWalletAssets() async {
    Logger.print(
        "creturn lo ${(await chatTokenAndlangOptions).headers!["imToken"]}");
    final result = await HttpUtil.getV(
      Urls.getWalletAssets,
      options: await chatTokenAndlangOptions,
    );
    return WalletAsset.fromJson(result);
  }

  static Future<Asset> getUserAsset({required String tokenId}) async {
    final result = await HttpUtil.getV(
      Urls.getUserAsset,
      options: await chatTokenAndlangOptions,
      queryParameters: {
        'tokenId': tokenId,
      },
    );
    return Asset.fromJson(result);
  }

  static Future<TransferRecordResult> getTranferRecords({
    required int page,
    required int pageSize,
    String? tokenId,
  }) async {
    final result = await HttpUtil.getV(
      Urls.getTranferRecords,
      options: await chatTokenAndlangOptions,
      queryParameters: {
        'pageNum': page,
        'pageSize': pageSize,
        if (tokenId != null) 'tokenId': tokenId,
      },
    );
    return TransferRecordResult.fromJson(result);
  }

  static Future<TokenInfo> getTokenInfo({required String tokenId}) async {
    final result = await HttpUtil.getV(
      Urls.getTokenInfo,
      options: await chatTokenAndlangOptions,
      queryParameters: {
        'tokenId': tokenId,
      },
    );
    return TokenInfo.fromJson(result);
  }

  static Future<WithdrawalResponse> calculateWithdrawalDetail(
      {required int tokenId,
      required int chainId,
      required String amount}) async {
    try {
      final result = await HttpUtil.postV(
        Urls.calculateWithdrawalDetail,
        options: await chatTokenAndlangOptions,
        data: {
          'tokenId': tokenId,
          'chainId': chainId,
          'amount': amount,
        },
      );

      return WithdrawalResponse.fromJson(result);
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return Future.error(e);
    }
  }

  static Future<WithdrawalResponse> createWithdrawal({
    required int tokenId,
    required int chainId,
    required String amount,
    required String toAddress,
    // required int chainId,
  }) async {
    try {
      final result = await HttpUtil.postV(
        Urls.createWithdrawal,
        options: await chatTokenAndlangOptions,
        data: {
          'tokenId': tokenId,
          'chainId': chainId,
          'amount': amount,
          'toAddress': toAddress,
          // 'chainId': chainId,
        },
        showErrorToast: false,
        showErrorDialog: true,
      );

      return WithdrawalResponse.fromJson(result);
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return Future.error(e);
    }
  }

  static Future<bool> createMoneyPacket({
    required String recvId,
    required String packetType,
    required String packetCount,
    required String eachPacketAmount,
    required String totalAmount,
    required int tokenId,
    required String wish,
  }) async {
    try {
      final result = await HttpUtil.postV(
        Urls.createMoneyPacket,
        options: await chatTokenAndlangOptions,
        data: {
          "recvId": recvId,
          "packetType": packetType,
          "packetCount": packetCount,
          "eachPacketAmount": eachPacketAmount,
          "totalAmount": totalAmount,
          "tokenId": tokenId,
          "wish": wish
        },
      );

      return result['success'] ?? false;
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return Future.error(e);
    }
  }

  static Future<GrabMoneyPacketResponse> grabMoneyPacket({
    required String groupId,
    required String serialNo,
  }) async {
    try {
      final result = await HttpUtil.postV(
        Urls.grabMoneyPacket,
        showErrorToast: false,
        options: await chatTokenAndlangOptions,
        data: {
          "groupId": groupId,
          "serialNo": serialNo,
        },
      );

      return GrabMoneyPacketResponse.fromJson(result);
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return Future.error(e);
    }
  }

  static Future<MoneyPacket> getMoneyPacketDetail({
    required String groupId,
    required String serialNo,
  }) async {
    try {
      final result = await HttpUtil.postV(
        Urls.getMoneyPacketDetail,
        options: await chatTokenAndlangOptions,
        data: {
          "groupId": groupId,
          "serialNo": serialNo,
        },
      );

      return MoneyPacket.fromJson(result);
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return Future.error(e);
    }
  }

  static Future<String> calculateTokenValue(
      {required String tokenId, required String amount}) async {
    try {
      final result = await HttpUtil.postV(
        Urls.calculateTokenValue,
        options: await chatTokenAndlangOptions,
        data: {
          'tokenId': tokenId,
          'amount': amount,
        },
      );

      return result['tokenValue'] ?? "0.00";
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return Future.error(e);
    }
  }

  static Future<MoneyPacketStatus> getMoneyPacketStatus({
    required String groupId,
    required String serialNo,
  }) async {
    try {
      final result = await HttpUtil.postV(
        Urls.getMoneyPacketStatus,
        options: await chatTokenAndlangOptions,
        data: {
          "groupId": groupId,
          "serialNo": serialNo,
        },
      );

      return MoneyPacketStatus.fromJson(result["statusDesc"]);
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return Future.error(e);
    }
  }

  static Future<TokenPriceInfo> getWLDCoinPriceInfo() async {
    final result = await HttpUtil.getV(
      Urls.getWLDCoinPriceInfo,
      options: await chatTokenAndlangOptions,
    );
    return TokenPriceInfo.fromJson(result);
  }

  static Future<WldCoinInfo> getWLDCoinInfo() async {
    final result = await HttpUtil.getV(
      Urls.getWLDCoinInfo,
      options: await chatTokenAndlangOptions,
    );
    return WldCoinInfo.fromJson(result);
  }

  static Future<WldCoinHash> getWLDCoinHash() async {
    final result = await HttpUtil.getV(
      Urls.getWLDCoinHash,
      options: await chatTokenAndlangOptions,
      showErrorToast: false,
    );
    return WldCoinHash.fromJson(result);
  }

  static Future<List<WorlddaoProduct>> getWorlddaoProducts() async {
    final result = await HttpUtil.getV(
      Urls.getWorlddaoProducts,
      options: await chatTokenAndlangOptions,
    );
    if (result is List) {
      return result.map((e) => WorlddaoProduct.fromJson(e)).toList();
    }
    return [];
  }

  static Future<List<WorlddaoAnnouncement>> getWorlddaoAnnouncements() async {
    final result = await HttpUtil.getV(
      Urls.getWorlddaoAnnouncements,
      options: await chatTokenAndlangOptions,
    );
    if (result is List) {
      return result.map((e) => WorlddaoAnnouncement.fromJson(e)).toList();
    }
    return [];
  }

  static Future<List<WorlddaoApplication>> getWorlddaoApplications() async {
    final result = await HttpUtil.getV(
      Urls.getWorlddaoApplications,
      options: await chatTokenAndlangOptions,
    );
    if (result is List) {
      return result.map((e) => WorlddaoApplication.fromJson(e)).toList();
    }
    return [];
  }

  static Future<WorlddaoProduct> getWorlddaoProductDetails(
      {required int productId}) async {
    final result = await HttpUtil.getV(
      Urls.getWorlddaoProductDetails,
      options: await chatTokenAndlangOptions,
      queryParameters: {
        'productId': productId,
      },
    );
    return WorlddaoProduct.fromJson(result);
  }

  static Future<WorlddaoProductEarningsResult> getWorlddaoProductEarnings({
    required int orderId,
    required int page,
    required int pageSize,
  }) async {
    final result = await HttpUtil.getV(
      Urls.getWorlddaoProductEarnings,
      options: await chatTokenAndlangOptions,
      queryParameters: {
        'orderId': orderId,
        'pageNum': page,
        'pageSize': pageSize,
      },
    );
    return WorlddaoProductEarningsResult.fromJson(result);
  }

  static Future<List<WorlddaoOrder>> getWorlddaoOrders() async {
    final result = await HttpUtil.getV(
      Urls.getWorlddaoOrders,
      options: await chatTokenAndlangOptions,
    );
    if (result is List) {
      return result.map((e) => WorlddaoOrder.fromJson(e)).toList();
    }
    return [];
  }

  static Future<int?> createWorlddaoOrder({
    required int productId,
    required int count,
  }) async {
    try {
      final result = await HttpUtil.postV(
        Urls.createWorlddaoOrder,
        options: await chatTokenAndlangOptions,
        data: {
          'productId': productId,
          'count': count,
        },
        showErrorToast: false,
        showErrorDialog: true,
      );

      return result['orderId'];
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return Future.error(e);
    }
  }

  static Future<Asset?> getUserAssetOrNull({required String tokenId}) async {
    final result = await HttpUtil.getV(
      Urls.getUserAsset,
      options: await chatTokenAndlangOptions,
      queryParameters: {
        'tokenId': tokenId,
      },
      showErrorToast: false,
    );
    if (result != null) {
      return Asset.fromJson(result);
    }
    return null;
  }

  static Future<List<SecurityQuestion>> getSecurityQuestions() async {
    final result = await HttpUtil.getV(
      Urls.getSecurityQuestions,
      options: await chatTokenAndlangOptions,
    );
    if (result is List) {
      return result.map((e) => SecurityQuestion.fromJson(e)).toList();
    }
    return [];
  }

  static Future<void> setSecurityQuestions({
    required String username,
    required List<SecurityQuestion> securityQuestions,
  }) async {
    try {
      await HttpUtil.postV(
        Urls.setSecurityQuestions,
        options: await chatTokenAndlangOptions,
        data: {
          'username': username,
          'answers': securityQuestions.map((sq) => sq.toJson()).toList(),
        },
      );
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return Future.error(e);
    }
  }

  static Future<List<SecurityQuestion>> getUserSecurityQuestions(
      {required String username}) async {
    final result = await HttpUtil.getV(
      Urls.getUserSecurityQuestions,
      options: await chatTokenAndlangOptions,
      queryParameters: {
        'username': username,
      },
    );
    if (result is List) {
      return result.map((e) => SecurityQuestion.fromJson(e)).toList();
    }
    return [];
  }

  static Future<bool> verifyUserSecurityQuestions({
    required String username,
    required List<SecurityQuestion> securityQuestions,
  }) async {
    try {
      final result = await HttpUtil.postV(
        Urls.verifyUserSecurityQuestions,
        options: await chatTokenAndlangOptions,
        showErrorToast: false,
        data: {
          'username': username,
          'answers': securityQuestions.map((sq) => sq.toJson()).toList(),
        },
      );

      return result['hasPassed'] ?? false;
    } catch (e, s) {
      Logger.print('e:$e s:$s');
      return Future.error(e);
    }
  }
}
