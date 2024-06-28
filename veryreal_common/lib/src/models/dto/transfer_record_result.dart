// To parse this JSON data, do
//
//     final transferRecordResult = transferRecordResultFromJson(jsonString);

import 'dart:convert';

TransferRecordResult transferRecordResultFromJson(String str) =>
    TransferRecordResult.fromJson(json.decode(str));

String transferRecordResultToJson(TransferRecordResult data) =>
    json.encode(data.toJson());

class TransferRecordResult {
  int total;
  int pages;
  int pageNum;
  int pageSize;
  List<TransferRecord>? records;

  TransferRecordResult({
    required this.total,
    required this.pages,
    required this.pageNum,
    required this.pageSize,
    this.records,
  });

  TransferRecordResult copyWith({
    int? total,
    int? pages,
    int? pageNum,
    int? pageSize,
    List<TransferRecord>? records,
  }) =>
      TransferRecordResult(
        total: total ?? this.total,
        pages: pages ?? this.pages,
        pageNum: pageNum ?? this.pageNum,
        pageSize: pageSize ?? this.pageSize,
        records: records ?? this.records,
      );

  factory TransferRecordResult.fromJson(Map<String, dynamic> json) =>
      TransferRecordResult(
        total: json["total"],
        pages: json["pages"],
        pageNum: json["pageNum"],
        pageSize: json["pageSize"],
        records: json["records"] == null
            ? []
            : List<TransferRecord>.from(
                json["records"].map((x) => TransferRecord.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "pages": pages,
        "pageNum": pageNum,
        "pageSize": pageSize,
        "records": records == null
            ? []
            : List<dynamic>.from(records!.map((x) => x.toJson())),
      };
}

enum TransferType {
  MONEY_PACKET_OUT,
  MONEY_PACKET_IN,
  MONEY_PACKET_RETURN,
  DEPOSIT,
  WITHDRAW,
  WITHDRAW_REFUND,
  WLD_STAKE_PAY_OUT, // 购买产品
  WLD_STAKE_RETURN_IN, // 资金退还（购买产品到期后，资金退还）
  WLD_STAKE_EARNING_STATIC, //静态收益
  WLD_STAKE_EARNING_DYNAMIC, //动态收益
  WLD_STAKE_EARNING_TEAM; // 团队收益

  String toJson() => name;
  static TransferType fromJson(String json) => values.byName(json);
}

enum AmountType {
  SEND,
  RECEIVE;

  String toJson() => name;
  static AmountType fromJson(String json) => values.byName(json);
}

class TransferRecord {
  int tokenId;
  String tokenName;
  String tokenFullName;
  String tokenUrl;
  int? tokenChainId;
  String? tokenChainName;
  AmountType type;
  TransferType transferType;
  String objector;
  String amount;
  int status;
  int timestamp;

  TransferRecord({
    required this.tokenId,
    required this.tokenName,
    required this.tokenFullName,
    required this.tokenUrl,
    required this.tokenChainId,
    required this.tokenChainName,
    required this.type,
    required this.transferType,
    required this.objector,
    required this.amount,
    required this.status,
    required this.timestamp,
  });

  TransferRecord copyWith({
    int? tokenId,
    String? tokenName,
    String? tokenFullName,
    String? tokenUrl,
    int? tokenChainId,
    String? tokenChainName,
    AmountType? type,
    TransferType? transferType,
    String? objector,
    String? amount,
    int? status,
    int? timestamp,
  }) =>
      TransferRecord(
        tokenId: tokenId ?? this.tokenId,
        tokenName: tokenName ?? this.tokenName,
        tokenFullName: tokenFullName ?? this.tokenFullName,
        tokenUrl: tokenUrl ?? this.tokenUrl,
        tokenChainId: tokenChainId ?? this.tokenChainId,
        tokenChainName: tokenChainName ?? this.tokenChainName,
        type: type ?? this.type,
        transferType: transferType ?? this.transferType,
        objector: objector ?? this.objector,
        amount: amount ?? this.amount,
        status: status ?? this.status,
        timestamp: timestamp ?? this.timestamp,
      );

  factory TransferRecord.fromJson(Map<String, dynamic> json) => TransferRecord(
        tokenId: json["tokenId"],
        tokenName: json["tokenName"],
        tokenFullName: json["tokenFullName"],
        tokenUrl: json["tokenUrl"],
        tokenChainId: json["tokenChainId"],
        tokenChainName: json["tokenChainName"],
        type: AmountType.fromJson(json["type"]),
        transferType: TransferType.fromJson(json["transferType"]),
        objector: json["objector"],
        amount: json["amount"],
        status: json["status"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toJson() => {
        "tokenId": tokenId,
        "tokenName": tokenName,
        "tokenFullName": tokenFullName,
        "tokenUrl": tokenUrl,
        "tokenChainId": tokenChainId,
        "tokenChainName": tokenChainName,
        "type": type.toJson(),
        "transferType": transferType.toJson(),
        "objector": objector,
        "amount": amount,
        "status": status,
        "timestamp": timestamp,
      };
}
