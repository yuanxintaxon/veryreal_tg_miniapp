// To parse this JSON data, do
//
//     final worlddaoOrder = worlddaoOrderFromJson(jsonString);

import 'dart:convert';

WorlddaoOrder worlddaoOrderFromJson(String str) => WorlddaoOrder.fromJson(json.decode(str));

String worlddaoOrderToJson(WorlddaoOrder data) => json.encode(data.toJson());

class WorlddaoOrder {
    int orderId;
    int productId;
    String productName;
    String productLogo;
    String productProfit;
    String orderAmount;
    String latestEarning;
    String? totalEarning;
    int payTokenId;
    String payTokenName;
    int orderTime;
    int expireTime;

    WorlddaoOrder({
        required this.orderId,
        required this.productId,
        required this.productName,
        required this.productLogo,
        required this.productProfit,
        required this.orderAmount,
        required this.latestEarning,
        required this.totalEarning,
        required this.payTokenId,
        required this.payTokenName,
        required this.orderTime,
        required this.expireTime,
    });

    WorlddaoOrder copyWith({
        int? orderId,
        int? productId,
        String? productName,
        String? productLogo,
        String? productProfit,
        String? orderAmount,
        String? latestEarning,
        String? totalEarning,
        int? payTokenId,
        String? payTokenName,
        int? orderTime,
        int? expireTime,
    }) => 
        WorlddaoOrder(
            orderId: orderId ?? this.orderId,
            productId: productId ?? this.productId,
            productName: productName ?? this.productName,
            productLogo: productLogo ?? this.productLogo,
            productProfit: productProfit ?? this.productProfit,
            orderAmount: orderAmount ?? this.orderAmount,
            latestEarning: latestEarning ?? this.latestEarning,
            totalEarning: totalEarning ?? this.totalEarning,
            payTokenId: payTokenId ?? this.payTokenId,
            payTokenName: payTokenName ?? this.payTokenName,
            orderTime: orderTime ?? this.orderTime,
            expireTime: expireTime ?? this.expireTime,
        );

    factory WorlddaoOrder.fromJson(Map<String, dynamic> json) => WorlddaoOrder(
        orderId: json["orderId"],
        productId: json["productId"],
        productName: json["productName"],
        productLogo: json["productLogo"],
        productProfit: json["productProfit"],
        orderAmount: json["orderAmount"],
        latestEarning: json["latestEarning"],
        totalEarning: json["totalEarning"],
        payTokenId: json["payTokenId"],
        payTokenName: json["payTokenName"],
        orderTime: json["orderTime"],
        expireTime: json["expireTime"],
    );

    Map<String, dynamic> toJson() => {
        "orderId": orderId,
        "productId": productId,
        "productName": productName,
        "productLogo": productLogo,
        "productProfit": productProfit,
        "orderAmount": orderAmount,
        "latestEarning": latestEarning,
        "totalEarning": totalEarning,
        "payTokenId": payTokenId,
        "payTokenName": payTokenName,
        "orderTime": orderTime,
        "expireTime": expireTime,
    };
}
