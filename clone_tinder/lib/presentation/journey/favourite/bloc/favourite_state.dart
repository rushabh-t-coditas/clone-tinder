import 'package:clone_tinder/data/models/user_data.dart';

abstract class FavouriteState {
  final UserData userData;
  final int count;

  FavouriteState(this.userData, this.count);
}

class InitialFavouriteState extends FavouriteState {
  InitialFavouriteState(int count) : super(UserData(results: []), count);
}

class LoadingFavouriteState extends FavouriteState {
  LoadingFavouriteState(UserData userData, int count) : super(userData, count);
}

class LoadedFavouriteState extends FavouriteState {
  LoadedFavouriteState(UserData userData, int count) : super(userData, count);
}

class FavouriteItemRemovedState extends FavouriteState {
  FavouriteItemRemovedState(UserData userData, int count)
      : super(userData, count);
}
