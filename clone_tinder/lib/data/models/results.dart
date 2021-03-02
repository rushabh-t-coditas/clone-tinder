import 'package:clone_tinder/data/models/name.dart';
import 'package:clone_tinder/data/models/picture.dart';

class Results {
  Name name;
  Picture picture;

  Results({this.name, this.picture});

  Results.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;

    picture =
        json['picture'] != null ? new Picture.fromJson(json['picture']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.name != null) {
      data['name'] = this.name.toJson();
    }

    if (this.picture != null) {
      data['picture'] = this.picture.toJson();
    }

    return data;
  }
}
