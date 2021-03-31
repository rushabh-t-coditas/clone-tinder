import 'dart:convert';

import 'package:clone_tinder/data/models/results.dart';

class DataTable {
  static final tableName = "userdata_table";

  static final String id = "id";
  static final String results = "JsonData";

  static final String create =
      "CREATE TABLE $tableName ($id TEXT PRIMARY KEY NOT NULL,"
      "$results TEXT);";

  static Results resultsFromMapValues(Map<String, dynamic> map) {
    String data = map[results];
    return Results.fromJson(json.decode(data));
  }
}
