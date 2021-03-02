import 'package:clone_tinder/data/models/user_data.dart';

abstract class UserRepository {
  Future<UserData> getUser();
}
