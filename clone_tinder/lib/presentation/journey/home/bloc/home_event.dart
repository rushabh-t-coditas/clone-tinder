import 'package:flutter/foundation.dart';

abstract class HomeEvent {}

class InitialEvent extends HomeEvent {}

class LoadUserDataEvent extends HomeEvent {}

class ItemRemoveEvent extends HomeEvent {
  final int index;

  ItemRemoveEvent({
    @required this.index,
  });
}

class UserSaveEvent extends HomeEvent {
  int index;

  UserSaveEvent({
    @required this.index,
  });
}
