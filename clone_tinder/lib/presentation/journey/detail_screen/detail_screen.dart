import 'package:clone_tinder/data/models/results.dart';
import 'package:clone_tinder/presentation/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final Results user;

  Details({Key key, @required this.user}) : super(key: key);

  @override
  SafeArea build(BuildContext context) => SafeArea(
        bottom: false,
        child: Scaffold(
          appBar: AppBarWidget.normal(context, title: user.name.first),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 1.2,
                child: Card(
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            getProfileImage(),
                            getDetail(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
            width: 1.5,
          ),
        ),
      );

  Container getDetail() => Container(
        height: 240,
        width: 300,
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(user.name.title +
                ' ' +
                user.name.first +
                ' ' +
                user.name.last +
                '\n ' +
                user.gender +
                '\t' +
                user.dob.age.toString()),
            Text('Phone: ' +
                user.phone +
                '\nMobile: ' +
                user.cell +
                '\nEmail: ' +
                user.email),
            Text(user.location.street.number.toString() +
                ', ' +
                user.location.street.name +
                '\n' +
                user.location.city +
                ', ' +
                user.location.state +
                '\n' +
                user.location.country),
          ],
        ),
      );
}
