// To parse this JSON data, do
//
//     final dummyWalletRecord = dummyWalletRecordFromJson(jsonString);

import 'dart:convert';

DummyWalletRecord dummyWalletRecordFromJson(String str) =>
    DummyWalletRecord.fromJson(json.decode(str));

String dummyWalletRecordToJson(DummyWalletRecord data) =>
    json.encode(data.toJson());

class DummyWalletRecord {
  String recordName;
  String recordDescription;
  int recordType;
  double recordValue;
  int recordStatus;
  int recordTime;
  String tokenName;
  String tokenImage;

  DummyWalletRecord({
    required this.recordName,
    required this.recordDescription,
    required this.recordType,
    required this.recordValue,
    required this.recordStatus,
    required this.recordTime,
    required this.tokenName,
    required this.tokenImage,
  });

  DummyWalletRecord copyWith({
    String? recordName,
    String? recordDescription,
    int? recordType,
    double? recordValue,
    int? recordStatus,
    int? recordTime,
    String? tokenName,
    String? tokenImage,
  }) =>
      DummyWalletRecord(
        recordName: recordName ?? this.recordName,
        recordDescription: recordDescription ?? this.recordDescription,
        recordType: recordType ?? this.recordType,
        recordValue: recordValue ?? this.recordValue,
        recordStatus: recordStatus ?? this.recordStatus,
        recordTime: recordTime ?? this.recordTime,
        tokenName: tokenName ?? this.tokenName,
        tokenImage: tokenImage ?? this.tokenImage,
      );

  factory DummyWalletRecord.fromJson(Map<String, dynamic> json) =>
      DummyWalletRecord(
        recordName: json["recordName"],
        recordDescription: json["recordDescription"],
        recordType: json["recordType"],
        recordValue: json["recordValue"]?.toDouble(),
        recordStatus: json["recordStatus"],
        recordTime: json["recordTime"],
        tokenName: json["tokenName"],
        tokenImage: json["tokenImage"],
      );

  Map<String, dynamic> toJson() => {
        "recordName": recordName,
        "recordDescription": recordDescription,
        "recordType": recordType,
        "recordValue": recordValue,
        "recordStatus": recordStatus,
        "recordTime": recordTime,
        "tokenName": tokenName,
        "tokenImage": tokenImage,
      };
}
