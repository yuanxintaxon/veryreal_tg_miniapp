// To parse this JSON data, do
//
//     final recordedUserVoiceFile = recordedUserVoiceFileFromJson(jsonString);

import 'dart:convert';

RecordedUserVoiceFile recordedUserVoiceFileFromJson(String str) =>
    RecordedUserVoiceFile.fromJson(json.decode(str));

String recordedUserVoiceFileToJson(RecordedUserVoiceFile data) =>
    json.encode(data.toJson());

class RecordedUserVoiceFile {
  int? fileId;
  String? fileName;
  String? filePath;
  String? fileUrl;

  RecordedUserVoiceFile({
    this.fileId,
    this.fileName,
    this.filePath,
    this.fileUrl,
  });

  factory RecordedUserVoiceFile.fromJson(Map<String, dynamic> json) =>
      RecordedUserVoiceFile(
        fileId: json["fileId"],
        fileName: json["fileName"],
        filePath: json["filePath"],
        fileUrl: json["fileUrl"],
      );

  Map<String, dynamic> toJson() => {
        "fileId": fileId,
        "fileName": fileName,
        "filePath": filePath,
        "fileUrl": fileUrl,
      };
}
