import 'package:clone_tinder/data/models/results.dart';
import 'package:flutter/material.dart';

class TinderCard extends StatelessWidget {
  final Results user;

  TinderCard(this.user);

  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.width * 0.9,
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              /*Container(
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 1.0)),
                ),
                height: 170,
              ),*/
              getProfileImage(),
              getDetails(),
              buttons(),
            ],
          ),
        ),
      );

  Container getProfileImage() => Container(
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          image: DecorationImage(
            image: NetworkImage(user.picture.large),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(100.0)),
          border: new Border.all(
            color: Colors.black,
            width: 1.0,
          ),
        ),
      );

  Container getDetails() => Container(
        width: 100,
        height: 100,
      );

  ButtonBar buttons() => ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          TextButton(
            onPressed: () {},
            child: Icon(Icons.person_outline_outlined, color: Colors.blue),
          ),
          TextButton(
            onPressed: () {},
            child: Icon(Icons.contact_phone, color: Colors.blue),
          ),
          TextButton(
            onPressed: () {},
            child: Icon(Icons.favorite_rounded, color: Colors.red),
          ),
          TextButton(
            onPressed: () {},
            child: Icon(Icons.favorite_rounded, color: Colors.red),
          ),
        ],
      );
}
