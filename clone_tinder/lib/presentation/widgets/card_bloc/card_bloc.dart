import 'package:clone_tinder/presentation/widgets/card_bloc/card_event.dart';
import 'package:clone_tinder/presentation/widgets/card_bloc/card_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc() : super(InfoState(0));

  Stream<CardState> mapEventToState(CardEvent event) async* {
    if (event.runtimeType is OnTapEvent) {
      yield* _mapOnTapEventToState(event);
    }
  }

  Stream<CardState> _mapOnTapEventToState(OnTapEvent event) async* {
    switch (event.index) {
      case 0:
        yield InfoState(event.index);
        break;
      case 1:
        yield ContactState(event.index);
        break;
      case 2:
        yield LocationState(event.index);
        break;
      case 3:
        yield DobState(event.index);
        break;
    }
  }
}
