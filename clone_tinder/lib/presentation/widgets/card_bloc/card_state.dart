abstract class CardState {
  final int index;

  CardState(this.index);
}

class InfoState extends CardState {
  InfoState(int index) : super(index);
}

class ContactState extends CardState {
  ContactState(int index) : super(index);
}

class LocationState extends CardState {
  LocationState(int index) : super(index);
}

class DobState extends CardState {
  DobState(int index) : super(index);
}
