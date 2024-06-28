import 'dart:convert';

class TagChip {
  int id;
  String name;
  bool selected;

  TagChip.fromJson(Map<String, dynamic> map)
      : id = map["id"],
        name = map["name"],
        selected = map["selected"] ?? false;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['selected'] = selected;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TagChip && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return jsonEncode(this);
  }
}
