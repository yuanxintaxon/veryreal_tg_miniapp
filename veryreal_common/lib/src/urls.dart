import 'config.dart';

class Urls {
  static final onlineStatus =
      "${Config.imApiUrl}/manager/get_users_online_status";
  static final userOnlineStatus =
      "${Config.imApiUrl}/user/get_users_online_status";
  static final queryAllUsers = "${Config.imApiUrl}/manager/get_all_users_uid";

  /// toc
  static final updateUserInfo = "${Config.appAuthUrl}/user/update";

  static final searchFriendInfo = "${Config.appAuthUrl}/friend/search";

  /// to B
  // static final updateUserInfo = "${Config.appAuthUrl}/user/update";

  static final getUsersFullInfo = "${Config.appAuthUrl}/user/find/full";
  static final searchUserFullInfo = "${Config.appAuthUrl}/user/search/full";

  /// to B
  static final queryUserInfo = "${Config.appAuthUrl}/user/info";

  /// 登录注册 独立于im的业务
  static final getVerificationCode = "${Config.appAuthUrl}/account/code/send";
  static final checkVerificationCode =
      "${Config.appAuthUrl}/account/code/verify";
  static final register = "${Config.appAuthUrl}/account/register";

  /// to B
  // static final resetPwd = "${Config.appAuthUrl}/user/reset_password";

  /// toc
  static final resetPwd = "${Config.appAuthUrl}/account/password/reset";

  static final changePwd = "${Config.appAuthUrl}/account/password/change";

  /// toc
  static final login = "${Config.appAuthUrl}/account/login";
  static final appleWebAuthCallback =
      "${Config.appThirdPartyLoginUrl}/callbacks/sign_in_with_apple";

  /// to B
  // static final login = "${Config.appAuthUrl}/user/login";

  static final upgrade = "${Config.appAuthUrl}/app/check";

  /// office
  static final tag = "${Config.appAuthUrl}/office/tag";
  static final getUserTags = "$tag/find/user";
  static final createTag = "$tag/add";
  static final deleteTag = "$tag/del";
  static final updateTag = "$tag/set";
  static final sendTagNotification = "$tag/send";
  static final getTagNotificationLog = "$tag/send/log";
  static final delTagNotificationLog = "$tag/send/log/del";

  /// 全局配置
  static final getClientConfig = '${Config.appAuthUrl}/client_config/get';

  /// 小程序
  static final uniMPUrl = '${Config.appAuthUrl}/applet/list';

  /// 账号删除
  static final deleteAccount = "${Config.appAuthUrl}/account/delete";

  /// for testing websocket disconnection
  // static const wsUrl = "wss://socketsbay.com/wss/v2/1/demo";

  /// websocket
  // main workspace
  static final wsUrl = "${Config.appBusinessWsUrl}/user";
  // meeting workspace
  static final meetingWsUrl = "${Config.appBusinessWsUrl}/meeting";

  /// agreements
  static const userAgreement =
      "https://wdc-eula.s3.ap-northeast-1.amazonaws.com/user_agreement.html";
  static const privacyPolicy =
      "https://wdc-eula.s3.ap-northeast-1.amazonaws.com/privacy_policy.html";
  static const terms =
      "https://wdc-eula.s3.ap-northeast-1.amazonaws.com/terms_of_service.html";

  // app download links
  static const iosLink = "https://apps.apple.com/app/world-dao/id6499471593";
  static const apkLink =
      "https://wdc-app.s3.ap-northeast-1.amazonaws.com/WORLDDAO.apk";

  /// app download qr code links
  static const iosQRCodeLink =
      "https://veryreal-app.s3.ap-northeast-1.amazonaws.com/apple-qr.png";
  static const androidQRCodeLink =
      "https://veryreal-app.s3.ap-northeast-1.amazonaws.com/android-qr.png";

  static const androidApkLink =
      "https://veryreal-app.s3.ap-northeast-1.amazonaws.com/VeryReal.apk";

  /// web url
  static const webApp = "https://wldwldwld.com/#";

  // receiver email address
  static const reportEmail = "report@veryrealai.com";
  static const contactUsEmail = "contactus@veryrealai.com";

  /// VeryReal业务接口 独立于im的业务
  // register
  static final checkAccount = "${Config.appBusinessUrl}/register/check-account";
  static final getCitiesList = "${Config.appBusinessUrl}/register/list-cities";
  static final getTopicsList = "${Config.appBusinessUrl}/register/list-topics";
  static final getTagsList = "${Config.appBusinessUrl}/register/list-tags";
  static final uploadAvatar = "${Config.appBusinessUrl}/register/upload-avatar";
  static final registerUser = "${Config.appBusinessUrl}/register/register-user";
  static final excludedCountryCodeForPhoneRegistration =
      "${Config.appBusinessUrl}/register/list-msg-disabled-countries";

  /// 3rd party SSO
  static final continueWithSSO =
      "${Config.appBusinessUrl}/login/third-party-login";

