// To parse this JSON data, do
//
//     final dummyCryptoToken = dummyCryptoTokenFromJson(jsonString);

import 'dart:convert';

DummyCryptoToken dummyCryptoTokenFromJson(String str) =>
    DummyCryptoToken.fromJson(json.decode(str));

String dummyCryptoTokenToJson(DummyCryptoToken data) =>
    json.encode(data.toJson());

class DummyCryptoToken {
  String tokenName;
  String tokenSymbol;
  String tokenImage;
  String? chainType;
  double tokenValue;
  double tokenAmount;
  double totalValue;

  DummyCryptoToken({
    required this.tokenName,
    required this.tokenSymbol,
    required this.tokenImage,
    this.chainType,
    required this.tokenValue,
    required this.tokenAmount,
    required this.totalValue,
  });

  DummyCryptoToken copyWith({
    String? tokenName,
    String? tokenSymbol,
    String? tokenImage,
    String? chainType,
    double? tokenValue,
    double? tokenAmount,
    double? totalValue,
  }) =>
      DummyCryptoToken(
        tokenName: tokenName ?? this.tokenName,
        tokenSymbol: tokenSymbol ?? this.tokenSymbol,
        tokenImage: tokenImage ?? this.tokenImage,
        chainType: chainType ?? this.chainType,
        tokenValue: tokenValue ?? this.tokenValue,
        tokenAmount: tokenAmount ?? this.tokenAmount,
        totalValue: totalValue ?? this.totalValue,
      );

  factory DummyCryptoToken.fromJson(Map<String, dynamic> json) =>
      DummyCryptoToken(
        tokenName: json["tokenName"],
        tokenSymbol: json["tokenSymbol"],
        tokenImage: json["tokenImage"],
        chainType: json["chainType"],
        tokenValue: json["tokenValue"]?.toDouble(),
        tokenAmount: json["tokenAmount"]?.toDouble(),
        totalValue: json["totalValue"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "tokenName": tokenName,
        "tokenSymbol": tokenSymbol,
        "tokenImage": tokenImage,
        "chainType": chainType,
        "tokenValue": tokenValue,
        "tokenAmount": tokenAmount,
        "totalValue": totalValue,
      };
}
