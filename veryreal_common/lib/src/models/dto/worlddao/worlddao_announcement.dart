// To parse this JSON data, do
//
//     final worlddaoAnnouncement = worlddaoAnnouncementFromJson(jsonString);

import 'dart:convert';

WorlddaoAnnouncement worlddaoAnnouncementFromJson(String str) => WorlddaoAnnouncement.fromJson(json.decode(str));

String worlddaoAnnouncementToJson(WorlddaoAnnouncement data) => json.encode(data.toJson());

class WorlddaoAnnouncement {
    int id;
    String content;
    String link;
    bool deleted;
    int createdAt;
    int updatedAt;

    WorlddaoAnnouncement({
        required this.id,
        required this.content,
        required this.link,
        required this.deleted,
        required this.createdAt,
        required this.updatedAt,
    });

    WorlddaoAnnouncement copyWith({
        int? id,
        String? content,
        String? link,
        bool? deleted,
        int? createdAt,
        int? updatedAt,
    }) => 
        WorlddaoAnnouncement(
            id: id ?? this.id,
            content: content ?? this.content,
            link: link ?? this.link,
            deleted: deleted ?? this.deleted,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory WorlddaoAnnouncement.fromJson(Map<String, dynamic> json) => WorlddaoAnnouncement(
        id: json["id"],
        content: json["content"],
        link: json["link"],
        deleted: json["deleted"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "content": content,
        "link": link,
        "deleted": deleted,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
    };
}
