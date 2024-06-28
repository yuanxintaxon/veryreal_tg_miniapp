// To parse this JSON data, do
//
//     final withdrawalResponse = withdrawalResponseFromJson(jsonString);

import 'dart:convert';

WithdrawalResponse withdrawalResponseFromJson(String str) =>
    WithdrawalResponse.fromJson(json.decode(str));

String withdrawalResponseToJson(WithdrawalResponse data) =>
    json.encode(data.toJson());

class WithdrawalResponse {
  int tokenId;
  String serviceFee;
  String realAmount;
  bool? success;
  String? reason;

  WithdrawalResponse({
    required this.tokenId,
    required this.serviceFee,
    required this.realAmount,
    this.success,
    this.reason,
  });

  WithdrawalResponse copyWith({
    int? tokenId,
    String? serviceFee,
    String? realAmount,
    bool? success,
    String? reason,
  }) =>
      WithdrawalResponse(
        tokenId: tokenId ?? this.tokenId,
        serviceFee: serviceFee ?? this.serviceFee,
        realAmount: realAmount ?? this.realAmount,
        success: success ?? this.success,
        reason: reason ?? this.reason,
      );

  factory WithdrawalResponse.fromJson(Map<String, dynamic> json) =>
      WithdrawalResponse(
        tokenId: json["tokenId"],
        serviceFee: json["serviceFee"],
        realAmount: json["realAmount"],
        success: json["success"],
        reason: json["reason"],
      );

  Map<String, dynamic> toJson() => {
        "tokenId": tokenId,
        "serviceFee": serviceFee,
        "realAmount": realAmount,
        "success": success,
        "reason": reason,
      };
}
