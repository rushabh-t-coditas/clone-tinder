import 'package:clone_tinder/presentation/journey/favourite/bloc/favourite_bloc.dart';
import 'package:clone_tinder/presentation/journey/favourite/bloc/favourite_event.dart';
import 'package:clone_tinder/presentation/journey/favourite/bloc/favourite_state.dart';
import 'package:clone_tinder/presentation/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Favourite extends StatefulWidget {
  Favourite({Key key}) : super(key: key);

  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  FavouriteBloc _favouriteBloc;

  @override
  void initState() {
    super.initState();
    _favouriteBloc = FavouriteBloc()..add(LoadUserEvent());
  }

  @override
  void dispose() {
    super.dispose();
    _favouriteBloc?.close();
  }

  @override
  SafeArea build(BuildContext context) => SafeArea(
        bottom: false,
        child: Scaffold(
          appBar: AppBarWidget.normal(context, title: "Favourites"),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: BlocConsumer<FavouriteBloc, FavouriteState>(
                  cubit: _favouriteBloc,
                  listener: onStateChange,
                  builder: (context, state) {
                    if (state is LoadingFavouriteState) {
                      return _getLoader();
                    }
                    return (state?.userData?.results?.isNotEmpty ?? true)
                        ? _getList(state)
                        : _getEmpty();
                  },
                ),
              )
            ],
          ),
        ),
      );

  void onStateChange(BuildContext context, FavouriteState state) {
    if (state is FavouriteItemRemovedState) {
      if (state.userData.results.isEmpty) {
        _favouriteBloc..add(LoadUserEvent());
      }
    }
  }

  Container _getLoader() => Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      );

  Container _getEmpty() => Container(
        alignment: Alignment.center,
        child: Text(
          "No Data",
          style: Theme.of(context).textTheme.bodyText2.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
        ),
      );

  Widget _getList(FavouriteState state) => ListView.builder(
        itemCount: state.userData.results.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            onDismissed: (DismissDirection direction) {
              _favouriteBloc.add(RemoveUserEvent(index, fromLocal: true));
            },
            background: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20.0),
              color: Colors.red,
              child: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    state?.userData?.results[index]?.picture?.medium),
                radius: 40,
              ),
              title: Text(
                state.userData.results[index].name.first +
                    ' ' +
                    state.userData.results[index].name.last,
                textAlign: TextAlign.left,
              ),
              contentPadding: EdgeInsets.all(16.0),
            ),
            key: ValueKey<int>(index),
            direction: DismissDirection.endToStart,
          );
        },
      );
}
