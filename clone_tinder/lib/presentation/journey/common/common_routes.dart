import 'package:clone_tinder/presentation/app/route_constant.dart';
import 'package:clone_tinder/presentation/journey/favourite/favourite.dart';
import 'package:clone_tinder/presentation/journey/home/home.dart';
import 'package:flutter/material.dart';

abstract class CommonRoutes {
  static Map<String, WidgetBuilder> all() => {
        RouteConstant.home: (context) => Home(),
        RouteConstant.favourite: (context) => Favourite(),
      };
}
