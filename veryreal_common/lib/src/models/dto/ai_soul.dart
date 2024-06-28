// To parse this JSON data, do
//
//     final aISoul = aISoulFromJson(jsonString);

import 'dart:convert';

AISoul aiSoulFromJson(String str) => AISoul.fromJson(json.decode(str));

String aiSoulToJson(AISoul data) => json.encode(data.toJson());

class AISoul {
    String identity;
    String note;
    String mantras;

    AISoul({
        required this.identity,
        required this.note,
        required this.mantras,
    });

    AISoul copyWith({
        String? identity,
        String? note,
        String? mantras,
    }) => 
        AISoul(
            identity: identity ?? this.identity,
            note: note ?? this.note,
            mantras: mantras ?? this.mantras,
        );

    factory AISoul.fromJson(Map<String, dynamic> json) => AISoul(
        identity: json["identity"],
        note: json["note"],
        mantras: json["mantras"],
    );

    Map<String, dynamic> toJson() => {
        "identity": identity,
        "note": note,
        "mantras": mantras,
    };
}
