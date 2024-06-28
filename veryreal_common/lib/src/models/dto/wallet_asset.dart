// To parse this JSON data, do
//
//     final walletAsset = walletAssetFromJson(jsonString);

import 'dart:convert';

WalletAsset walletAssetFromJson(String str) =>
    WalletAsset.fromJson(json.decode(str));

String walletAssetToJson(WalletAsset data) => json.encode(data.toJson());

class WalletAsset {
  int userId;
  String address;
  String totalValue;
  List<Asset> assets;

  WalletAsset({
    required this.userId,
    required this.address,
    required this.totalValue,
    required this.assets,
  });

  WalletAsset copyWith({
    int? userId,
    String? address,
    String? totalValue,
    List<Asset>? assets,
  }) =>
      WalletAsset(
        userId: userId ?? this.userId,
        address: address ?? this.address,
        totalValue: totalValue ?? this.totalValue,
        assets: assets ?? this.assets,
      );

  factory WalletAsset.fromJson(Map<String, dynamic> json) => WalletAsset(
        userId: json["userId"],
        address: json["address"],
        totalValue: json["totalValue"],
        assets: List<Asset>.from(json["assets"].map((x) => Asset.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "address": address,
        "totalValue": totalValue,
        "assets": List<dynamic>.from(assets.map((x) => x.toJson())),
      };
}

class Asset {
  int assetId;
  int tokenId;
  String tokenName;
  String tokenFullName;
  String tokenUrl;
  String tokenPrice;
  String totalAmount;
  String totalValue;
  String totalRealAmount;
  List<ChainToken> chainTokens;

  Asset({
    required this.assetId,
    required this.tokenId,
    required this.tokenName,
    required this.tokenFullName,
    required this.tokenUrl,
    required this.tokenPrice,
    required this.totalAmount,
    required this.totalValue,
    required this.totalRealAmount,
    required this.chainTokens,
  });

  Asset copyWith({
    int? assetId,
    int? tokenId,
    String? tokenName,
    String? tokenFullName,
    String? tokenUrl,
    String? tokenPrice,
    String? totalAmount,
    String? totalValue,
    String? totalRealAmount,
    List<ChainToken>? chainTokens,
  }) =>
      Asset(
        assetId: assetId ?? this.assetId,
        tokenId: tokenId ?? this.tokenId,
        tokenName: tokenName ?? this.tokenName,
        tokenFullName: tokenFullName ?? this.tokenFullName,
        tokenUrl: tokenUrl ?? this.tokenUrl,
        tokenPrice: tokenPrice ?? this.tokenPrice,
        totalAmount: totalAmount ?? this.totalAmount,
        totalValue: totalValue ?? this.totalValue,
        totalRealAmount: totalRealAmount ?? this.totalRealAmount,
        chainTokens: chainTokens ?? this.chainTokens,
      );

  factory Asset.fromJson(Map<String, dynamic> json) => Asset(
        assetId: json["assetId"],
        tokenId: json["tokenId"],
        tokenName: json["tokenName"],
        tokenFullName: json["tokenFullName"],
        tokenUrl: json["tokenUrl"],
        tokenPrice: json["tokenPrice"],
        totalAmount: json["totalAmount"],
        totalValue: json["totalValue"],
        totalRealAmount: json["totalRealAmount"],
        chainTokens: List<ChainToken>.from(
            json["chainTokens"].map((x) => ChainToken.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "assetId": assetId,
        "tokenId": tokenId,
        "tokenName": tokenName,
        "tokenFullName": tokenFullName,
        "tokenUrl": tokenUrl,
        "tokenPrice": tokenPrice,
        "totalAmount": totalAmount,
        "totalValue": totalValue,
        "totalRealAmount": totalRealAmount,
        "chainTokens": List<dynamic>.from(chainTokens.map((x) => x.toJson())),
      };
}

class ChainToken {
  int chainId;
  String chainName;
  String chainFullName;
  int? tokenId;
  String? tokenName;
  String? minDeposit;
  String? minWithdraw;
  int? confirmBlocks;
  bool? chainToken;
  bool? stableCoin;
  int? tokenScale;
  int? networkId;
  String? rateDesc;
  String? chainDesc;
  String? chainIcon;

  ChainToken({
    required this.tokenId,
    required this.tokenName,
    required this.minDeposit,
    required this.minWithdraw,
    required this.confirmBlocks,
    required this.chainToken,
    required this.stableCoin,
    required this.tokenScale,
    required this.chainId,
    required this.chainName,
    required this.chainFullName,
    required this.networkId,
    required this.rateDesc,
    required this.chainDesc,
    required this.chainIcon,
  });

  ChainToken copyWith({
    int? tokenId,
    String? tokenName,
    String? minDeposit,
    String? minWithdraw,
    int? confirmBlocks,
    bool? chainToken,
    bool? stableCoin,
    int? tokenScale,
    int? chainId,
    String? chainName,
    String? chainFullName,
    int? networkId,
    String? rateDesc,
    String? chainDesc,
    String? chainIcon,
  }) =>
      ChainToken(
        tokenId: tokenId ?? this.tokenId,
        tokenName: tokenName ?? this.tokenName,
        minDeposit: minDeposit ?? this.minDeposit,
        minWithdraw: minWithdraw ?? this.minWithdraw,
        confirmBlocks: confirmBlocks ?? this.confirmBlocks,
        chainToken: chainToken ?? this.chainToken,
        stableCoin: stableCoin ?? this.stableCoin,
        tokenScale: tokenScale ?? this.tokenScale,
        chainId: chainId ?? this.chainId,
        chainName: chainName ?? this.chainName,
        chainFullName: chainFullName ?? this.chainFullName,
        networkId: networkId ?? this.networkId,
        rateDesc: rateDesc ?? this.rateDesc,
        chainDesc: chainDesc ?? this.chainDesc,
        chainIcon: chainIcon ?? this.chainIcon,
      );

  factory ChainToken.fromJson(Map<String, dynamic> json) => ChainToken(
        tokenId: json["tokenId"],
        tokenName: json["tokenName"],
        minDeposit: json["minDeposit"],
        minWithdraw: json["minWithdraw"],
        confirmBlocks: json["confirmBlocks"],
        chainToken: json["chainToken"],
        stableCoin: json["stableCoin"],
        tokenScale: json["tokenScale"],
        chainId: json["chainId"],
        chainName: json["chainName"],
        chainFullName: json["chainFullName"],
        networkId: json["networkId"],
        rateDesc: json["rateDesc"],
        chainDesc: json["chainDesc"],
        chainIcon: json["chainIcon"],
      );

  Map<String, dynamic> toJson() => {
        "tokenId": tokenId,
        "tokenName": tokenName,
        "minDeposit": minDeposit,
        "minWithdraw": minWithdraw,
        "confirmBlocks": confirmBlocks,
        "chainToken": chainToken,
        "stableCoin": stableCoin,
        "tokenScale": tokenScale,
        "chainId": chainId,
        "chainName": chainName,
        "chainFullName": chainFullName,
        "networkId": networkId,
        "rateDesc": rateDesc,
        "chainDesc": chainDesc,
        "chainIcon": chainIcon,
      };
}
