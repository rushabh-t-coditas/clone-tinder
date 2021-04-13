abstract class CardState {
  final int index;

  CardState(this.index);
}

class InitialState extends CardState {
  InitialState(int index) : super(0);
}

class ChangedState extends CardState {
  ChangedState(int index) : super(index);
}
