import 'package:clone_tinder/presentation/journey/bloc/home_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clone_tinder/presentation/journey/bloc/home_state.dart';
import 'package:clone_tinder/presentation/journey/bloc/home_bloc.dart';

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

  void dispose() {
    homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        child: Scaffold(
          appBar: _appBar(),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: BlocBuilder(
                  cubit: homeBloc,
                  builder: (context, state) {
                    if (state is LoadingState) {
                      return Container(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is LoadedState) {
                      return ListView.builder(
                        itemCount: state.userData.results.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                              title: Text(
                            state.userData.results[index].name.first,
                            textAlign: TextAlign.center,
                          ));
                        },
                      );
                    } else {
                      return Text(
                        "Home Page",
                        textAlign: TextAlign.center,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ));
  }

  AppBar _appBar() => AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Home",
          style: Theme.of(context)
              .textTheme
              .bodyText2
              .copyWith(fontWeight: FontWeight.w600),
        ),
      );
}
