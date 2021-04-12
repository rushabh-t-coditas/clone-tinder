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
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.width * 1.2,
        child: Container(
          width: MediaQuery.of(context).size.width * 1.0,
          height: MediaQuery.of(context).size.width * 1.2,
          child: Card(
            elevation: 2.0,
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
        ),
      );

  Container getDetails(CardState state) => Container(
      height: 150,
      width: 150,
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      child: getText(state));

  Text getText(CardState state) {
    if (state is InfoState) {
      return Text(widget.user.name.title +
          ' ' +
          widget.user.name.first +
          ' ' +
          widget.user.name.last +
          '\n ' +
          widget.user.gender +
          '\t' +
          widget.user.dob.age.toString());
    } else if (state is ContactState) {
      return Text('Phone: ' +
          widget.user.phone +
          '\nMobile: ' +
          widget.user.cell +
          '\nEmail: ' +
          widget.user.email);
    } else if (state is LocationState) {
      return Text(widget.user.location.street.number.toString() +
          ', ' +
          widget.user.location.street.name +
          '\n' +
          widget.user.location.city +
          ', ' +
          widget.user.location.state +
          '\n' +
          widget.user.location.country);
    } else
      return Text('Birthday: ' + widget.user.dob.date);
  }

  Container getProfileImage() => Container(
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          image: DecorationImage(
            image: NetworkImage(widget?.user?.picture?.large),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(100.0)),
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
            label: "Info",
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
            label: "DOB",
            icon: Icon(FontAwesome5.calendar_alt),
          ),
        ],
      );

  void onTap(int index) {
    _cardBloc.add(OnTapEvent(index));
  }
}
