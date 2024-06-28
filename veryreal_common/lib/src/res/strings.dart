import 'dart:ui';
import 'package:get/get.dart';

import '../../veryreal_common.dart';
import 'lang/de_DE.dart';
import 'lang/en_US.dart';
import 'lang/es_ES.dart';
import 'lang/fr_FR.dart';
import 'lang/hi_IN.dart';
import 'lang/it_IT.dart';
import 'lang/ja_JP.dart';
import 'lang/ko_KR.dart';
import 'lang/pl_PL.dart';
import 'lang/pt_PT.dart';
import 'lang/ru_RU.dart';
import 'lang/tr_TR.dart';
import 'lang/vi_VN.dart';
import 'lang/zh_CN.dart';
import 'lang/zh_TW.dart';

class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static const fallbackLocale = Locale('en', 'US');

  /// Important: strictly follow the sequence index,
  /// serve as a reference for methods in other class and local storage
  static Map<String, LanguageOption> languages = {
    'en': LanguageOption(
      id: 1,
      representativeCode: 'en_US',
      displayName: 'English',
    ), // English
    'zh': LanguageOption(
      id: 2,
      representativeCode: 'zh_CN',
      displayName: '中文简体',
    ), // Chinese Simplified
    'tw': LanguageOption(
      id: 3,
      representativeCode: 'zh_TW',
      displayName: '繁体中文',
    ), // Chinese Traditional
    'es': LanguageOption(
      id: 4,
      representativeCode: 'es_ES',
      displayName: 'Español',
    ), // Spanish
    'pt': LanguageOption(
      id: 5,
      representativeCode: 'pt_PT',
      displayName: 'Português',
    ), // Portuguese
    'vn': LanguageOption(
      id: 6,
      representativeCode: 'vi_VN',
      displayName: 'Tiếng Việt',
    ), // Vietnamese
    'jp': LanguageOption(
      id: 7,
      representativeCode: 'ja_JP',
      displayName: '日本語',
    ), // Japanese
    'kr': LanguageOption(
      id: 8,
      representativeCode: 'ko_KR',
      displayName: '한국어',
    ), // Korean
    'fr': LanguageOption(
      id: 9,
      representativeCode: 'fr_FR',
      displayName: 'Français',
    ), // French
    'de': LanguageOption(
      id: 10,
      representativeCode: 'de_DE',
      displayName: 'Deutsch',
    ), // German
    'in': LanguageOption(
      id: 11,
      representativeCode: 'hi_IN',
      displayName: 'हिन्दी',
    ), // Hindi
    'it': LanguageOption(
      id: 12,
      representativeCode: 'it_IT',
      displayName: 'Italiano',
    ), // Italian
    'pl': LanguageOption(
      id: 13,
      representativeCode: 'pl_PL',
      displayName: 'Polski',
    ), // Polish
    'ru': LanguageOption(
      id: 14,
      representativeCode: 'ru_RU',
      displayName: 'русский (Слава Україні)',
    ), // Russian
    'tr': LanguageOption(
      id: 15,
      representativeCode: 'tr_TR',
      displayName: 'Türkçe',
    ), // Turkish
  };

  static Map<String, String> reverseLanguageKeys = {
    'en_US': 'en',
    'zh_CN': 'zh',
    'zh_TW': 'tw',
    'es_ES': 'es',
    'pt_PT': 'pt',
    'vi_VN': 'vn', // not in country pricker
    'ja_JP': 'jp', // not in country pricker
    'ko_KR': 'kr', // not in country pricker
    'fr_FR': 'fr',
    'de_DE': 'de',
    'hi_IN': 'in',
    'it_IT': 'it',
    'pl_PL': 'pl',
    'ru_RU': 'ru',
    'tr_TR': 'tr',
  };

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
        'zh_CN': zh_CN,
        'zh_TW': zh_TW,
        'es_ES': es_ES,
        'pt_PT': pt_PT,
        'vi_VN': vi_VN,
        'ja_JP': ja_JP,
        'ko_KR': ko_KR,
        'fr_FR': fr_FR,
        'de_DE': de_DE,
        'hi_IN': hi_IN,
        'it_IT': it_IT,
        'pl_PL': pl_PL,
        'ru_RU': ru_RU,
        'tr_TR': tr_TR,
      };
}

class StrRes {
  StrRes._();

  static String get hello => 'hello'.tr;

  static String get plsSelectYourLanguage => 'plsSelectYourLanguage'.tr;

  static String get next => 'next'.tr;

  static String get skip => 'skip'.tr;

  static String get finish => 'finish'.tr;

  static String get welcomeTextLine1 => 'welcomeTextLine1'.tr;

  static String get welcomeTextLine2 => 'welcomeTextLine2'.tr;

  static String get welcomeTextLine3 => 'welcomeTextLine3'.tr;

  static String get welcome => 'welcome'.tr;

  static String get phoneNumber => 'phoneNumber'.tr;

  static String get plsEnterPhoneNumber => 'plsEnterPhoneNumber'.tr;

  static String get enterPhoneNumber => 'enterPhoneNumber'.tr;

  static String get loginWithPhoneNumber => 'loginWithPhoneNumber'.tr;

  static String get loginWithOTP => 'loginWithOTP'.tr;

  static String get password => 'password'.tr;

  static String get plsEnterPassword => 'plsEnterPassword'.tr;

  static String get account => 'account'.tr;

  static String get plsEnterAccount => 'plsEnterAccount'.tr;

  static String get forgetPassword => 'forgetPassword'.tr;

  static String get enterNewPassword => 'enterNewPassword'.tr;

  static String get verificationCodeLogin => 'verificationCodeLogin'.tr;

  static String get login => 'login'.tr;

  static String get noAccountYet => 'noAccountYet'.tr;

  static String get loginNow => 'loginNow'.tr;

  static String get genderSelectionWarning => 'genderSelectionWarning'.tr;

  static String get signup => 'signup'.tr;

  static String get signUpAgreement => 'signUpAgreement'.tr;

  static String get and => 'and'.tr;

  static String get veryrealUserAgreement => 'veryrealUserAgreement'.tr;

  static String get veryrealPrivacyPolicy => 'veryrealPrivacyPolicy'.tr;

  static String get otpSentTo => 'otpSentTo'.tr;

  static String get incorrectOTP => 'incorrectOTP'.tr;

  static String get incorrectCredentials => 'incorrectCredentials'.tr;

  static String get createPassword => 'createPassword'.tr;

  static String get repeatPassword => 'repeatPassword'.tr;

  static String get enterUsername => 'enterUsername'.tr;

  static String get pronouns => 'pronouns'.tr;

  static String get he => 'he'.tr;

  static String get she => 'she'.tr;

  static String get username => 'username'.tr;

  static String get yearHint => 'yearHint'.tr;

  static String get monthHint => 'monthHint'.tr;

  static String get dayHint => 'dayHint'.tr;

  static String get selectTopCities => 'selectTopCities'.tr;

  static String get selectTopTopics => 'selectTopTopics'.tr;

  static String get selectTopFeatures => 'selectTopFeatures'.tr;

  static String get lastButNotLeast => 'lastButNotLeast'.tr;

  static String get profilePhotoWithColon => 'profilePhotoWithColon'.tr;

  static String get registerNow => 'registerNow'.tr;

  static String get lockPwdErrorHint => 'lockPwdErrorHint'.tr;

  static String get newUserRegister => 'newUserRegister'.tr;

  static String get verificationCode => 'verificationCode'.tr;

  static String get sendVerificationCode => 'sendVerificationCode'.tr;

  static String get resendVerificationCode => 'resendVerificationCode'.tr;

  static String get verificationCodeTimingReminder =>
      'verificationCodeTimingReminder'.tr;

  static String get defaultVerificationCode => 'defaultVerificationCode'.tr;

  static String get plsEnterVerificationCode => 'plsEnterVerificationCode'.tr;

  static String get invitationCode => 'invitationCode'.tr;

  static String get plsEnterInvitationCode => 'plsEnterInvitationCode'.tr;

  static String get optional => 'optional'.tr;

  static String get nextStep => 'nextStep'.tr;

  static String get plsEnterRightPhone => 'plsEnterRightPhone'.tr;

  static String get enterVerificationCode => 'enterVerificationCode'.tr;

  static String get setPassword => 'setPassword'.tr;

  static String get plsConfirmPasswordAgain => 'plsConfirmPasswordAgain'.tr;

  static String get confirmPassword => 'confirmPassword'.tr;

  static String get wrongPasswordFormat => 'wrongPasswordFormat'.tr;

  static String get plsCompleteInfo => 'plsCompleteInfo'.tr;

  static String get plsEnterYourNickname => 'plsEnterYourNickname'.tr;

  static String get setInfo => 'setInfo'.tr;

  static String get loginPwdFormat => 'loginPwdFormat'.tr;

  static String get passwordLogin => 'passwordLogin'.tr;

  static String get chats => 'chats'.tr;

  static String get contacts => 'contacts'.tr;

  static String get workbench => 'workbench'.tr;

  static String get me => 'me'.tr;

  static String get draftText => 'draftText'.tr;

  static String get everyone => 'everyone'.tr;

  static String get you => 'you'.tr;

  static String get groupAc => 'groupAc'.tr;

  static String get createGroupNtf => 'createGroupNtf'.tr;

  static String get editGroupInfoNtf => 'editGroupInfoNtf'.tr;

