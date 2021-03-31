import 'package:clone_tinder/presentation/app/route_constant.dart';
import 'package:clone_tinder/presentation/app/routes.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: Routes.getAll(),
      initialRoute: RouteConstant.home,
    );
  }
}
