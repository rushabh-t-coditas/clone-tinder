import 'package:clone_tinder/data/models/user_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

final String apiUrl = 'https://randomuser.me/api/?results=20';

class RemoteDataSource {
  Future<UserData> getUser() async {
    final response = await http.get(apiUrl);

    Map<String, dynamic> jsonData = json.decode(response.body);

    return UserData.fromJson(jsonData);
  }
}