  static String get quitGroupNtf => 'quitGroupNtf'.tr;

  static String get invitedJoinGroupNtf => 'invitedJoinGroupNtf'.tr;

  static String get kickedGroupNtf => 'kickedGroupNtf'.tr;

  static String get joinGroupNtf => 'joinGroupNtf'.tr;

  static String get dismissGroupNtf => 'dismissGroupNtf'.tr;

  static String get transferredGroupNtf => 'transferredGroupNtf'.tr;

  static String get muteMemberNtf => 'muteMemberNtf'.tr;

  static String get muteCancelMemberNtf => 'muteCancelMemberNtf'.tr;

  static String get muteGroupNtf => 'muteGroupNtf'.tr;

  static String get muteCancelGroupNtf => 'muteCancelGroupNtf'.tr;

  static String get friendAddedNtf => 'friendAddedNtf'.tr;

  static String get openPrivateChatNtf => 'openPrivateChatNtf'.tr;

  static String get closePrivateChatNtf => 'closePrivateChatNtf'.tr;

  static String get memberInfoChangedNtf => 'memberInfoChangedNtf'.tr;

  static String get unsupportedMessage => 'unsupportedMessage'.tr;

  static String get picture => 'picture'.tr;

  static String get video => 'video'.tr;

  static String get voice => 'voice'.tr;

  static String get location => 'location'.tr;

  static String get file => 'file'.tr;

  static String get carte => 'carte'.tr;

  static String get emoji => 'emoji'.tr;

  static String get chatRecord => 'chatRecord'.tr;

  static String get revokeMsg => 'revokeMsg'.tr;

  static String get aRevokeBMsg => 'aRevokeBMsg'.tr;

  static String get blockedByFriendHint => 'blockedByFriendHint'.tr;

  static String get deletedByFriendHint => 'deletedByFriendHint'.tr;

  static String get sendFriendVerification => 'sendFriendVerification'.tr;

  static String get removedFromGroupHint => 'removedFromGroupHint'.tr;

  static String get groupDisbanded => 'groupDisbanded'.tr;

  static String get search => 'search'.tr;

  static String get synchronizing => 'synchronizing'.tr;

  static String get syncFailed => 'syncFailed'.tr;

  static String get connecting => 'connecting'.tr;

  static String get connectionFailed => 'connectionFailed'.tr;

  static String get top => 'top'.tr;

  static String get cancelTop => 'cancelTop'.tr;

  static String get markHasRead => 'markHasRead'.tr;

  static String get delete => 'delete'.tr;

  static String get nPieces => 'nPieces'.tr;

  static String get online => 'online'.tr;

  static String get offline => 'offline'.tr;

  static String get phoneOnline => 'phoneOnline'.tr;

  static String get pcOnline => 'pcOnline'.tr;

  static String get webOnline => 'webOnline'.tr;

  static String get webMiniOnline => 'webMiniOnline'.tr;

  static String get upgradeFind => 'upgradeFind'.tr;

  static String get upgradeVersion => 'upgradeVersion'.tr;

  static String get upgradeDescription => 'upgradeDescription'.tr;

  static String get upgradeIgnore => 'upgradeIgnore'.tr;

  static String get upgradeLater => 'upgradeLater'.tr;

  static String get upgradeNow => 'upgradeNow'.tr;

  static String get inviteYouCall => 'inviteYouCall'.tr;

  static String get rejectCall => 'rejectCall'.tr;

  static String get acceptCall => 'acceptCall'.tr;

  static String get callVoice => 'callVoice'.tr;

  static String get callVideo => 'callVideo'.tr;

  static String get sentSuccessfully => 'sentSuccessfully'.tr;

  static String get copySuccessfully => 'copySuccessfully'.tr;

  static String get day => 'day'.tr;

  static String get hour => 'hour'.tr;

  static String get hours => 'hours'.tr;

  static String get minute => 'minute'.tr;

  static String get seconds => 'seconds'.tr;

  static String get cancel => 'cancel'.tr;

  static String get determine => 'determine'.tr;

  static String get toolboxAlbum => 'toolboxAlbum'.tr;

  static String get toolboxVoiceCall => 'toolboxVoiceCall'.tr;

  static String get toolboxVideoCall => 'toolboxVideoCall'.tr;

  static String get toolboxCamera => 'toolboxCamera'.tr;

  static String get toolboxCard => 'toolboxCard'.tr;

  static String get toolboxFile => 'toolboxFile'.tr;

  static String get toolboxLocation => 'toolboxLocation'.tr;

  static String get send => 'send'.tr;

  static String get holdTalk => 'holdTalk'.tr;

  static String get releaseToSend => 'releaseToSend'.tr;

  static String get releaseToSendSwipeUpToCancel =>
      'releaseToSendSwipeUpToCancel'.tr;

  static String get liftFingerToCancelSend => 'liftFingerToCancelSend'.tr;

  static String get callDuration => 'callDuration'.tr;

  static String get cancelled => 'cancelled'.tr;

  static String get cancelledByCaller => 'cancelledByCaller'.tr;

  static String get rejectedByCaller => 'rejectedByCaller'.tr;

  static String get callTimeout => 'callTimeout'.tr;

  static String get rejected => 'rejected'.tr;

  static String get networkAnomaly => 'networkAnomaly'.tr;

  static String get forwardMaxCountHint => 'forwardMaxCountHint'.tr;

  static String get typing => 'typing'.tr;

  static String get addSuccessfully => 'addSuccessfully'.tr;

  static String get addFailed => 'addFailed'.tr;

  static String get setSuccessfully => 'setSuccessfully'.tr;

  static String get callingBusy => 'callingBusy'.tr;

  static String get groupCallHint => 'groupCallHint'.tr;

  static String get joinIn => 'joinIn'.tr;

  static String get menuCopy => 'menuCopy'.tr;

  static String get menuDel => 'menuDel'.tr;

  static String get menuForward => 'menuForward'.tr;

  static String get menuReply => 'menuReply'.tr;

  static String get menuMulti => 'menuMulti'.tr;

  static String get menuRevoke => 'menuRevoke'.tr;

  static String get menuAdd => 'menuAdd'.tr;

  static String get nMessage => 'nMessage'.tr;

  static String get plsSelectLocation => 'plsSelectLocation'.tr;

  static String get groupAudioCallHint => 'groupAudioCallHint'.tr;

  static String get groupVideoCallHint => 'groupVideoCallHint'.tr;

  static String get reEdit => 'reEdit'.tr;

  static String get download => 'download'.tr;

  static String get downloading => 'downloading'.tr;

  static String get playSpeed => 'playSpeed'.tr;

  static String get googleMap => 'googleMap'.tr;

  static String get appleMap => 'appleMap'.tr;

  static String get baiduMap => 'baiduMap'.tr;

  static String get amapMap => 'amapMap'.tr;

  static String get tencentMap => 'tencentMap'.tr;

  static String get offlineMeetingMessage => 'offlineMeetingMessage'.tr;

  static String get offlineMessage => 'offlineMessage'.tr;

  static String get offlineCallMessage => 'offlineCallMessage'.tr;

  static String get offlinePictureMessage => 'offlinePictureMessage'.tr;

  static String get offlineSoundMessage => 'offlineSoundMessage'.tr;

  static String get offlineVideoMessage => 'offlineVideoMessage'.tr;

  static String get offlineFileMessage => 'offlineFileMessage'.tr;

  static String get offlineLocationMessage => 'offlineLocationMessage'.tr;

  static String get offlineCardMessage => 'offlineCardMessage'.tr;

  static String get offlineMoneyPacket => 'offlineMoneyPacket'.tr;

  static String get logoutHint => 'logoutHint'.tr;

  static String get myInfo => 'myInfo'.tr;

  static String get workingCircle => 'workingCircle'.tr;

  static String get accountSetup => 'accountSetup'.tr;

  static String get aboutUs => 'aboutUs'.tr;

  static String get logout => 'logout'.tr;

  static String get qrcode => 'qrcode'.tr;

  static String get qrcodeHint => 'qrcodeHint'.tr;

  static String get favoriteFace => 'favoriteFace'.tr;

  static String get favoriteManage => 'favoriteManage'.tr;

  static String get favoriteCount => 'favoriteCount'.tr;

  static String get favoriteDel => 'favoriteDel'.tr;

  static String get hasRead => 'hasRead'.tr;

  static String get unread => 'unread'.tr;

  static String get nPersonUnRead => 'nPersonUnRead'.tr;

  static String get allRead => 'allRead'.tr;

  static String get messageRecipientList => 'messageRecipientList'.tr;

  static String get hasReadCount => 'hasReadCount'.tr;

  static String get unreadCount => 'unreadCount'.tr;

  static String get newFriend => 'newFriend'.tr;

  static String get newGroup => 'newGroup'.tr;

  static String get myFriend => 'myFriend'.tr;

  static String get myGroup => 'myGroup'.tr;

  static String get add => 'add'.tr;

  static String get scan => 'scan'.tr;

  static String get scanHint => 'scanHint'.tr;

  static String get addFriend => 'addFriend'.tr;

  static String get addFriendHint => 'addFriendHint'.tr;

  static String get createGroup => 'createGroup'.tr;

  static String get createGroupHint => 'createGroupHint'.tr;

  static String get addGroup => 'addGroup'.tr;

  static String get addGroupHint => 'addGroupHint'.tr;

  static String get searchIDAddFriend => 'searchIDAddFriend'.tr;

