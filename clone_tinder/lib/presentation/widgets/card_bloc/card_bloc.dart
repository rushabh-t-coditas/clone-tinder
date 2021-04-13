import 'package:clone_tinder/presentation/widgets/card_bloc/card_event.dart';
import 'package:clone_tinder/presentation/widgets/card_bloc/card_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc() : super(InitialState(0));

  Stream<CardState> mapEventToState(CardEvent event) async* {
    if (event is OnTapEvent) {
      yield* _mapOnTapEventToState(event);
    }
  }

  Stream<CardState> _mapOnTapEventToState(OnTapEvent event) async* {
    yield ChangedState(event.index);
  }
}
