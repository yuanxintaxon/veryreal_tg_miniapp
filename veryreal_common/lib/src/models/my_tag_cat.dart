import 'dart:convert';

import 'package:flutter/material.dart';

import '../../veryreal_common.dart';

class MyTagCat {
  int id;
  String category;
  List<MyTag>? tags;

  MyTagCat.fromJson(Map<String, dynamic> map)
      : id = map["id"],
        category = map["category"],
        tags = map["tags"] == null
            ? null
            : List<MyTag>.from(map["tags"].map((x) => MyTag.fromJson(x)));

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['category'] = category;
    data['tags'] =
        tags == null ? null : List<dynamic>.from(tags!.map((x) => x.toJson()));
    return data;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}

Map<int, TextStyle> catTextStyleMap = {
  1: Styles.ts_F29591_16sp_regular_montserrat,
  2: Styles.ts_F2EF91_16sp_regular_montserrat,
  3: Styles.ts_91DAF2_16sp_regular_montserrat,
  4: Styles.ts_91F2D0_16sp_regular_montserrat,
};

Map<int, Color> catColorMap = {
  1: Styles.c_F29591,
  2: Styles.c_F2EF91,
  3: Styles.c_91DAF2,
  4: Styles.c_91F2D0,
};
