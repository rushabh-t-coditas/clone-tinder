import 'package:flutter/material.dart';

class TinderStack extends StatelessWidget {
  final List<Widget> cardList;
  final ValueNotifier<List<Widget>> listNotifier;
  final Function(int index) onSwipeLeft;
  final Function(int index) onSwipeRight;

  TinderStack(this.cardList, {this.onSwipeLeft, this.onSwipeRight})
      : listNotifier = ValueNotifier(cardList);

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: listNotifier,
        builder: (BuildContext context, List<Widget> value, Widget child) {
          return Stack(
            alignment: Alignment.center,
            children: _getPositions(context, value),
          );
        },
      );

  List<Positioned> _getPositions(BuildContext context, List<Widget> widgets) {
    double position = 30.0;
    return (widgets ?? [])
        .asMap()
        .map((index, widget) {
          Positioned item = Positioned(
            top: position,
            child: _attachDragBehaviour(context, index, widget),
          );
          position = position + 20;
          return MapEntry(index, item);
        })
        .values
        .toList();
  }

  Draggable _attachDragBehaviour(
          BuildContext context, int index, Widget widget) =>
      Draggable(
        childWhenDragging: Container(),
        child: widget,
        feedback: widget,
        maxSimultaneousDrags: 1,
        onDragEnd: (drag) {
          if (drag.offset.distance.abs() >= 50 &&
              drag.offset.dx.abs() > drag.offset.dy.abs()) {
            if (drag.offset.direction > 1) {
              onSwipeLeft?.call(index);
            } else {
              onSwipeRight?.call(index);
            }
            _removeCard(index);
          }
        },
      );

  void _removeCard(int index) => listNotifier.value.removeAt(index);
}
