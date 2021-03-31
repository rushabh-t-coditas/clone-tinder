import 'package:clone_tinder/data/models/results.dart';
import 'package:clone_tinder/data/models/user_data.dart';

abstract class UserRepository {
  Future<UserData> getUser({bool fromLocal});

  Future<UserData> getUserData(String id, {bool fromLocal});

  Future<bool> removeUser(String id);

  Future<bool> saveUser(Results results);
}
