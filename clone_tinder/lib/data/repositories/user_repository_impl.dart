import 'package:clone_tinder/data/datasource/remote_data_source.dart';
import 'package:clone_tinder/data/models/user_data.dart';
import 'package:clone_tinder/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  RemoteDataSource userDataSource;

  UserRepositoryImpl() {
    this.userDataSource = RemoteDataSource();
  }

  @override
  Future<UserData> getUser() => this.userDataSource.getUser();
}
