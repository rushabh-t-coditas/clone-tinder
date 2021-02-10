import 'package:clone_tinder/data/repositories/repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

final String apiUrl = 'https://randomuser.me/api/?results=1';

Future<List<User>> getUser() async {
  var response = await http.get(apiUrl);
  if (response.statusCode == 200) {
    return json.decode(response.body)['results'];
  } else {
    throw Exception('Error loading');
  }
}
