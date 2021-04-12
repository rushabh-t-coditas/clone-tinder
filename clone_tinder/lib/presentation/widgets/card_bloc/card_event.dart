abstract class CardEvent {}

class OnTapEvent extends CardEvent {
  int index;

  OnTapEvent(this.index);
}