  static String get searchIDAddGroup => 'searchIDAddGroup'.tr;

  static String get searchIDIs => 'searchIDIs'.tr;

  static String get searchPhoneIs => 'searchPhoneIs'.tr;

  static String get searchEmailIs => 'searchEmailIs'.tr;

  static String get searchNicknameIs => 'searchNicknameIs'.tr;

  static String get searchGroupNicknameIs => 'searchGroupNicknameIs'.tr;

  static String get noFoundUser => 'noFoundUser'.tr;

  static String get noFoundGroup => 'noFoundGroup'.tr;

  static String get joinGroupMethod => 'joinGroupMethod'.tr;

  static String get joinGroupDate => 'joinGroupDate'.tr;

  static String get byInviteJoinGroup => 'byInviteJoinGroup'.tr;

  static String get byIDJoinGroup => 'byIDJoinGroup'.tr;

  static String get byQrcodeJoinGroup => 'byQrcodeJoinGroup'.tr;

  static String get groupID => 'groupID'.tr;

  static String get setAsAdmin => 'setAsAdmin'.tr;

  static String get setMute => 'setMute'.tr;

  static String get organizationInfo => 'organizationInfo'.tr;

  static String get organization => 'organization'.tr;

  static String get department => 'department'.tr;

  static String get position => 'position'.tr;

  static String get personalInfo => 'personalInfo'.tr;

  static String get audioAndVideoCall => 'audioAndVideoCall'.tr;

  static String get sendMessage => 'sendMessage'.tr;

  static String get viewDynamics => 'viewDynamics'.tr;

  static String get avatar => 'avatar'.tr;

  static String get name => 'name'.tr;

  static String get nickname => 'nickname'.tr;

  static String get gender => 'gender'.tr;

  static String get englishName => 'englishName'.tr;

  static String get birthDay => 'birthDay'.tr;

  static String get tel => 'tel'.tr;

  static String get mobile => 'mobile'.tr;

  static String get email => 'email'.tr;

  static String get man => 'man'.tr;

  static String get woman => 'woman'.tr;

  static String get friendSetup => 'friendSetup'.tr;

  static String get setupRemark => 'setupRemark'.tr;

  static String get recommendToFriend => 'recommendToFriend'.tr;

  static String get addToBlacklist => 'addToBlacklist'.tr;

  static String get unfriend => 'unfriend'.tr;

  static String get areYouSureDelFriend => 'areYouSureDelFriend'.tr;

  static String get areYouSureAddBlacklist => 'areYouSureAddBlacklist'.tr;

  static String get remark => 'remark'.tr;

  static String get save => 'save'.tr;

  static String get saveSuccessfully => 'saveSuccessfully'.tr;

  static String get saveFailed => 'saveFailed'.tr;

  static String get groupVerification => 'groupVerification'.tr;

  static String get friendVerification => 'friendVerification'.tr;

  static String get sendEnterGroupApplication => 'sendEnterGroupApplication'.tr;

  static String get sendToBeFriendApplication => 'sendToBeFriendApplication'.tr;

  static String get sendSuccessfully => 'sendSuccessfully'.tr;

  static String get sendFailed => 'sendFailed'.tr;

  static String get canNotAddFriends => 'canNotAddFriends'.tr;

  static String get mutedAll => 'mutedAll'.tr;

  static String get tenMinutes => 'tenMinutes'.tr;

  static String get oneHour => 'oneHour'.tr;

  static String get twelveHours => 'twelveHours'.tr;

  static String get oneDay => 'oneDay'.tr;

  static String get custom => 'custom'.tr;

  static String get unmute => 'unmute'.tr;

  static String get youMuted => 'youMuted'.tr;

  static String get groupMuted => 'groupMuted'.tr;

  static String get notDisturbMode => 'notDisturbMode'.tr;

  static String get allowRing => 'allowRing'.tr;

  static String get allowVibrate => 'allowVibrate'.tr;

  static String get forbidAddMeToFriend => 'forbidAddMeToFriend'.tr;

  static String get blacklist => 'blacklist'.tr;

  static String get unlockSettings => 'unlockSettings'.tr;

  static String get changePassword => 'changePassword'.tr;

  static String get clearChatHistory => 'clearChatHistory'.tr;

  static String get confirmClearChatHistory => 'confirmClearChatHistory'.tr;

  static String get languageSetup => 'languageSetup'.tr;

  static String get language => 'language'.tr;

  static String get english => 'english'.tr;

  static String get chinese => 'chinese'.tr;

  static String get followSystem => 'followSystem'.tr;

  static String get blacklistEmpty => 'blacklistEmpty'.tr;

  static String get remove => 'remove'.tr;

  static String get fingerprint => 'fingerprint'.tr;

  static String get gesture => 'gesture'.tr;

  static String get biometrics => 'biometrics'.tr;

  static String get plsEnterPwd => 'plsEnterPwd'.tr;

  static String get plsEnterOldPwd => 'plsEnterOldPwd'.tr;

  static String get plsEnterNewPwd => 'plsEnterNewPwd'.tr;

  static String get plsConfirmNewPwd => 'plsConfirmNewPwd'.tr;

  static String get reset => 'reset'.tr;

  static String get oldPwd => 'oldPwd'.tr;

  static String get newPwd => 'newPwd'.tr;

  static String get confirmNewPwd => 'confirmNewPwd'.tr;

  static String get plsEnterConfirmPwd => 'plsEnterConfirmPwd'.tr;

  static String get twicePwdNoSame => 'twicePwdNoSame'.tr;

  static String get changedSuccessfully => 'changedSuccessfully'.tr;

  static String get checkNewVersion => 'checkNewVersion'.tr;

  static String get chatContent => 'chatContent'.tr;

  static String get topContacts => 'topContacts'.tr;

  static String get messageNotDisturb => 'messageNotDisturb'.tr;

  static String get messageNotDisturbHint => 'messageNotDisturbHint'.tr;

  static String get burnAfterReading => 'burnAfterReading'.tr;

  static String get timeSet => 'timeSet'.tr;

  static String get setChatBackground => 'setChatBackground'.tr;

  static String get fontSize => 'fontSize'.tr;

  static String get little => 'little'.tr;

  static String get standard => 'standard'.tr;

  static String get big => 'big'.tr;

  static String get thirtySeconds => 'thirtySeconds'.tr;

  static String get fiveMinutes => 'fiveMinutes'.tr;

  static String get clearAll => 'clearAll'.tr;

  static String get clearSuccessfully => 'clearSuccessfully'.tr;

  static String get groupChatSetup => 'groupChatSetup'.tr;

  static String get viewAllGroupMembers => 'viewAllGroupMembers'.tr;

  static String get groupManage => 'groupManage'.tr;

  static String get myGroupMemberNickname => 'myGroupMemberNickname'.tr;

  static String get topChat => 'topChat'.tr;

  static String get muteAllMember => 'muteAllMember'.tr;

  static String get exitGroup => 'exitGroup'.tr;

  static String get dismissGroup => 'dismissGroup'.tr;

  static String get dismissGroupHint => 'dismissGroupHint'.tr;

  static String get quitGroupHint => 'quitGroupHint'.tr;

  static String get joinGroupSet => 'joinGroupSet'.tr;

  static String get allowAnyoneJoinGroup => 'allowAnyoneJoinGroup'.tr;

  static String get inviteNotVerification => 'inviteNotVerification'.tr;

  static String get needVerification => 'needVerification'.tr;

  static String get addMember => 'addMember'.tr;

  static String get delMember => 'delMember'.tr;

  static String get groupOwner => 'groupOwner'.tr;

  static String get groupAdmin => 'groupAdmin'.tr;

  static String get notAllowSeeMemberProfile => 'notAllowSeeMemberProfile'.tr;

  static String get notAllAddMemberToBeFriend => 'notAllAddMemberToBeFriend'.tr;

  static String get transferGroupOwnerRight => 'transferGroupOwnerRight'.tr;

  static String get groupName => 'groupName'.tr;

  static String get groupAcPermissionTips => 'groupAcPermissionTips'.tr;

  static String get plsEnterGroupAc => 'plsEnterGroupAc'.tr;

  static String get edit => 'edit'.tr;

  static String get publish => 'publish'.tr;

  static String get groupMember => 'groupMember'.tr;

  static String get selectedPeopleCount => 'selectedPeopleCount'.tr;

  static String get confirmSelectedPeople => 'confirmSelectedPeople'.tr;

  static String get confirm => 'confirm'.tr;

  static String get confirmTransferGroupToUser =>
      'confirmTransferGroupToUser'.tr;

  static String get removeGroupMember => 'removeGroupMember'.tr;

  static String get searchNotResult => 'searchNotResult'.tr;

  static String get groupQrcode => 'groupQrcode'.tr;

  static String get groupQrcodeHint => 'groupQrcodeHint'.tr;

  static String get approved => 'approved'.tr;

  static String get accept => 'accept'.tr;

  static String get reject => 'reject'.tr;

  static String get waitingForVerification => 'waitingForVerification'.tr;

  static String get rejectSuccessfully => 'rejectSuccessfully'.tr;

  static String get rejectFailed => 'rejectFailed'.tr;

  static String get applyJoin => 'applyJoin'.tr;

  static String get enterGroup => 'enterGroup'.tr;

  static String get applyReason => 'applyReason'.tr;

  static String get invite => 'invite'.tr;

