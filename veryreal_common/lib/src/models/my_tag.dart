import 'dart:convert';



class MyTag {
  int id;
  int? catId;
  String name;
  bool customized;

  MyTag.fromJson(Map<String, dynamic> map)
      : id = map["id"],
        catId = map["catId"],
        name = map["name"],
        customized = map["customized"];

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['catId'] = catId;
    data['name'] = name;
    data['customized'] = customized;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyTag && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return jsonEncode(this);
  }
}
