import 'package:clone_tinder/presentation/app/route_constant.dart';
import 'package:clone_tinder/presentation/journey/home/bloc/home_bloc.dart';
import 'package:clone_tinder/presentation/widgets/appbar_widget.dart';
import 'package:clone_tinder/presentation/widgets/tindercard_widget.dart';
import 'package:clone_tinder/presentation/widgets/tinderstack_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clone_tinder/presentation/journey/home/bloc/home_event.dart';
import 'package:clone_tinder/presentation/journey/home/bloc/home_state.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeBloc homeBloc;

  @override
  void initState() {
    super.initState();
    homeBloc = HomeBloc()..add(LoadUserDataEvent());
  }

  @override
  void dispose() {
    homeBloc.close();
    super.dispose();
  }

  @override
  SafeArea build(BuildContext context) => SafeArea(
        bottom: false,
        child: Scaffold(
          appBar: AppBarWidget.normal(context, title: "Home"),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: BlocConsumer<HomeBloc, HomeState>(
                  cubit: homeBloc,
                  listener: onStateChange,
                  builder: (context, state) {
                    if (state is LoadingState) {
                      return _getLoader();
                    }
                    return _getTinderStack(state);
                  },
                ),
              ),
              _getFavouriteButton(),
            ],
          ),
        ),
      );

  Container _getLoader() => Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      );

  Container _getFavouriteButton() => Container(
        padding: EdgeInsets.symmetric(horizontal: 108, vertical: 30),
        child: TextButton.icon(
          onPressed: () =>
              Navigator.pushNamed(context, RouteConstant.favourite),
          icon: Icon(Icons.favorite_rounded, color: Colors.red, size: 25),
          label: Text(
            "Favourites",
            style: Theme.of(context).textTheme.bodyText2.copyWith(
                fontWeight: FontWeight.normal,
                fontSize: 20,
                color: Colors.black),
          ),
        ),
      );

  TinderStack _getTinderStack(HomeState state) => TinderStack(
        getCardList(state),
        onSwipeLeft: onSwipeLeft,
        onSwipeRight: onSwipeRight,
      );

  List<Widget> getCardList(HomeState state) =>
      (state.userData?.results ?? []).map((user) => TinderCard(user)).toList();

  void onStateChange(BuildContext context, HomeState state) {
    if (state is ItemRemovedState || state is UserSavedState) {
      if (state.userData.results.isEmpty) {
        homeBloc.add(LoadUserDataEvent());
      }
    }
  }

  void onSwipeRight(int index) => homeBloc.add(UserSaveEvent(index: index));

  void onSwipeLeft(int index) => homeBloc.add(ItemRemoveEvent(index: index));
}
