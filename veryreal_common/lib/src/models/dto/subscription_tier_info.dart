// To parse this JSON data, do
//
//     final subscriptionTierInfo = subscriptionTierInfoFromJson(jsonString);

import 'dart:convert';

SubscriptionTierInfo subscriptionTierInfoFromJson(String str) =>
    SubscriptionTierInfo.fromJson(json.decode(str));

String subscriptionTierInfoToJson(SubscriptionTierInfo data) =>
    json.encode(data.toJson());

class SubscriptionTierInfo {
  bool subscribed;
  int endTime;
  bool doNotDisturbEnabled;
  TierInfo freeTierInfo;
  TierInfo goldenTierInfo;

  SubscriptionTierInfo({
    required this.subscribed,
    required this.endTime,
    required this.doNotDisturbEnabled,
    required this.freeTierInfo,
    required this.goldenTierInfo,
  });

  factory SubscriptionTierInfo.fromJson(Map<String, dynamic> json) =>
      SubscriptionTierInfo(
        subscribed: json["subscribed"],
        endTime: json["endTime"],
        doNotDisturbEnabled: json["doNotDisturbEnabled"],
        freeTierInfo: TierInfo.fromJson(json["freeTierInfo"]),
        goldenTierInfo: TierInfo.fromJson(json["goldenTierInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "subscribed": subscribed,
        "endTime": endTime,
        "doNotDisturbEnabled": doNotDisturbEnabled,
        "freeTierInfo": freeTierInfo.toJson(),
        "goldenTierInfo": goldenTierInfo.toJson(),
      };
}

class TierInfo {
  int usedCloneVoiceMessages;
  int totalCloneVoiceMessages;
  int usedSystemVoiceMessages;
  int totalSystemVoiceMessages;
  int usedTranslatedTextMessages;
  int totalTranslatedTextMessages;
  int usedAiAvatarMessages;
  int totalAiAvatarMessages;

  TierInfo({
    required this.usedCloneVoiceMessages,
    required this.totalCloneVoiceMessages,
    required this.usedSystemVoiceMessages,
    required this.totalSystemVoiceMessages,
    required this.usedTranslatedTextMessages,
    required this.totalTranslatedTextMessages,
    required this.usedAiAvatarMessages,
    required this.totalAiAvatarMessages,
  });

  factory TierInfo.fromJson(Map<String, dynamic> json) => TierInfo(
        usedCloneVoiceMessages: json["usedCloneVoiceMessages"],
        totalCloneVoiceMessages: json["totalCloneVoiceMessages"],
        usedSystemVoiceMessages: json["usedSystemVoiceMessages"],
        totalSystemVoiceMessages: json["totalSystemVoiceMessages"],
        usedTranslatedTextMessages: json["usedTranslatedTextMessages"],
        totalTranslatedTextMessages: json["totalTranslatedTextMessages"],
        usedAiAvatarMessages: json["usedAIAvatarMessages"],
        totalAiAvatarMessages: json["totalAIAvatarMessages"],
      );

  Map<String, dynamic> toJson() => {
        "usedCloneVoiceMessages": usedCloneVoiceMessages,
        "totalCloneVoiceMessages": totalCloneVoiceMessages,
        "usedSystemVoiceMessages": usedSystemVoiceMessages,
        "totalSystemVoiceMessages": totalSystemVoiceMessages,
        "usedTranslatedTextMessages": usedTranslatedTextMessages,
        "totalTranslatedTextMessages": totalTranslatedTextMessages,
        "usedAIAvatarMessages": usedAiAvatarMessages,
        "totalAIAvatarMessages": totalAiAvatarMessages,
      };
}