  static String get sourceFrom => 'sourceFrom'.tr;

  static String get byMemberInvite => 'byMemberInvite'.tr;

  static String get bySearch => 'bySearch'.tr;

  static String get byScanQrcode => 'byScanQrcode'.tr;

  static String get iCreatedGroup => 'iCreatedGroup'.tr;

  static String get iJoinedGroup => 'iJoinedGroup'.tr;

  static String get nPerson => 'nPerson'.tr;

  static String get searchNotFound => 'searchNotFound'.tr;

  static String get organizationStructure => 'organizationStructure'.tr;

  static String get recentConversations => 'recentConversations'.tr;

  static String get selectAll => 'selectAll'.tr;

  static String get plsEnterGroupNameHint => 'plsEnterGroupNameHint'.tr;

  static String get completeCreation => 'completeCreation'.tr;

  static String get sendCarteConfirmHint => 'sendCarteConfirmHint'.tr;

  static String get sentSeparatelyTo => 'sentSeparatelyTo'.tr;

  static String get sentTo => 'sentTo'.tr;

  static String get leaveMessage => 'leaveMessage'.tr;

  static String get mergeForwardHint => 'mergeForwardHint'.tr;

  static String get mergeForward => 'mergeForward'.tr;

  static String get quicklyFindChatHistory => 'quicklyFindChatHistory'.tr;

  static String get notFoundChatHistory => 'notFoundChatHistory'.tr;

  static String get globalSearchAll => 'globalSearchAll'.tr;

  static String get globalSearchContacts => 'globalSearchContacts'.tr;

  static String get globalSearchGroup => 'globalSearchGroup'.tr;

  static String get globalSearchChatHistory => 'globalSearchChatHistory'.tr;

  static String get globalSearchChatFile => 'globalSearchChatFile'.tr;

  static String get relatedChatHistory => 'relatedChatHistory'.tr;

  static String get seeMoreRelatedContacts => 'seeMoreRelatedContacts'.tr;

  static String get seeMoreRelatedGroup => 'seeMoreRelatedGroup'.tr;

  static String get seeMoreRelatedChatHistory => 'seeMoreRelatedChatHistory'.tr;

  static String get seeMoreRelatedFile => 'seeMoreRelatedFile'.tr;

  static String get publishPicture => 'publishPicture'.tr;

  static String get publishVideo => 'publishVideo'.tr;

  static String get mentioned => 'mentioned'.tr;

  static String get comment => 'comment'.tr;

  static String get like => 'like'.tr;

  static String get reply => 'reply'.tr;

  static String get rollUp => 'rollUp'.tr;

  static String get fullText => 'fullText'.tr;

  static String get selectAssetsFromCamera => 'selectAssetsFromCamera'.tr;

  static String get selectAssetsFromAlbum => 'selectAssetsFromAlbum'.tr;

  static String get whoCanWatch => 'whoCanWatch'.tr;

  static String get remindWhoToWatch => 'remindWhoToWatch'.tr;

  static String get public => 'public'.tr;

  static String get everyoneCanSee => 'everyoneCanSee'.tr;

  static String get partiallyVisible => 'partiallyVisible'.tr;

  static String get visibleToTheSelected => 'visibleToTheSelected'.tr;

  static String get partiallyInvisible => 'partiallyInvisible'.tr;

  static String get invisibleToTheSelected => 'invisibleToTheSelected'.tr;

  static String get private => 'private'.tr;

  static String get onlyVisibleToMe => 'onlyVisibleToMe'.tr;

  static String get selectVideoLimit => 'selectVideoLimit'.tr;

  static String get selectContactsLimit => 'selectContactsLimit'.tr;

  static String get message => 'message'.tr;

  static String get commentedYou => 'commentedYou'.tr;
  static String get commentedWho => 'commentedWho'.tr;

  static String get likedYou => 'likedYou'.tr;

  static String get mentionedYou => 'mentionedYou'.tr;
  static String get mentionedWho => 'mentionedWho'.tr;

  static String get replied => 'replied'.tr;

  static String get detail => 'detail'.tr;

  static String get totalNPicture => 'totalNPicture'.tr;

  static String get noDynamic => 'noDynamic'.tr;

  static String get callRecords => 'callRecords'.tr;

  static String get allCall => 'allCall'.tr;

  static String get missedCall => 'missedCall'.tr;

  static String get incomingCall => 'incomingCall'.tr;

  static String get outgoingCall => 'outgoingCall'.tr;

  static String get microphone => 'microphone'.tr;

  static String get speaker => 'speaker'.tr;

  static String get hangUp => 'hangUp'.tr;

  static String get pickUp => 'pickUp'.tr;

  static String get waitingCallHint => 'waitingCallHint'.tr;

  static String get waitingVoiceCallHint => 'waitingVoiceCallHint'.tr;

  static String get invitedVoiceCallHint => 'invitedVoiceCallHint'.tr;

  static String get waitingVideoCallHint => 'waitingVideoCallHint'.tr;

  static String get invitedVideoCallHint => 'invitedVideoCallHint'.tr;

  static String get waitingToAnswer => 'waitingToAnswer'.tr;

  static String get invitedYouToCall => 'invitedYouToCall'.tr;

  static String get calling => 'calling'.tr;

  static String get nPeopleCalling => 'nPeopleCalling'.tr;

  static String get busyVideoCallHint => 'busyVideoCallHint'.tr;

  static String get whoInvitedVoiceCallHint => 'whoInvitedVoiceCallHint'.tr;

  static String get whoInvitedVideoCallHint => 'whoInvitedVideoCallHint'.tr;

  static String get plsInputMeetingSubject => 'plsInputMeetingSubject'.tr;

  static String get meetingStartTime => 'meetingStartTime'.tr;

  static String get meetingDuration => 'meetingDuration'.tr;

  static String get enterMeeting => 'enterMeeting'.tr;

  static String get meetingNo => 'meetingNo'.tr;

  static String get yourMeetingName => 'yourMeetingName'.tr;

  static String get plsInputMeetingNo => 'plsInputMeetingNo'.tr;

  static String get plsInputYouMeetingName => 'plsInputYouMeetingName'.tr;

  static String get meetingSubjectIs => 'meetingSubjectIs'.tr;

  static String get meetingStartTimeIs => 'meetingStartTimeIs'.tr;

  static String get meetingDurationIs => 'meetingDurationIs'.tr;

  static String get meetingHostIs => 'meetingHostIs'.tr;

  static String get meetingNoIs => 'meetingNoIs'.tr;

  static String get meetingMessageClickHint => 'meetingMessageClickHint'.tr;

  static String get meetingMessage => 'meetingMessage'.tr;

  static String get openMeeting => 'openMeeting'.tr;

  static String get didNotStart => 'didNotStart'.tr;

  static String get started => 'started'.tr;

  static String get meetingInitiatorIs => 'meetingInitiatorIs'.tr;

  static String get meetingDetail => 'meetingDetail'.tr;

  static String get meetingOrganizerIs => 'meetingOrganizerIs'.tr;

  static String get updateMeetingInfo => 'updateMeetingInfo'.tr;

  static String get cancelMeeting => 'cancelMeeting'.tr;

  static String get videoMeeting => 'videoMeeting'.tr;

  static String get joinMeeting => 'joinMeeting'.tr;

  static String get bookAMeeting => 'bookAMeeting'.tr;

  static String get quickMeeting => 'quickMeeting'.tr;

  static String get confirmTheChanges => 'confirmTheChanges'.tr;

  static String get invitesYouToVideoConference =>
      'invitesYouToVideoConference'.tr;

  static String get over => 'over'.tr;

  static String get meetingMute => 'meetingMute'.tr;

  static String get meetingUnmute => 'meetingUnmute'.tr;

  static String get meetingCloseVideo => 'meetingCloseVideo'.tr;

  static String get meetingOpenVideo => 'meetingOpenVideo'.tr;

  static String get meetingEndSharing => 'meetingEndSharing'.tr;

  static String get meetingShareScreen => 'meetingShareScreen'.tr;

  static String get meetingMembers => 'meetingMembers'.tr;

  static String get settings => 'settings'.tr;

  static String get leaveMeeting => 'leaveMeeting'.tr;

  static String get endMeeting => 'endMeeting'.tr;

  static String get leaveMeetingConfirmHint => 'leaveMeetingConfirmHint'.tr;

  static String get endMeetingConfirmHit => 'endMeetingConfirmHit'.tr;

  static String get meetingSettings => 'meetingSettings'.tr;

  static String get allowMembersOpenMic => 'allowMembersOpenMic'.tr;

  static String get allowMembersOpenVideo => 'allowMembersOpenVideo'.tr;

  static String get onlyHostShareScreen => 'onlyHostShareScreen'.tr;

  static String get onlyHostInviteMember => 'onlyHostInviteMember'.tr;

  static String get defaultMuteMembers => 'defaultMuteMembers'.tr;

  static String get pinThisMember => 'pinThisMember'.tr;

  static String get unpinThisMember => 'unpinThisMember'.tr;

  static String get allSeeHim => 'allSeeHim'.tr;

  static String get cancelAllSeeHim => 'cancelAllSeeHim'.tr;

  static String get muteAll => 'muteAll'.tr;

  static String get unmuteAll => 'unmuteAll'.tr;

  static String get members => 'members'.tr;

  static String get screenShare => 'screenShare'.tr;

  static String get screenShareHint => 'screenShareHint'.tr;

