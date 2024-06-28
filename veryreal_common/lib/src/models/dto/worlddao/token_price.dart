// To parse this JSON data, do
//
//     final tokenPriceInfo = tokenPriceInfoFromJson(jsonString);

import 'dart:convert';

TokenPriceInfo tokenPriceInfoFromJson(String str) =>
    TokenPriceInfo.fromJson(json.decode(str));

String tokenPriceInfoToJson(TokenPriceInfo data) => json.encode(data.toJson());

class TokenPriceInfo {
  int tokenId;
  String tokenName;
  String tokenUrl;
  String price;
  String? priceChange;
  String priceChangePercent;

  TokenPriceInfo({
    required this.tokenId,
    required this.tokenName,
    required this.tokenUrl,
    required this.price,
    required this.priceChange,
    required this.priceChangePercent,
  });

  TokenPriceInfo copyWith({
    int? tokenId,
    String? tokenName,
    String? tokenUrl,
    String? price,
    String? priceChange,
    String? priceChangePercent,
  }) =>
      TokenPriceInfo(
        tokenId: tokenId ?? this.tokenId,
        tokenName: tokenName ?? this.tokenName,
        tokenUrl: tokenUrl ?? this.tokenUrl,
        price: price ?? this.price,
        priceChange: priceChange ?? this.priceChange,
        priceChangePercent: priceChangePercent ?? this.priceChangePercent,
      );

  factory TokenPriceInfo.fromJson(Map<String, dynamic> json) => TokenPriceInfo(
        tokenId: json["tokenId"],
        tokenName: json["tokenName"],
        tokenUrl: json["tokenUrl"],
        price: json["price"],
        priceChange: json["priceChange"],
        priceChangePercent: json["priceChangePercent"],
      );

  Map<String, dynamic> toJson() => {
        "tokenId": tokenId,
        "tokenName": tokenName,
        "tokenUrl": tokenUrl,
        "price": price,
        "priceChange": priceChange,
        "priceChangePercent": priceChangePercent,
      };
}
