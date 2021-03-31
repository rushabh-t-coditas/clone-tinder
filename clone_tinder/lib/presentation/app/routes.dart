import 'package:clone_tinder/presentation/journey/common/common_routes.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, WidgetBuilder> getAll() => {
        ...CommonRoutes.all(),
      };
}
