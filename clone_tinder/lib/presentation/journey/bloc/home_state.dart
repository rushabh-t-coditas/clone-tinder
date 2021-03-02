import 'package:clone_tinder/data/models/user_data.dart';

abstract class HomeState {}

class InitialHomeState extends HomeState {}

class LoadingState extends HomeState {}

class LoadedState extends HomeState {
  final UserData userData;

  LoadedState(this.userData);
}