  static String get meetingClosedHint => 'meetingClosedHint'.tr;

  static String get meetingIsOver => 'meetingIsOver'.tr;

  static String get networkError => 'networkError'.tr;

  static String get shareSuccessfully => 'shareSuccessfully'.tr;

  static String get notFoundMinP => 'notFoundMinP'.tr;

  static String get notSendMessageNotInGroup => 'notSendMessageNotInGroup'.tr;

  static String get whoModifyGroupName => 'whoModifyGroupName'.tr;

  static String get accountWarn => 'accountWarn'.tr;

  static String get accountException => 'accountException'.tr;

  static String get tagGroup => 'tagGroup'.tr;

  static String get issueNotice => 'issueNotice'.tr;

  static String get createTagGroup => 'createTagGroup'.tr;

  static String get plsEnterTagGroupName => 'plsEnterTagGroupName'.tr;

  static String get tagGroupMember => 'tagGroupMember'.tr;

  static String get completeEdit => 'completeEdit'.tr;

  static String get emptyTagGroup => 'emptyTagGroup'.tr;

  static String get confirmDelTagGroupHint => 'confirmDelTagGroupHint'.tr;

  static String get editTagGroup => 'editTagGroup'.tr;

  static String get newBuild => 'newBuild'.tr;

  static String get receiveMember => 'receiveMember'.tr;

  static String get emptyNotification => 'emptyNotification'.tr;

  static String get notificationReceiver => 'notificationReceiver'.tr;

  static String get sendAnother => 'sendAnother'.tr;

  static String get confirmDelTagNotificationHint =>
      'confirmDelTagNotificationHint'.tr;

  static String get contentNotBlank => 'contentNotBlank'.tr;

  static String get plsEnterDescription => 'plsEnterDescription'.tr;

  static String get gifNotSupported => 'gifNotSupported'.tr;

  static String get lookOver => 'lookOver'.tr;

  static String get groupRequestHandled => 'groupRequestHandled'.tr;

  static String get burnAfterReadingDescription =>
      'burnAfterReadingDescription'.tr;

  static String get periodicallyDeleteMessage => 'periodicallyDeleteMessage'.tr;

  static String get periodicallyDeleteMessageDescription =>
      'periodicallyDeleteMessageDescription'.tr;

  static String get nDay => 'nDay'.tr;

  static String get nWeek => 'nWeek'.tr;

  static String get nMonth => 'nMonth'.tr;

  static String get talkTooShort => 'talkTooShort'.tr;

  static String get quoteContentBeRevoked => 'quoteContentBeRevoked'.tr;

  static String get tapTooShort => 'tapTooShort'.tr;

  static String get createGroupTips => 'createGroupTips'.tr;

  static String get likedWho => 'likedWho'.tr;

  static String get otherCallHandle => 'otherCallHandle'.tr;

  static String get uploadErrorLog => 'uploadErrorLog'.tr;

  static String get uploaded => 'uploaded'.tr;

  static String get sdkApiAddress => 'sdkApiAddress'.tr;

  static String get sdkWsAddress => 'sdkWsAddress'.tr;

  static String get appAddress => 'appAddress'.tr;

  static String get serverAddress => 'serverAddress'.tr;

  static String get switchToIP => 'switchToIP'.tr;

  static String get switchToDomain => 'switchToDomain'.tr;

  static String get serverSettingTips => 'serverSettingTips'.tr;

  static String get callFail => 'callFail'.tr;

  static String get vipOnly => 'vipOnly'.tr;

  static String get freeTrial => 'freeTrial'.tr;

  static String get freeVIP => 'freeVIP'.tr;

  static String get rewards => 'rewards'.tr;

  static String get stayTuned => 'stayTuned'.tr;

  static String get getYourVIP => 'getYourVIP'.tr;

  static String get inviteFriends => 'inviteFriends'.tr;

  static String get visitors => 'visitors'.tr;

  static String get veryID => 'veryID'.tr;

  static String get myAIMode => 'myAIMode'.tr;

  static String get myMoments => 'myMoments'.tr;

  static String get accountSettings => 'accountSettings'.tr;

  static String get verification => 'verification'.tr;

  static String get doubleTapTurnOffAIMode => 'doubleTapTurnOffAIMode'.tr;

  static String get selectMyVoices => 'selectMyVoices'.tr;

  static String get customiseMyAIMode => 'customiseMyAIMode'.tr;

  static String get customiseMyAIVoice => 'customiseMyAIVoice'.tr;

  static String get selectMyVoicesInOtherLanguages =>
      'selectMyVoicesInOtherLanguages'.tr;

  static String get definingYourOwnPrompty => 'definingYourOwnPrompty'.tr;

  static String get promptSelfIntroduction => 'promptSelfIntroduction'.tr;

  static String get promptyTalkTopic => 'promptyTalkTopic'.tr;

  static String get promptSpeakStyle => 'promptSpeakStyle'.tr;

  static String get homeCityTab => 'homeCityTab'.tr;

  static String get homeActiveTab => 'homeActiveTab'.tr;

  static String get homeNewTab => 'homeNewTab'.tr;

  static String get explore => 'explore'.tr;

  static String get world => 'world'.tr;

  static String get trendy => 'trendy'.tr;

  static String get clubsForYou => 'clubsForYou'.tr;

  static String get hot => 'hot'.tr;

  static String get moments => 'moments'.tr;

  static String get newS => 'newS'.tr;

  static String get vip => 'vip'.tr;

  static String get likedBy => 'likedBy'.tr;

  static String get more => 'more'.tr;

  static String get postPictures => 'postPictures'.tr;

  static String get postVideos => 'postVideos'.tr;

  static String get deleteAccount => 'deleteAccount'.tr;

  static String get deleteAccountPrompt => 'deleteAccountPrompt'.tr;

  /// sdk localisation pack
  static String get timeagoSdkPrefixAgo => 'timeagoSdkPrefixAgo'.tr;

  static String get timeagoSdkPrefixFromNow => 'timeagoSdkPrefixFromNow'.tr;

  static String get timeagoSdkSuffixAgo => 'timeagoSdkSuffixAgo'.tr;

  static String get timeagoSdkSuffixFromNow => 'timeagoSdkSuffixFromNow'.tr;

  static String get timeagoSdkLessThanOneMinute =>
      'timeagoSdkLessThanOneMinute'.tr;

  static String get timeagoSdkAboutAMinute => 'timeagoSdkAboutAMinute'.tr;

  static String get timeagoSdkMinutes => 'timeagoSdkMinutes'.tr;

  static String get timeagoSdkAboutAnHour => 'timeagoSdkAboutAnHour'.tr;

  static String get timeagoSdkHours => 'timeagoSdkHours'.tr;

  static String get timeagoSdkADay => 'timeagoSdkADay'.tr;

  static String get timeagoSdkDays => 'timeagoSdkDays'.tr;

  static String get timeagoSdkAboutAMonth => 'timeagoSdkAboutAMonth'.tr;

  static String get timeagoSdkMonths => 'timeagoSdkMonths'.tr;

  static String get timeagoSdkAboutAYear => 'timeagoSdkAboutAYear'.tr;

  static String get timeagoSdkYears => 'timeagoSdkYears'.tr;

  static String get timeagoSdkWordSeparator => 'timeagoSdkWordSeparator'.tr;

  static String get countrypickerSdkSearch => 'countrypickerSdkSearch'.tr;

  static String get countrypickerSdkAutoLocateLabel =>
      'countrypickerSdkAutoLocateLabel'.tr;

  static String get countrypickerSdkAutoLocateButton =>
      'countrypickerSdkAutoLocateButton'.tr;

  static String get countrypickerSdkTimeoutAlert =>
      'countrypickerSdkTimeoutAlert'.tr;

  static String get countrypickerSdkUnsupportedArea =>
      'countrypickerSdkUnsupportedArea'.tr;

  static String get youAreAlreadyAVIP => 'youAreAlreadyAVIP'.tr;

  static String get phone => 'phone'.tr;

  static String get loginWithEmail => 'loginWithEmail'.tr;

  static String get enterEmail => 'enterEmail'.tr;

  static String get plsEnterEmail => 'plsEnterEmail'.tr;

  static String get plsEnterRightEmail => 'plsEnterRightEmail'.tr;

  static String get voiceCloningPrompt => 'voiceCloningPrompt'.tr;

  static String get promptVoiceCloningStepOne => 'promptVoiceCloningStepOne'.tr;

  static String get voiceModelLocationPartTwo => 'voiceModelLocationPartTwo'.tr;

  static String get customise => 'customise'.tr;

  static String get recordVoicePromptCaption => 'recordVoicePromptCaption'.tr;

  static String get previousVoiceRecordCaption =>
      'previousVoiceRecordCaption'.tr;

  static String get reRecordVoicePrompt => 'reRecordVoicePrompt'.tr;

  static String get testCustomization => 'testCustomization'.tr;

  static String get loadingPleaseWait => 'loadingPleaseWait'.tr;

  static String get audioRecordingLengthAlert => 'audioRecordingLengthAlert'.tr;

  static String get highDemandDialogContent => 'highDemandDialogContent'.tr;

  static String get myAIVoice => 'myAIVoice'.tr;

  static String get preDeleteAccountPromptForAdmin =>
      'preDeleteAccountPromptForAdmin'.tr;

  static String get preDeleteAccountPromptForNonAdmin =>
      'preDeleteAccountPromptForNonAdmin'.tr;

