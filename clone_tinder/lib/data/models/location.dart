import 'package:clone_tinder/data/models/street.dart';

class Location {
  Street street;
  String city;
  String state;
  String country;

  Location({this.street, this.city, this.state, this.country});

  Location.fromJson(Map<String, dynamic> json) {
    street =
        json['street'] != null ? new Street.fromJson(json['street']) : null;
    city = json['city'];
    state = json['state'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.street != null) {
      data['street'] = this.street.toJson();
    }
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;

    return data;
  }
}
