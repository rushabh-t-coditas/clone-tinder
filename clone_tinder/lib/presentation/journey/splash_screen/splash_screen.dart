import 'package:clone_tinder/presentation/journey/home/home.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen.timer(
      seconds: 3,
      navigateAfterSeconds: Home(),
      title: Text(
        "Tinder Clone",
        textScaleFactor: 4,
      ),
      loaderColor: Colors.blue,
      loadingText: Text("Loading..."),
    );
  }
}
