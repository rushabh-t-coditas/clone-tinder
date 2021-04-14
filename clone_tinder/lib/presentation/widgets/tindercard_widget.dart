import 'package:clone_tinder/data/models/results.dart';
import 'package:clone_tinder/presentation/widgets/card_bloc/card_bloc.dart';
import 'package:clone_tinder/presentation/widgets/card_bloc/card_event.dart';
import 'package:clone_tinder/presentation/widgets/card_bloc/card_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class TinderCard extends StatefulWidget {
  final Results user;

  TinderCard(this.user);

  @override
  _TinderCardState createState() => _TinderCardState();
}

class _TinderCardState extends State<TinderCard> {
  CardBloc _cardBloc;

  @override
  void initState() {
    super.initState();
    _cardBloc = CardBloc();
  }

  @override
  void dispose() {
    super.dispose();
    _cardBloc?.close();
  }

  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width * 1.0,
        height: MediaQuery.of(context).size.width * 1,
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    getProfileImage(),
                    BlocBuilder<CardBloc, CardState>(
                      cubit: _cardBloc,
                      builder: (context, state) {
                        return getDetails(state);
                      },
                    ),
                  ],
                ),
              ),
              getNavigationBar(),
            ],
          ),
        ),
      );

  Container getDetails(CardState state) => Container(
      height: 130,
      width: 250,
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      child: getText(state));

  Column getText(CardState state) {
    Text title;
    Text detail;

    switch (state.index) {
      case 0:
        title = Text(
          "Name:",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        );
        detail = Text(
          widget.user.name.title +
              ' ' +
              widget.user.name.first +
              ' ' +
              widget.user.name.last,
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        );
        break;

      case 1:
        title = Text(
          "Contact:",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        );
        detail = Text(
          'Phone: ' +
              widget.user.phone +
              '\nMobile: ' +
              widget.user.cell +
              '\nEmail: ' +
              widget.user.email,
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        );
        break;

      case 2:
        title = Text(
          "Location:",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        );
        detail = Text(
          widget.user.location.street.number.toString() +
              ', ' +
              widget.user.location.street.name +
              '\n' +
              widget.user.location.city +
              ', ' +
              widget.user.location.state +
              '\n' +
              widget.user.location.country,
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        );
        break;

      case 3:
        title = Text(
          "Info:",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        );
        detail = Text(
          widget.user.gender +
              '\t\t' +
              widget.user.dob.age.toString() +
              ' years old',
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        title,
        detail,
      ],
    );
  }

  Container getProfileImage() => Container(
        width: 120.0,
        height: 120.0,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          image: DecorationImage(
            image: NetworkImage(widget?.user?.picture?.large),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(60.0)),
          border: new Border.all(
            color: Colors.black,
            width: 1.5,
          ),
        ),
      );

  BlocBuilder getNavigationBar() {
    return BlocBuilder(
      cubit: _cardBloc,
      builder: (context, state) {
        return buttons(state.index);
      },
    );
  }

  BottomNavigationBar buttons(int index) => BottomNavigationBar(
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.lightBlueAccent,
        unselectedItemColor: Colors.blueGrey,
        selectedFontSize: 15,
        unselectedFontSize: 15,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
            label: "Name",
            icon: Icon(Icons.person_outline_outlined),
          ),
          BottomNavigationBarItem(
            label: "Contact",
            icon: Icon(Icons.perm_phone_msg_outlined),
          ),
          BottomNavigationBarItem(
            label: "Location",
            icon: Icon(FontAwesome5.map_marked_alt),
          ),
          BottomNavigationBarItem(
            label: "Info",
            icon: Icon(FontAwesome5.info_circle),
          ),
        ],
      );

  void onTap(int index) {
    _cardBloc.add(OnTapEvent(index));
  }
}
