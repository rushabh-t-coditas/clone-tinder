import 'package:clone_tinder/data/models/user_data.dart';
import 'package:clone_tinder/data/repositories/user_repository_impl.dart';
import 'package:clone_tinder/domain/repositories/user_repository.dart';

class UserUsecase {
  UserRepository _userRepository;

  UserUsecase() {
    this._userRepository = UserRepositoryImpl();
  }

  Future<UserData> getUser() => _userRepository.getUser();
}
