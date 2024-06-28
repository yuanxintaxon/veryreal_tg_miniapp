// To parse this JSON data, do
//
//     final aISoulStatus = aISoulStatusFromJson(jsonString);

import 'dart:convert';

AISoulStatus aiSoulStatusFromJson(String str) => AISoulStatus.fromJson(json.decode(str));

String aiSoulStatusToJson(AISoulStatus data) => json.encode(data.toJson());

class AISoulStatus {
    bool completed;
    int step;

    AISoulStatus({
        required this.completed,
        required this.step,
    });

    AISoulStatus copyWith({
        bool? completed,
        int? step,
    }) => 
        AISoulStatus(
            completed: completed ?? this.completed,
            step: step ?? this.step,
        );

    factory AISoulStatus.fromJson(Map<String, dynamic> json) => AISoulStatus(
        completed: json["completed"],
        step: json["step"],
    );

    Map<String, dynamic> toJson() => {
        "completed": completed,
        "step": step,
    };
}
