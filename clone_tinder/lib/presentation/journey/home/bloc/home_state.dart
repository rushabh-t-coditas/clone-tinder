import 'package:clone_tinder/data/models/user_data.dart';

abstract class HomeState {
  final UserData userData;

  HomeState(this.userData);
}

class InitialHomeState extends HomeState {
  InitialHomeState() : super(UserData(results: []));
}

class LoadingState extends HomeState {
  LoadingState(UserData userData) : super(userData);
}

class LoadedState extends HomeState {
  LoadedState(UserData userData) : super(userData);
}

class ItemRemovedState extends HomeState {
  ItemRemovedState(UserData userData) : super(userData);
}

class UserSavedState extends HomeState {
  UserSavedState(UserData userData) : super(userData);
}
