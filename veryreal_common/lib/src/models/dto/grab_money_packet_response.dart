// To parse this JSON data, do
//
//     final grabMoneyPacketResponse = grabMoneyPacketResponseFromJson(jsonString);

import 'dart:convert';

GrabMoneyPacketResponse grabMoneyPacketResponseFromJson(String str) =>
    GrabMoneyPacketResponse.fromJson(json.decode(str));

String grabMoneyPacketResponseToJson(GrabMoneyPacketResponse data) =>
    json.encode(data.toJson());

class GrabMoneyPacketResponse {
  String serialNo;
  double amount;
  bool hasGrabbed;

  GrabMoneyPacketResponse({
    required this.serialNo,
    required this.amount,
    required this.hasGrabbed,
  });

  GrabMoneyPacketResponse copyWith({
    String? serialNo,
    double? amount,
    bool? hasGrabbed,
  }) =>
      GrabMoneyPacketResponse(
        serialNo: serialNo ?? this.serialNo,
        amount: amount ?? this.amount,
        hasGrabbed: hasGrabbed ?? this.hasGrabbed,
      );

  factory GrabMoneyPacketResponse.fromJson(Map<String, dynamic> json) =>
      GrabMoneyPacketResponse(
        serialNo: json["serialNo"],
        amount: json["amount"]?.toDouble(),
        hasGrabbed: json["hasGrabbed"],
      );

  Map<String, dynamic> toJson() => {
        "serialNo": serialNo,
        "amount": amount,
        "hasGrabbed": hasGrabbed,
      };
}
