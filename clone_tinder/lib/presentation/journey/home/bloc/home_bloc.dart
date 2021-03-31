import 'package:clone_tinder/data/models/results.dart';
import 'package:clone_tinder/data/models/user_data.dart';
import 'package:clone_tinder/domain/usecases/user_usecase.dart';
import 'package:clone_tinder/presentation/journey/home/bloc/home_event.dart';
import 'package:clone_tinder/presentation/journey/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  UserUsecase usecase;

  HomeBloc() : super(InitialHomeState()) {
    this.usecase = UserUsecase();
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    switch (event.runtimeType) {
      case LoadUserDataEvent:
        yield* _mapLoadUserDataEventToState(event);
        break;
      case ItemRemoveEvent:
        yield* _mapItemRemoveEventToState(event);
        break;
      case UserSaveEvent:
        yield* _mapUserSaveEventToState(event);
        break;
    }
  }

  Stream<HomeState> _mapLoadUserDataEventToState(
      LoadUserDataEvent event) async* {
    yield LoadingState(state.userData);
    final UserData userData = await usecase.getUser(fromLocal: false);
    yield LoadedState(userData);
  }

  Stream<HomeState> _mapItemRemoveEventToState(ItemRemoveEvent event) async* {
    List<Results> currentList = state.userData.results;
    if (currentList.isNotEmpty) {
      currentList.removeAt(event.index);
    }
    UserData userData = UserData(results: currentList);
    yield ItemRemovedState(userData);
  }

  Stream<HomeState> _mapUserSaveEventToState(UserSaveEvent event) async* {
    UserData userData = state.userData;
    if (userData.results.isNotEmpty) {
      yield LoadingState(userData);
      Results data = userData.results[event.index];
      await usecase.saveUser(data);
      userData.results.removeAt(event.index);
    }
    yield UserSavedState(userData);
  }
}
