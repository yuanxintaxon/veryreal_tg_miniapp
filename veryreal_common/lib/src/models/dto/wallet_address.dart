// To parse this JSON data, do
//
//     final WalletAddress = WalletAddressFromJson(jsonString);

import 'dart:convert';

import '../../../veryreal_common.dart';

WalletAddress WalletAddressFromJson(String str) =>
    WalletAddress.fromJson(json.decode(str));

String WalletAddressToJson(WalletAddress data) => json.encode(data.toJson());

class WalletAddress {
  String walletType;
  String address;
  String qrCodeUrl;
  List<ChainToken> chains;

  WalletAddress({
    required this.walletType,
    required this.address,
    required this.qrCodeUrl,
    required this.chains,
  });

  WalletAddress copyWith({
    String? walletType,
    String? address,
    String? qrCodeUrl,
    List<ChainToken>? chains,
  }) =>
      WalletAddress(
        walletType: walletType ?? this.walletType,
        address: address ?? this.address,
        qrCodeUrl: qrCodeUrl ?? this.qrCodeUrl,
        chains: chains ?? this.chains,
      );

  factory WalletAddress.fromJson(Map<String, dynamic> json) => WalletAddress(
        walletType: json["walletType"],
        address: json["address"],
        qrCodeUrl: json["qrCodeUrl"],
        chains: List<ChainToken>.from(
            json["chains"].map((x) => ChainToken.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "walletType": walletType,
        "address": address,
        "qrCodeUrl": qrCodeUrl,
        "chains": List<dynamic>.from(chains.map((x) => x.toJson())),
      };
}