  // profile
  static final getAIMode = "${Config.appBusinessUrl}/profile/get-ai-mode";
  static final switchAIMode = "${Config.appBusinessUrl}/profile/switch-ai-mode";
  static final getVoiceModels =
      "${Config.appBusinessUrl}/profile/list-voice-models";
  static final saveVoiceModels =
      "${Config.appBusinessUrl}/profile/save-voice-models";
  static final getAIAvatar = "${Config.appBusinessUrl}/profile/get-ai-avatar";
  static final saveAIAvatar = "${Config.appBusinessUrl}/profile/save-ai-avatar";
  static final addVisitRecord =
      "${Config.appBusinessUrl}/profile/add-visit-record";
  static final getVisitorsList =
      "${Config.appBusinessUrl}/profile/list-my-visitors";
  static final createCustomTag =
      "${Config.appBusinessUrl}/profile/create-customized-tag";
  static final getMyCustomTags =
      "${Config.appBusinessUrl}/profile/list-my-customized-tags";
  static final updateMyTags = "${Config.appBusinessUrl}/profile/update-my-tags";
  static final getLocationOptions =
      "${Config.appBusinessUrl}/region/list-regions";
  // voice cloning
  static final getVoicePrompt =
      "${Config.appBusinessUrl}/ai-profile/get-voice-prompt";
  static final generateUserVoiceModel =
      "${Config.appBusinessUrl}/ai-profile/generate-user-voice-model";
  static final getUserPreviewVoiceModel =
      "${Config.appBusinessUrl}/ai-profile/get-user-preview-voice-model";
  static final getGeneratedVoiceModelLangsList =
      "${Config.appBusinessUrl}/ai-profile/list-generate-voice-model-langs";
  static final generateUserOwnVoices =
      "${Config.appBusinessUrl}/ai-profile/generate-user-own-voices";
  static final getGenerateVoiceModelStatus =
      "${Config.appBusinessUrl}/ai-profile/get-generate-voice-model-status";
  static final getVoiceCloningCurrentStep =
      "${Config.appBusinessUrl}/ai-profile/get-generate-voice-step";
  static final setVoiceCloningCurrentStep =
      "${Config.appBusinessUrl}/ai-profile/set-generate-voice-step";
  static final uploadRecordedUserVoice =
      "${Config.appBusinessUrl}/ai-profile/upload-user-voice";
  static final getRecordedUserVoice =
      "${Config.appBusinessUrl}/ai-profile/get-user-voice";
  static final deleteRecordedUserVoice =
      "${Config.appBusinessUrl}/ai-profile/delete-user-voice";
  // delete account
  static final checkUserDelete =
      "${Config.appBusinessUrl}/account/check-user-delete";
  // world
  static final getMyTags = "${Config.appBusinessUrl}/profile/list-my-tags";
  static final getUsersTagsList =
      "${Config.appBusinessUrl}/profile/list-user-tags";
  static final getAllCatTags = "${Config.appBusinessUrl}/tag/list-all-cat-tags";
  static final getMyCitiesList =
      "${Config.appBusinessUrl}/profile/list-my-cities";
  static final searchUsers = "${Config.appBusinessUrl}/world/search-users";
  static final getWorldUser = "${Config.appBusinessUrl}/world/query-user";
  // explore
  static final getUserClubs = "${Config.appBusinessUrl}/group/list-user-clubs";
  static final searchClubs = "${Config.appBusinessUrl}/group/search-clubs";
  static final getWorldMomentsList =
      "${Config.appBusinessUrl}/world/load-user-moments";
  // my subscription
  static final switchDoNotDisturbMode =
      "${Config.appBusinessUrl}/subscription/switch-disturb-mode";
  static final getDoNotDisturbMode =
      "${Config.appBusinessUrl}/subscription/check-disturb-mode";
  static final verifyReceipt =
      "${Config.appBusinessUrl}/subscription/verify-receipt";
  static final getSubscriptionTierInfo =
      "${Config.appBusinessUrl}/subscription/subscription-tier";
  static final getSubscriptionQuotaInfo =
      "${Config.appBusinessUrl}/subscription/quota-info";
  static final getSubscriptionAIAvatarQuotaInfo =
      "${Config.appBusinessUrl}/subscription/ai-avatar-quota-info";
  // conversation
  static final getFriendNum =
      "${Config.appBusinessUrl}/account/get-user-friend-info";
  // meeting
  static final getMeetingVirtualUsers =
      "${Config.appBusinessUrl}/meeting/load-virtual-users";
  static final updateMeetingVirtualUsersSettings =
      "${Config.appBusinessUrl}/meeting/update-virtual-user-status";
  static final getMeetingInfo =
      "${Config.appBusinessUrl}/meeting/get-meeting-info";
  static final getMeetingConfig =
      "${Config.appBusinessUrl}/meeting/get-meeting-config";

