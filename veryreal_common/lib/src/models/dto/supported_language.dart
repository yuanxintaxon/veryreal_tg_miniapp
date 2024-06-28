// To parse this JSON data, do
//
//     final supportedLanguage = supportedLanguageFromJson(jsonString);

import 'dart:convert';

SupportedLanguage supportedLanguageFromJson(String str) =>
    SupportedLanguage.fromJson(json.decode(str));

String supportedLanguageToJson(SupportedLanguage data) =>
    json.encode(data.toJson());

class SupportedLanguage {
  int id;
  String lang;
  String langText;
  bool enabled;

  SupportedLanguage({
    required this.id,
    required this.lang,
    required this.langText,
    required this.enabled,
  });

  factory SupportedLanguage.fromJson(Map<String, dynamic> json) =>
      SupportedLanguage(
        id: json["id"],
        lang: json["lang"],
        langText: json["langText"],
        enabled: json["enabled"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lang": lang,
        "langText": langText,
        "enabled": enabled,
      };
}
