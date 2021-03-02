import 'package:clone_tinder/data/models/user_data.dart';
import 'package:clone_tinder/domain/usecases/user_usecase.dart';
import 'package:clone_tinder/presentation/journey/bloc/home_event.dart';
import 'package:clone_tinder/presentation/journey/bloc/home_state.dart';
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
        {
          yield* _mapLoadUserDataEventToState(event);
        }
    }
  }

  Stream<HomeState> _mapLoadUserDataEventToState(
      LoadUserDataEvent event) async* {
    yield LoadingState();
    final UserData userData = await usecase.getUser();
    yield LoadedState(userData);
  }
}
