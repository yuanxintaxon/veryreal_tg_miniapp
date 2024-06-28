// To parse this JSON data, do
//
//     final securityQuestion = securityQuestionFromJson(jsonString);

import 'dart:convert';

SecurityQuestion securityQuestionFromJson(String str) =>
    SecurityQuestion.fromJson(json.decode(str));

String securityQuestionToJson(SecurityQuestion data) =>
    json.encode(data.toJson());

class SecurityQuestion {
  int id;
  String question;
  String? answer;

  SecurityQuestion({
    required this.id,
    required this.question,
    this.answer,
  });

  SecurityQuestion copyWith({
    int? id,
    String? question,
    String? answer,
  }) =>
      SecurityQuestion(
        id: id ?? this.id,
        question: question ?? this.question,
        answer: answer ?? this.answer,
      );

  factory SecurityQuestion.fromJson(Map<String, dynamic> json) =>
      SecurityQuestion(
        id: json["id"],
        question: json["question"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "answer": answer,
      };
}
