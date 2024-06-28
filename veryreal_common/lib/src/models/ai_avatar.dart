// To parse this JSON data, do
//
//     final AIAvatar = AIAvatarFromJson(jsonString);

import 'dart:convert';

AIAvatar AIAvatarFromJson(String str) => AIAvatar.fromJson(json.decode(str));

String AIAvatarToJson(AIAvatar data) => json.encode(data.toJson());

class AIAvatar {
  String selfIntroduction;
  String talkTopic;
  String speakStyle;

  AIAvatar({
    required this.selfIntroduction,
    required this.talkTopic,
    required this.speakStyle,
  });

  factory AIAvatar.fromJson(Map<String, dynamic> json) => AIAvatar(
        selfIntroduction: json["selfIntroduction"],
        talkTopic: json["talkTopic"],
        speakStyle: json["speakStyle"],
      );

  Map<String, dynamic> toJson() => {
        "selfIntroduction": selfIntroduction,
        "talkTopic": talkTopic,
        "speakStyle": speakStyle,
      };
}
