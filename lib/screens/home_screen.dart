import 'package:BeerApp/bloc/beer_bloc.dart';
import 'package:BeerApp/bloc/beer_states.dart';
import 'package:BeerApp/components/beer_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Beer House",
            style: TextStyle(fontWeight: FontWeight.w200),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<BeerBloc, BeerState>(
          builder: (ctx, state) {
            if (state is BeerLoadInProgress) {
              return LinearProgressIndicator(
                value: null,
              );
            } else if (state is BeerLoadSuccess) {
              return BeerList(
                beerListFromApi: state.beerlist,
              );
            } else if (state is BeerLoadFailure) {
              return Center(
                child: Text(state.errorMessage),
              );
            }
            return Container();
          },
        ));
  }
}