  // group
  static final getGroupInfo = "${Config.appBusinessUrl}/group/get-group-info";
  static final getGroupVirtualUserConfig =
      "${Config.appBusinessUrl}/group/get-virtual-user-config";
  static final getGroupChatbotConfig =
      "${Config.appBusinessUrl}/group/get-ai-chat-config";
  static final updateGroupVirtualUserSettings =
      "${Config.appBusinessUrl}/group/update-virtual-user-status";
  static final updateGroupChatbotSettings =
      "${Config.appBusinessUrl}/group/update-ai-chat-status";
  static final getGroupVirtualUsers =
      "${Config.appBusinessUrl}/group/load-virtual-users";
  static final getGroupAIUsers =
      "${Config.appBusinessUrl}/group/get-group-ai-users";

  // check version
  static final checkAppVersion =
      "${Config.appBusinessUrl}/app-version/check-version";

  // ai soul
  static final checkAISoulStatus =
      "${Config.appBusinessUrl}/ai-profile/check-ai-soul-status";
  static final generateAISoul =
      "${Config.appBusinessUrl}/ai-profile/generate-ai-soul";
  static final getAISoulGuides =
      "${Config.appBusinessUrl}/ai-profile/get-ai-soul-guides";

  // carechats
  static final createCarechatGroup =
      "${Config.appBusinessUrl}/group/create-group";

  // verify passcode
  static final checkSecurityLockStatus =
      "${Config.appBusinessUrl}/security-lock/check-create-security-status";
  static final verifySecurityLock =
      "${Config.appBusinessUrl}/security-lock/verify-security-lock";
  static final createSecurityLock =
      "${Config.appBusinessUrl}/security-lock/create-security-lock";
  static final switchSecurityLockStatus =
      "${Config.appBusinessUrl}/security-lock/switch-security-lock-status";
  static final getSecurityLock =
      "${Config.appBusinessUrl}/security-lock/get-security-lock";

  // wallet, token & transaction
  static final getWalletAddress = "${Config.appCryptoUrl}/wallet/get-address";
  static final getWalletAddresses =
      "${Config.appCryptoUrl}/wallet/get-wallet-addresses";
  static final getWalletAssets = "${Config.appCryptoUrl}/asset/list-assets";
  static final getUserAsset = "${Config.appCryptoUrl}/asset/get-user-asset";
  static final getTranferRecords =
      "${Config.appCryptoUrl}/transfer/get-transfer-records";
  static final getTokenInfo = "${Config.appCryptoUrl}/token/get-token-info";
  static final calculateWithdrawalDetail =
      "${Config.appCryptoUrl}/withdraw/calculate-withdraw-detail";
  static final createWithdrawal =
      "${Config.appCryptoUrl}/withdraw/create-withdraw";

  // money packet
  static final createMoneyPacket =
      "${Config.appCryptoUrl}/money-packet/create-money-packet";
  static final grabMoneyPacket =
      "${Config.appCryptoUrl}/money-packet/grab-money-packet";
  static final getMoneyPacketDetail =
      "${Config.appCryptoUrl}/money-packet/get-money-packet-detail";
  static final calculateUSD =
      "${Config.appCryptoUrl}/money-packet/calculate-usd";
  static final calculateTokenValue =
      "${Config.appCryptoUrl}/money-packet/calculate-token-value";
  static final getMoneyPacketStatus =
      "${Config.appCryptoUrl}/money-packet/get-money-packet-status";

  // WorldDAO
  static final getWLDCoinPriceInfo =
      "${Config.appCryptoUrl}/token/get-token-price";
  static final getWLDCoinInfo =
      "${Config.appCryptoUrl}/token/get-wld-coin-info";
  static final getWLDCoinHash =
      "${Config.appCryptoUrl}/token/get-wld-coin-hash";
  static final getWorlddaoProducts =
      "${Config.appCryptoUrl}/product/list-products";
  static final getWorlddaoAnnouncements =
      "${Config.appCryptoUrl}/product/list-announces";
  static final getWorlddaoApplications =
      "${Config.appCryptoUrl}/product/list-applications";
  static final getWorlddaoProductDetails =
      "${Config.appCryptoUrl}/product/get-product-detail";
  static final getWorlddaoProductEarnings =
      "${Config.appCryptoUrl}/earning/get-product-earning";
  static final getWorlddaoOrders = "${Config.appCryptoUrl}/order/get-orders";
  static final createWorlddaoOrder =
      "${Config.appCryptoUrl}/order/create-order";

  // password signup, security questions
  static final getSecurityQuestions =
      "${Config.appBusinessUrl}/security-question/load-all";
  static final setSecurityQuestions =
      "${Config.appBusinessUrl}/security-question/set-security-questions";
  static final getUserSecurityQuestions =
      "${Config.appBusinessUrl}/security-question/list-security-questions";
  static final verifyUserSecurityQuestions =
      "${Config.appBusinessUrl}/security-question/verify-security-questions";
}
