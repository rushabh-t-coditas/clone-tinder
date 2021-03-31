import 'package:clone_tinder/data/models/results.dart';
import 'package:clone_tinder/data/models/user_data.dart';
import 'package:clone_tinder/data/repositories/user_repository_impl.dart';
import 'package:clone_tinder/domain/repositories/user_repository.dart';

class UserUsecase {
  UserRepository _userRepository;

  UserUsecase() {
    this._userRepository = UserRepositoryImpl();
  }

  Future<UserData> getUser({bool fromLocal = false}) =>
      _userRepository.getUser(fromLocal: fromLocal);

  Future<UserData> getUserData(String id, {bool fromLocal = true}) =>
      _userRepository.getUserData(id, fromLocal: fromLocal);

  Future<bool> saveUser(Results results) => _userRepository.saveUser(results);

  Future<bool> removeUser(String id) => _userRepository.removeUser(id);
}
