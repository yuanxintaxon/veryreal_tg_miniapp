// To parse this JSON data, do
//
//     final subscriptionQuotaInfo = subscriptionQuotaInfoFromJson(jsonString);

import 'dart:convert';

SubscriptionQuotaInfo subscriptionQuotaInfoFromJson(String str) =>
    SubscriptionQuotaInfo.fromJson(json.decode(str));

String subscriptionQuotaInfoToJson(SubscriptionQuotaInfo data) =>
    json.encode(data.toJson());

class SubscriptionQuotaInfo {
  bool voiceValid;
  bool translateTextValid;
  bool aiAvatarValid;

  SubscriptionQuotaInfo({
    required this.voiceValid,
    required this.translateTextValid,
    required this.aiAvatarValid,
  });

  factory SubscriptionQuotaInfo.fromJson(Map<String, dynamic> json) =>
      SubscriptionQuotaInfo(
        voiceValid: json["voiceValid"],
        translateTextValid: json["translateTextValid"],
        aiAvatarValid: json["aiAvatarValid"],
      );

  Map<String, dynamic> toJson() => {
        "voiceValid": voiceValid,
        "translateTextValid": translateTextValid,
        "aiAvatarValid": aiAvatarValid,
      };
}
