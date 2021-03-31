import 'package:clone_tinder/data/models/results.dart';
import 'package:clone_tinder/data/models/user_data.dart';
import 'package:clone_tinder/domain/usecases/user_usecase.dart';
import 'package:clone_tinder/presentation/journey/favourite/bloc/favourite_event.dart';
import 'package:clone_tinder/presentation/journey/favourite/bloc/favourite_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  UserUsecase useCase;

  FavouriteBloc() : super(InitialFavouriteState()) {
    this.useCase = UserUsecase();
  }

  Stream<FavouriteState> mapEventToState(FavouriteEvent event) async* {
    switch (event.runtimeType) {
      case LoadUserEvent:
        yield* _mapLoadUserEventToState(event);
        break;
      case RemoveUserEvent:
        yield* _mapRemoveUserEventToState(event);
        break;
    }
  }

  Stream<FavouriteState> _mapLoadUserEventToState(LoadUserEvent event) async* {
    yield LoadingFavouriteState(state.userData);
    final UserData userData = await useCase.getUser(fromLocal: true);
    yield LoadedFavouriteState(userData);
  }

  Stream<FavouriteState> _mapRemoveUserEventToState(
      RemoveUserEvent event) async* {
    int index = event.index;
    bool fromLocal = event.fromLocal;
    UserData data = state.userData;
    List<Results> results = data.results;

    if (results.isNotEmpty) {
      if (fromLocal) {
        yield LoadingFavouriteState(state.userData);
        Results result = results[index];
        await useCase.removeUser(result.id);
      }
      results.removeAt(index);
    }
    yield FavouriteItemRemovedState(UserData(results: results));
  }
}
