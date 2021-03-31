import 'package:clone_tinder/data/models/user_data.dart';

abstract class FavouriteState {
  final UserData userData;

  FavouriteState(this.userData);
}

class InitialFavouriteState extends FavouriteState {
  InitialFavouriteState() : super(UserData(results: []));
}

class LoadingFavouriteState extends FavouriteState {
  LoadingFavouriteState(UserData userData) : super(userData);
}

class LoadedFavouriteState extends FavouriteState {
  LoadedFavouriteState(UserData userData) : super(userData);
}

class FavouriteItemRemovedState extends FavouriteState {
  FavouriteItemRemovedState(UserData userData) : super(userData);
}