  static String get yesterday => 'yesterday'.tr;

  static String get monday => 'monday'.tr;

  static String get tuesday => 'tuesday'.tr;

  static String get wednesday => 'wednesday'.tr;

  static String get thursday => 'thursday'.tr;

  static String get friday => 'friday'.tr;

  static String get saturday => 'saturday'.tr;

  static String get sunday => 'sunday'.tr;

  static String get promptVoiceCloningStepOneCaption =>
      'promptVoiceCloningStepOneCaption'.tr;

  static String get promptVoiceCloningStepTwo => 'promptVoiceCloningStepTwo'.tr;

  static String get promptVoiceCloningStepTwoCaption =>
      'promptVoiceCloningStepTwoCaption'.tr;

  static String get promptVoiceCloningStepThree =>
      'promptVoiceCloningStepThree'.tr;

  static String get promptVoiceCloningStepThreeCaptionForSupportedLanguages =>
      'promptVoiceCloningStepThreeCaptionForSupportedLanguages'.tr;

  static String get promptVoiceCloningStepThreeCaptionForUnsupportedLanguages =>
      'promptVoiceCloningStepThreeCaptionForUnsupportedLanguages'.tr;

  static String get japanese => 'japanese'.tr;

  static String get spanish => 'spanish'.tr;

  static String get voiceCloningConfirmation => 'voiceCloningConfirmation'.tr;

  static String get reRecordVoicePromptCaption =>
      'reRecordVoicePromptCaption'.tr;

  static String get back => 'back'.tr;

  static String get voiceCloningInProgress => 'voiceCloningInProgress'.tr;

  static String get voiceCloningInProgressCaption =>
      'voiceCloningInProgressCaption'.tr;

  static String get voiceCloningCompleted => 'voiceCloningCompleted'.tr;

  static String get clickHere => 'clickHere'.tr;

  static String get voiceModelLocationPartOne => 'voiceModelLocationPartOne'.tr;

  static String get badVoiceDialogContent => 'badVoiceDialogContent'.tr;

  static String get today => 'today'.tr;

  static String get thisWeek => 'thisWeek'.tr;

  static String get thisMonth => 'thisMonth'.tr;

  static String get myTags => 'myTags'.tr;

  static String get clubs => 'clubs'.tr;

  static String get defineYourFeatures => 'defineYourFeatures'.tr;

  static String get findAClub => 'findAClub'.tr;

  static String get youHaventJoinAClub => 'youHaventJoinAClub'.tr;

  static String get filter => 'filter'.tr;

  static String get gentlemen => 'gentlemen'.tr;

  static String get ladies => 'ladies'.tr;

  static String get cities => 'cities'.tr;

  static String get citiesFilterCaption => 'citiesFilterCaption'.tr;

  static String get age => 'age'.tr;

  static String get height => 'height'.tr;

  static String get weight => 'weight'.tr;

  static String get tags => 'tags'.tr;

  static String get tagsFilterCaption => 'tagsFilterCaption'.tr;

  static String get myLookTab => 'myLookTab'.tr;

  static String get mySoulTab => 'mySoulTab'.tr;

  static String get hobbiesTab => 'hobbiesTab'.tr;

  static String get experienceTab => 'experienceTab'.tr;

  static String get noMatchFoundTryOtherFilters =>
      'noMatchFoundTryOtherFilters'.tr;

  static String get saySomethingUnique => 'saySomethingUnique'.tr;

  static String get sendFriendRequestHintText => 'sendFriendRequestHintText'.tr;

  static String get noIntroVideoYet => 'noIntroVideoYet'.tr;

  static String get friend => 'friend'.tr;

  static String get andWithoutSymbol => 'andWithoutSymbol'.tr;

  static String get becomeAFriendCaption => 'becomeAFriendCaption'.tr;

  static String get report => 'report'.tr;

  static String get publicClub => 'publicClub'.tr;

  static String get privateClub => 'privateClub'.tr;

  static String get groupIntro => 'groupIntro'.tr;

  static String get createAClub => 'createAClub'.tr;

  static String get clubName => 'clubName'.tr;

  static String get clubIntroduction => 'clubIntroduction'.tr;

  static String get lessThanXLetters => 'lessThanXLetters'.tr;

  static String get introduceYourClubInXWords => 'introduceYourClubInXWords'.tr;

  static String get clubMembers => 'clubMembers'.tr;

  static String get member => 'member'.tr;

  static String get privateClubSettingsAlert => 'privateClubSettingsAlert'.tr;

  static String get create => 'create'.tr;

  static String get selectAClubIcon => 'selectAClubIcon'.tr;

  static String get xMembers => 'xMembers'.tr;

  static String get plsEnterClubName => 'plsEnterClubName'.tr;

  static String get emptyClubIntroPlaceHolder => 'emptyClubIntroPlaceHolder'.tr;

  static String get clubsActiveTab => 'clubsActiveTab'.tr;

  static String get clubsNewTab => 'clubsNewTab'.tr;

  static String get clubsTopTab => 'clubsTopTab'.tr;

  static String get recommended => 'recommended'.tr;

  static String get host => 'host'.tr;

  static String get clubSearchHint => 'clubSearchHint'.tr;

  static String get noClubsFound => 'noClubsFound'.tr;

  static String get earth => 'earth'.tr;

  static String get enterClub => 'enterClub'.tr;

  static String get clubVerification => 'clubVerification'.tr;

  static String get sendGroupRequestHintText => 'sendGroupRequestHintText'.tr;

  static String get updatedOn => 'updatedOn'.tr;

  static String get myQRCode => 'myQRCode'.tr;

  static String get addFriendQRInvitationPrompt =>
      'addFriendQRInvitationPrompt'.tr;

  static String get appIntroSubtitle => 'appIntroSubtitle'.tr;

  static String get appDownloadInvitationPrompt =>
      'appDownloadInvitationPrompt'.tr;

  static String get visit => 'visit'.tr;

  static String get myVisitors => 'myVisitors'.tr;

  static String get moreClubsIHaveJoined => 'moreClubsIHaveJoined'.tr;

  static String get thereIsNoMoreClub => 'thereIsNoMoreClub'.tr;

  static String get veryIDLong => 'veryIDLong'.tr;

  static String get myProfile => 'myProfile'.tr;

  static String get basics => 'basics'.tr;

  static String get profilePhoto => 'profilePhoto'.tr;

  static String get instagram => 'instagram'.tr;

  static String get birthday => 'birthday'.tr;

  static String get aboutMe => 'aboutMe'.tr;

  static String get introVideo => 'introVideo'.tr;

  static String get moreAboutMe => 'moreAboutMe'.tr;

  static String get enter => 'enter'.tr;

  static String get update => 'update'.tr;

  static String get upload => 'upload'.tr;

  static String get editUsername => 'editUsername'.tr;

  static String get editInstagram => 'editInstagram'.tr;

  static String get editAboutMe => 'editAboutMe'.tr;

  static String get introduceYourselfInXWords => 'introduceYourselfInXWords'.tr;

  static String get editLocation => 'editLocation'.tr;

  static String get chooseYourFeature => 'chooseYourFeature'.tr;

  static String get createMyUniqueTags => 'createMyUniqueTags'.tr;

  static String get customTag => 'customTag'.tr;

  static String get writeTagHintText => 'writeTagHintText'.tr;

  static String get country => 'country'.tr;

  static String get state => 'state'.tr;

  static String get city => 'city'.tr;

  static String get andForLikedBy => 'andForLikedBy'.tr;

  static String get moreForLikedBy => 'moreForLikedBy'.tr;

  static String get speaking => 'speaking'.tr;

  static String get noVisitorsYet => 'noVisitorsYet'.tr;

  static String get profilePicRequiredPrompt => 'profilePicRequiredPrompt'.tr;

  static String get eligibleAgeForRegistration =>
      'eligibleAgeForRegistration'.tr;

  static String get continueButtonText => 'continueButtonText'.tr;

  static String get unsupportedPhoneHintText => 'unsupportedPhoneHintText'.tr;

  static String get friendHasNoPost => 'friendHasNoPost'.tr;

  static String get promptPartOneHintText => 'promptPartOneHintText'.tr;

  static String get promptPartTwoHintText => 'promptPartTwoHintText'.tr;

  static String get promptPartThreeHintText => 'promptPartThreeHintText'.tr;

  static String get promptYourIdentity => 'promptYourIdentity'.tr;

  static String get promptBasicInformation => 'promptBasicInformation'.tr;

  static String get prompTheStyleYourSpeak => 'prompTheStyleYourSpeak'.tr;

  static String get continueWithEmail => 'continueWithEmail'.tr;

  static String get continueWithPhone => 'continueWithPhone'.tr;

  static String get continueWithGoogle => 'continueWithGoogle'.tr;

  static String get continueWithApple => 'continueWithApple'.tr;

  static String get continueWithFacebook => 'continueWithFacebook'.tr;

  static String get or => 'or'.tr;

  static String get googleLoginNotAvailable => 'googleLoginNotAvailable'.tr;

  static String get doNotDisturbDialogContent => 'doNotDisturbDialogContent'.tr;

  static String get upgradeSubscriptionDialogContent =>
      'upgradeSubscriptionDialogContent'.tr;

  static String get contactUsDialogContent => 'contactUsDialogContent'.tr;

  static String get upgrade => 'upgrade'.tr;

