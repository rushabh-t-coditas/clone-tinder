import 'package:flutter/material.dart';

class AppBarWidget extends AppBar {
  static Border appBarBottomBorder() => Border(
          bottom: BorderSide(
        color: Colors.blueGrey,
        width: 1.0,
      ));

  AppBarWidget.normal(
    BuildContext context, {
    @required String title,
    List<Widget> actions,
  }) : super(
          centerTitle: true,
          title: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
          ),
          shape: appBarBottomBorder(),
          actions: actions,
        );
}
