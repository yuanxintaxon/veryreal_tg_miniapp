// To parse this JSON data, do
//
//     final tokenInfo = tokenInfoFromJson(jsonString);

import 'dart:convert';

import 'wallet_asset.dart';

TokenInfo tokenInfoFromJson(String str) => TokenInfo.fromJson(json.decode(str));

String tokenInfoToJson(TokenInfo data) => json.encode(data.toJson());

class TokenInfo {
  int tokenId;
  String tokenName;
  String? tokenFullName;
  String? tokenUrl;
  List<ChainToken> chainTokens;

  TokenInfo({
    required this.tokenId,
    required this.tokenName,
    this.tokenFullName,
    this.tokenUrl,
    required this.chainTokens,
  });

  TokenInfo copyWith({
    int? tokenId,
    String? tokenName,
    String? tokenFullName,
    String? tokenUrl,
    List<ChainToken>? chainTokens,
  }) =>
      TokenInfo(
        tokenId: tokenId ?? this.tokenId,
        tokenName: tokenName ?? this.tokenName,
        tokenFullName: tokenFullName ?? this.tokenFullName,
        tokenUrl: tokenUrl ?? this.tokenUrl,
        chainTokens: chainTokens ?? this.chainTokens,
      );

  factory TokenInfo.fromJson(Map<String, dynamic> json) => TokenInfo(
        tokenId: json["tokenId"],
        tokenName: json["tokenName"],
        tokenFullName: json["tokenFullName"],
        tokenUrl: json["tokenUrl"],
        chainTokens: List<ChainToken>.from(
            json["chainTokens"].map((x) => ChainToken.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tokenId": tokenId,
        "tokenName": tokenName,
        "tokenFullName": tokenFullName,
        "tokenUrl": tokenUrl,
        "chainTokens": List<dynamic>.from(chainTokens.map((x) => x.toJson())),
      };
}
