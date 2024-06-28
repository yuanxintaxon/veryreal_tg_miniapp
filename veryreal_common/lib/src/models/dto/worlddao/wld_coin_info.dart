// To parse this JSON data, do
//
//     final wldCoinInfo = wldCoinInfoFromJson(jsonString);

import 'dart:convert';

WldCoinInfo wldCoinInfoFromJson(String str) => WldCoinInfo.fromJson(json.decode(str));

String wldCoinInfoToJson(WldCoinInfo data) => json.encode(data.toJson());

class WldCoinInfo {
    int totalSignupsCountries;
    int totalSignupsCount;

    WldCoinInfo({
        required this.totalSignupsCountries,
        required this.totalSignupsCount,
    });

    WldCoinInfo copyWith({
        int? totalSignupsCountries,
        int? totalSignupsCount,
    }) => 
        WldCoinInfo(
            totalSignupsCountries: totalSignupsCountries ?? this.totalSignupsCountries,
            totalSignupsCount: totalSignupsCount ?? this.totalSignupsCount,
        );

    factory WldCoinInfo.fromJson(Map<String, dynamic> json) => WldCoinInfo(
        totalSignupsCountries: json["totalSignupsCountries"],
        totalSignupsCount: json["totalSignupsCount"],
    );

    Map<String, dynamic> toJson() => {
        "totalSignupsCountries": totalSignupsCountries,
        "totalSignupsCount": totalSignupsCount,
    };
}