  static String get upgradeSubscription => 'upgradeSubscription'.tr;

  static String get contactUs => 'contactUs'.tr;

  static String get gold => 'gold'.tr;

  static String get mySubscription => 'mySubscription'.tr;

  static String get veryreal => 'veryreal'.tr;

  static String get subcribeToEnjoyMore => 'subcribeToEnjoyMore'.tr;

  static String get enhancedAIPower => 'enhancedAIPower'.tr;

  static String get designYourNetwork => 'designYourNetwork'.tr;

  static String get features => 'features'.tr;

  static String get perMonth => 'perMonth'.tr;

  static String get cloneVoiceMessages => 'cloneVoiceMessages'.tr;

  static String get systemVoiceMessages => 'systemVoiceMessages'.tr;

  static String get translatedTextMessages => 'translatedTextMessages'.tr;

  static String get aiAvatarMessages => 'aiAvatarMessages'.tr;

  static String get doNotDisturb => 'doNotDisturb'.tr;

  static String get doNotDisturbDescription => 'doNotDisturbDescription'.tr;

  static String get exclusiveClub => 'exclusiveClub'.tr;

  static String get exclusiveClubDescription => 'exclusiveClubDescription'.tr;

  static String get asOf => 'asOf'.tr;

  static String get subscribed => 'subscribed'.tr;

  static String get subscriptionAgreement => 'subscriptionAgreement'.tr;

  static String get terms => 'terms'.tr;

  static String get paymentServiceNotAvailable =>
      'paymentServiceNotAvailable'.tr;

  static String get continueXPerMonth => 'continueXPerMonth'.tr;

  static String get aiModeAutoDeactivateDialogContent =>
      'aiModeAutoDeactivateDialogContent'.tr;

  static String get editRemark => 'editRemark'.tr;

  static String get newUserFindNewFriendsDialogContent =>
      'newUserFindNewFriendsDialogContent'.tr;

  static String get no => 'no'.tr;

  static String get yes => 'yes'.tr;

  static String get privacyPolicy => 'privacyPolicy'.tr;

  static String get restorePurchases => 'restorePurchases'.tr;

  static String get usernameRequiredPrompt => 'usernameRequiredPrompt'.tr;

  static String get genderRequiredPrompt => 'genderRequiredPrompt'.tr;

  static String get birthdayRequiredPrompt => 'birthdayRequiredPrompt'.tr;

  static String get restorePurchasesSucceed => 'restorePurchasesSucceed'.tr;

  static String get restorePurchasesNoPreviousPurchases =>
      'restorePurchasesNoPreviousPurchases'.tr;

  static String get purchaseAfterRestoreDialogContent =>
      'purchaseAfterRestoreDialogContent'.tr;

  static String get minutesShort => 'minutesShort'.tr;

  static String get virtualUsersNumIs => 'virtualUsersNumIs'.tr;

  static String get setNumOfVirtualUsers => 'setNumOfVirtualUsers'.tr;

  static String get plsEnterXValue => 'plsEnterXValue'.tr;

  static String get virtualUsers => 'virtualUsers'.tr;

  static String get virtualUsersNum => 'virtualUsersNum'.tr;

  static String get userProfileIsPrivate => 'userProfileIsPrivate'.tr;

  static String get acknowledged => 'acknowledged'.tr;

  static String get groupChatbot => 'groupChatbot'.tr;

  static String get launchGroupChatbot => 'launchGroupChatbot'.tr;

  static String get setChatbotsNumber => 'setChatbotsNumber'.tr;

  static String get setChatbotsNumberCaption => 'setChatbotsNumberCaption'.tr;

  static String get setTriggerDuration => 'setTriggerDuration'.tr;

  static String get setTriggerDurationCaption => 'setTriggerDurationCaption'.tr;

  static String get chatbotGroupIntroRestrictedDialogContent =>
      'chatbotGroupIntroRestrictedDialogContent'.tr;

  static String get chatbotUnnaturalSpeechDialogContent =>
      'chatbotUnnaturalSpeechDialogContent'.tr;

  static String get unableToRemoveVirtualUserDialogContent =>
      'unableToRemoveVirtualUserDialogContent'.tr;

  static String get unableToRemoveChatbotDialogContent =>
      'unableToRemoveChatbotDialogContent'.tr;

  static String get contactOwnerToRemoveVirtualUserDialogContent =>
      'contactOwnerToRemoveVirtualUserDialogContent'.tr;

  static String get conversationProtectionHint =>
      'conversationProtectionHint'.tr;

  static String get localAuthSdkLocalizedReason =>
      'localAuthSdkLocalizedReason'.tr;

  static String get localAuthSdkAndroidCancelButton =>
      'localAuthSdkAndroidCancelButton'.tr;

  static String get localAuthSdkAndroidBiometricNotRecognized =>
      'localAuthSdkAndroidBiometricNotRecognized'.tr;

  static String get localAuthSdkAndroidBiometricHint =>
      'localAuthSdkAndroidBiometricHint'.tr;

  static String get localAuthSdkAndroidBiometricSuccess =>
      'localAuthSdkAndroidBiometricSuccess'.tr;

  static String get localAuthSdkAndroidBiometricRequiredTitle =>
      'localAuthSdkAndroidBiometricRequiredTitle'.tr;

  static String get localAuthSdkAndroidGoToSettingsDescription =>
      'localAuthSdkAndroidGoToSettingsDescription'.tr;

  static String get localAuthSdkAndroidGoToSettingsButton =>
      'localAuthSdkAndroidGoToSettingsButton'.tr;

  static String get localAuthSdkAndroidDeviceCredentialsRequiredTitle =>
      'localAuthSdkAndroidDeviceCredentialsRequiredTitle'.tr;

  static String get localAuthSdkAndroidDeviceCredentialsSetupDescription =>
      'localAuthSdkAndroidDeviceCredentialsSetupDescription'.tr;

  static String get localAuthSdkAndroidSignInTitle =>
      'localAuthSdkAndroidSignInTitle'.tr;

  static String get localAuthSdkIosCancelButton =>
      'localAuthSdkIosCancelButton'.tr;

  static String get localAuthSdkIosGoToSettingsButton =>
      'localAuthSdkIosGoToSettingsButton'.tr;

  static String get localAuthSdkIosGoToSettingsDescription =>
      'localAuthSdkIosGoToSettingsDescription'.tr;

  static String get localAuthSdkIosLockOut => 'localAuthSdkIosLockOut'.tr;

  static String get loginOrSignup => 'loginOrSignup'.tr;

  static String get alert => 'alert'.tr;

  static String get appUpgradeDialogContent => 'appUpgradeDialogContent'.tr;

  static String get notNow => 'notNow'.tr;

  static String get holdToRecord => 'holdToRecord'.tr;

  static String get releaseToStop => 'releaseToStop'.tr;

  static String get customiseMyAISoul => 'customiseMyAISoul'.tr;

  static String get promptMyIdentity => 'promptMyIdentity'.tr;

  static String get promptMyNotes => 'promptMyNotes'.tr;

  static String get promptMyMantras => 'promptMyMantras'.tr;

  static String get generatingPromptsDialogContent =>
      'generatingPromptsDialogContent'.tr;

  static String get myAISoul => 'myAISoul'.tr;

  static String get doubleTapTurnOffAISoul => 'doubleTapTurnOffAISoul'.tr;

  static String get definingYourOwnPromptNew => 'definingYourOwnPromptNew'.tr;

  static String get voiceModelLocationPartTwoNew =>
      'voiceModelLocationPartTwoNew'.tr;

  static String get aiSoulAutoDeactivateDialogContent =>
      'aiSoulAutoDeactivateDialogContent'.tr;

  static String get voiceCloningInProgressCaptionPartOne =>
      'voiceCloningInProgressCaptionPartOne'.tr;

  static String get voiceCloningInProgressCaptionPartTwo =>
      'voiceCloningInProgressCaptionPartTwo'.tr;

  static String get processingPleaseWaitXSeconds =>
      'processingPleaseWaitXSeconds'.tr;

  static String get processingPleaseWaitABitMoreTime =>
      'processingPleaseWaitABitMoreTime'.tr;

  static String get carechats => 'carechats'.tr;

  static String get carechatsOverview => 'carechatsOverview'.tr;

  static String get createCareChatsStepOne => 'createCareChatsStepOne'.tr;

  static String get createCareChatsStepTwo => 'createCareChatsStepTwo'.tr;

  static String get createCareChatsStepThree => 'createCareChatsStepThree'.tr;

  static String get createCareChatsStepFinal => 'createCareChatsStepFinal'.tr;

  static String get createACareChat => 'createACareChat'.tr;

  static String get setNicknameAndRelationCaption =>
      'setNicknameAndRelationCaption'.tr;

  static String get nicknameLabel => 'nicknameLabel'.tr;

  static String get relationLabel => 'relationLabel'.tr;

  static String get relationExample => 'relationExample'.tr;

  static String get plsSetPwd => 'plsSetPwd'.tr;

  static String get plsConfirmPwd => 'plsConfirmPwd'.tr;

  static String get wallet => 'wallet'.tr;

  static String get myWallet => 'myWallet'.tr;

  static String get totalValue => 'totalValue'.tr;

  static String get recharge => 'recharge'.tr;

  static String get withdrawal => 'withdrawal'.tr;

  static String get records => 'records'.tr;

  static String get coin => 'coin'.tr;

  static String get noAssetsFound => 'noAssetsFound'.tr;

