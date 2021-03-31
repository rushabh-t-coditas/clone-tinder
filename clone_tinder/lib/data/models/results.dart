import 'dart:convert';

import 'package:clone_tinder/data/models/dob.dart';
import 'package:clone_tinder/data/models/location.dart';
import 'package:clone_tinder/data/models/login.dart';
import 'package:clone_tinder/data/models/name.dart';
import 'package:clone_tinder/data/models/picture.dart';

class Results {
  String gender;
  String email;
  String phone;
  String cell;
  Name name;
  Picture picture;
  Dob dob;
  Login login;
  Location location;

  String id;
  bool isFavourite;

  Results({
    this.gender,
    this.email,
    this.phone,
    this.cell,
    this.name,
    this.picture,
    this.dob,
    this.login,
    this.location,
  });

  Results.fromJson(Map<String, dynamic> json) {
    gender = json['gender'];
    email = json['email'];
    phone = json['phone'];
    cell = json['cell'];

    name = json['name'] != null ? Name.fromJson(json['name']) : null;

    picture =
        json['picture'] != null ? Picture.fromJson(json['picture']) : null;

    dob = json['dob'] != null ? Dob.fromJson(json['dob']) : null;

    login = json['login'] != null ? Login.fromJson(json['login']) : null;

    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    id = login?.uuid;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['gender'] = this.gender;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['cell'] = this.cell;

    if (this.name != null) {
      data['name'] = this.name.toJson();
    }

    if (this.picture != null) {
      data['picture'] = this.picture.toJson();
    }

    if (this.dob != null) {
      data['dob'] = this.dob.toJson();
    }

    if (this.login != null) {
      data['login'] = this.login.toJson();
    }

    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    if (this.id != null) {
      data['id'] = this.id;
    }

    return data;
  }

  String toJsonString() {
    return json.encode(toJson());
  }
}
