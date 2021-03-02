import 'package:clone_tinder/data/models/name.dart';

class Results {
  Name name;

  Results({this.name});

  Results.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.name != null) {
      data['name'] = this.name.toJson();
    }

    return data;
  }
}
