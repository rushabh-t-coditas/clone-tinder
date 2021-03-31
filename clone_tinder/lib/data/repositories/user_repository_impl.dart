import 'package:clone_tinder/data/datasource/local_data_source.dart';
import 'package:clone_tinder/data/datasource/remote_data_source.dart';
import 'package:clone_tinder/data/models/results.dart';
import 'package:clone_tinder/data/models/user_data.dart';
import 'package:clone_tinder/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  RemoteDataSource userRemoteDataSource;
  LocalDataSource userLocalDataSource;

  UserRepositoryImpl() {
    this.userRemoteDataSource = RemoteDataSource();
    this.userLocalDataSource = LocalDataSource();
  }

  @override
  Future<UserData> getUser({bool fromLocal = false}) {
    if (fromLocal == true) {
      return this.userLocalDataSource.getUser();
    }
    return this.userRemoteDataSource.getUser();
  }

  @override
  Future<UserData> getUserData(String id, {bool fromLocal = true}) async {
    if (!fromLocal) {
      throw UnimplementedError();
    }
    return this.userLocalDataSource.getUserById(id);
  }

  @override
  Future<bool> saveUser(Results results) =>
      this.userLocalDataSource.saveUser(results);

  @override
  Future<bool> removeUser(String id) =>
      this.userLocalDataSource.removeUserById(id);
}
