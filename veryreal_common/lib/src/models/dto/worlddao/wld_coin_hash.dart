// To parse this JSON data, do
//
//     final wldCoinHash = wldCoinHashFromJson(jsonString);

import 'dart:convert';

WldCoinHash wldCoinHashFromJson(String str) => WldCoinHash.fromJson(json.decode(str));

String wldCoinHashToJson(WldCoinHash data) => json.encode(data.toJson());

class WldCoinHash {
    String dailyIncome;
    String hashRate;

    WldCoinHash({
        required this.dailyIncome,
        required this.hashRate,
    });

    WldCoinHash copyWith({
        String? dailyIncome,
        String? hashRate,
    }) => 
        WldCoinHash(
            dailyIncome: dailyIncome ?? this.dailyIncome,
            hashRate: hashRate ?? this.hashRate,
        );

    factory WldCoinHash.fromJson(Map<String, dynamic> json) => WldCoinHash(
        dailyIncome: json["dailyIncome"],
        hashRate: json["hashRate"],
    );

    Map<String, dynamic> toJson() => {
        "dailyIncome": dailyIncome,
        "hashRate": hashRate,
    };
}
