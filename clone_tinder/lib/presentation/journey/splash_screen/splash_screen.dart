import 'package:clone_tinder/presentation/journey/home/home.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      navigateAfterFuture: null,
      seconds: 3,
      navigateAfterSeconds: Home(),
      title: Text(
        "Tinder \nClone",
        textScaleFactor: 6,
      ),
    );
  }
}