  static String get addressOrDomainName => 'addressOrDomainName'.tr;

  static String get paste => 'paste'.tr;

  static String get amount => 'amount'.tr;

  static String get max => 'max'.tr;

  static String get minimumAmount => 'minimumAmount'.tr;

  static String get serviceFee => 'serviceFee'.tr;

  static String get balance => 'balance'.tr;

  static String get feeRateRules => 'feeRateRules'.tr;

  static String get actualAmount => 'actualAmount'.tr;

  static String get invalidAddress => 'invalidAddress'.tr;

  static String get retry => 'retry'.tr;

  static String get currentNetworkNotAvailable =>
      'currentNetworkNotAvailable'.tr;

  static String get allRecords => 'allRecords'.tr;

  static String get withdrawalFailed => 'withdrawalFailed'.tr;

  static String get sendMoneyPacket => 'sendMoneyPacket'.tr;

  static String get receiveMoneyPacket => 'receiveMoneyPacket'.tr;

  static String get refundMoneyPacket => 'refundMoneyPacket'.tr;

  static String get from => 'from'.tr;

  static String get to => 'to'.tr;

  static String get supportedBlockchainNetworkHint =>
      'supportedBlockchainNetworkHint'.tr;

  static String get copy => 'copy'.tr;

  static String get share => 'share'.tr;

  static String get pending => 'pending'.tr;

  static String get noMoreRecords => 'noMoreRecords'.tr;

  static String get unableToRecognize => 'unableToRecognize'.tr;

  static String get scanResult => 'scanResult'.tr;

  static String get moneyPacket => 'moneyPacket'.tr;

  static String get moneyPacketQuantityExceedGroupMemberCountAlert =>
      'moneyPacketQuantityExceedGroupMemberCountAlert'.tr;

  static String get random => 'random'.tr;

  static String get identical => 'identical'.tr;

  static String get quantity => 'quantity'.tr;

  static String get numOfMoneyPackets => 'numOfMoneyPackets'.tr;

  static String get crypto => 'crypto'.tr;

  static String get plsSelect => 'plsSelect'.tr;

  static String get wishes => 'wishes'.tr;

  static String get bestWishes => 'bestWishes'.tr;

  static String get amountEach => 'amountEach'.tr;

  static String get youOpenedYourOwn => 'youOpenedYourOwn'.tr;

  static String get xOpenedYour => 'xOpenedYour'.tr;

  static String get youOpenedThe => 'youOpenedThe'.tr;

  static String get xOpenedThe => 'xOpenedThe'.tr;

  static String get sentbyX => 'sentbyX'.tr;

  static String get sentby => 'sentby'.tr;

  static String get opened => 'opened'.tr;

  static String get expired => 'expired'.tr;

  static String get finished => 'finished'.tr;

  static String get youWillReceive => 'youWillReceive'.tr;

  static String get openedXofXMoneyPacketsInTotal =>
      'openedXofXMoneyPacketsInTotal'.tr;

  static String get moneyPacketWillExpiredAfterX =>
      'moneyPacketWillExpiredAfterX'.tr;

  static String get youAreLateClickFasterNextTime =>
      'youAreLateClickFasterNextTime'.tr;

  static String get nonGroupMemberCannotOpenMoneyPacketDialogContent =>
      'nonGroupMemberCannotOpenMoneyPacketDialogContent'.tr;

  static String get open => 'Open'.tr;

  static String get noFriendsPostedAPhotoTakeOneNow =>
      'noFriendsPostedAPhotoTakeOneNow'.tr;

  static String get recentlyUsed => 'recentlyUsed'.tr;

  static String get youOpenedX => 'youOpenedX'.tr;

  static String get xOpenedY => 'xOpenedY'.tr;

  static String get home => 'home'.tr;

  static String get worldcoin => 'worldcoin'.tr;

  static String get users => 'users'.tr;

  static String get countries => 'countries'.tr;

  static String get social => 'social'.tr;

  static String get computingPowerMiningPool => 'computingPowerMiningPool'.tr;

  static String get dailyIncome => 'dailyIncome'.tr;

  static String get computingPower => 'computingPower'.tr;

  static String get exploreWORLDDAOApplication =>
      'exploreWORLDDAOApplication'.tr;

  static String get latestNews => 'latestNews'.tr;

  static String get myProducts => 'myProducts'.tr;

  static String get worlddaoID => 'worlddaoID'.tr;

  static String get productDetails => 'productDetails'.tr;

  static String get productName => 'productName'.tr;

  static String get expectedEarnings => 'expectedEarnings'.tr;

  static String get annualized => 'annualized'.tr;

  static String get productExpiration => 'productExpiration'.tr;

  static String get settlementPeriod => 'settlementPeriod'.tr;

  static String get numberOfUnits => 'numberOfUnits'.tr;

  static String get totalPurchaseAmountCalculationDetails =>
      'totalPurchaseAmountCalculationDetails'.tr;

  static String get notStart => 'notStart'.tr;

  static String get inProgress => 'inProgress'.tr;

  static String get ended => 'ended'.tr;

  static String get soldOut => 'soldOut'.tr;

  static String get remainingUnits => 'remainingUnits'.tr;

  static String get startTime => 'startTime'.tr;

  static String get endTime => 'endTime'.tr;

  static String get daily => 'daily'.tr;

  static String get weekly => 'weekly'.tr;

  static String get monthly => 'monthly'.tr;

  static String get quaterly => 'quaterly'.tr;

  static String get yearly => 'yearly'.tr;

  static String get days => 'days'.tr;

  static String get minutes => 'minutes'.tr;

  static String get purchaseNow => 'purchaseNow'.tr;

  static String get myProduct => 'myProduct'.tr;

  static String get purchaseAmount => 'purchaseAmount'.tr;

  static String get purchaseTime => 'purchaseTime'.tr;

  static String get expirationDate => 'expirationDate'.tr;

  static String get latestEarnings => 'latestEarnings'.tr;

  static String get cummulativeEarnings => 'cummulativeEarnings'.tr;

  static String get earningsDetails => 'earningsDetails'.tr;

  static String get staticReward => 'staticReward'.tr;

  static String get dynamicReward => 'dynamicReward'.tr;

  static String get teamReward => 'teamReward'.tr;

  static String get purchaseProduct => 'purchaseProduct'.tr;

  static String get refundFunds => 'refundFunds'.tr;

  static String get xDays => 'xDays'.tr;

  static String get purchaseSuccessful => 'purchaseSuccessful'.tr;

  static String get network => 'network'.tr;

  static String get error90101 => 'error90101'.tr;

  static String get error90102 => 'error90102'.tr;

  static String get error90103 => 'error90103'.tr;

  static String get downloadApp => 'downloadApp'.tr;

  static String get deposit => 'deposit'.tr;

  static String get transactions => 'transactions'.tr;

  static String get computingCluster => 'computingCluster'.tr;

  static String get nextEarningsDate => 'nextEarningsDate'.tr;

  static String get circleOfFriends => 'circleOfFriends'.tr;

  static String get price => 'price'.tr;

  static String get aiAutoReply => 'aiAutoReply'.tr;

  static String get individualPurchaseLimit => 'individualPurchaseLimit'.tr;

  static String get error90104 => 'error90104'.tr;

  static String get weSupportFollowingNetworks =>
      'weSupportFollowingNetworks'.tr;

  static String get products => 'products'.tr;

  static String get copyInvitationLink => 'copyInvitationLink'.tr;

  static String get continueWithUsername => 'continueWithUsername'.tr;

  static String get securityQuestions => 'securityQuestions'.tr;

  static String get questionX => 'questionX'.tr;

  static String get selectAQuestion => 'selectAQuestion'.tr;

  static String get yourAnswer => 'yourAnswer'.tr;

  static String get usernameFormat => 'usernameFormat'.tr;

  static String get passwordTooSimple => 'passwordTooSimple'.tr;

  static String get passwordRecoveryHint => 'passwordRecoveryHint'.tr;

  static String get incorrectSecurityAnswers => 'incorrectSecurityAnswers'.tr;

  static String get block => 'block'.tr;

  static String get enterNickname => 'enterNickname'.tr;

  static String get change => 'change'.tr;

  static String get passwordTooSimpleExplicit => 'passwordTooSimpleExplicit'.tr;

  static String get tasks => 'tasks'.tr;

  static String get frens => 'frens'.tr;

  static String get farming => 'farming'.tr;

  static String get farm => 'farm'.tr;

  static String get taskRewardCaption => 'taskRewardCaption'.tr;

  static String get credit => 'credit'.tr;

  static String get credits => 'credits'.tr;

  static String get claim => 'claim'.tr;

  static String get inviteFrensCaption => 'inviteFrensCaption'.tr;

  static String get howItWorks => 'howItWorks'.tr;

  static String get stepOneTitle => 'stepOneTitle'.tr;

  static String get stepOneSubtitle => 'stepOneSubtitle'.tr;

  static String get stepTwoTitle => 'stepTwoTitle'.tr;

  static String get stepTwoSubtitle => 'stepTwoSubtitle'.tr;

  static String get stepThreeTitle => 'stepThreeTitle'.tr;

  static String get stepThreeSubtitle => 'stepThreeSubtitle'.tr;

  static String get inviteFrenXLeft => 'inviteFrenXLeft'.tr;

  /// no translation
  static String get aiModeOn => 'AI';

  static String get ai => 'AI';
}
