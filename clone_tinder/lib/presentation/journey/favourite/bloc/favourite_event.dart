abstract class FavouriteEvent {}

class LoadUserEvent extends FavouriteEvent {}

class RemoveUserEvent extends FavouriteEvent {
  int index;
  bool fromLocal;

  RemoveUserEvent(this.index, {this.fromLocal = true});
}
