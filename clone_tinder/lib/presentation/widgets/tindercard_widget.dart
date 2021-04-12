import 'package:clone_tinder/data/models/results.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class TinderCard extends StatefulWidget {
  final Results user;

  TinderCard(this.user);

  @override
  _TinderCardState createState() => _TinderCardState();
}

class _TinderCardState extends State<TinderCard> {
  int buttonIndex = 0;

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
                    Container(
                      height: 150,
                      width: 150,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child: null,
                    )
                  ],
                )),
                buttons(),
              ],
            ),
          ),
        ),
        //bottomNavigationBar: buttons(),
      );

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

  BottomNavigationBar buttons() => BottomNavigationBar(
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
        currentIndex: buttonIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.lightBlueAccent,
        unselectedItemColor: Colors.blueGrey,
        selectedFontSize: 15,
        unselectedFontSize: 15,
        onTap: (newIndex) => setState(() => buttonIndex = newIndex),
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
}
