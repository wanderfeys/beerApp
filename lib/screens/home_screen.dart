import 'package:BeerApp/bloc/beer_bloc.dart';
import 'package:BeerApp/bloc/beer_states.dart';
import 'package:BeerApp/components/beer_list.dart';
import 'package:BeerApp/components/search_beer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//Return main screen with desirialized json data
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                padding: EdgeInsets.only(right: 20.0),
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(
                      context: context,
                      delegate: BeerSearch(BlocProvider.of(context)));
                }),
          ],
          title: Text(
            "Beer House",
            style: TextStyle(fontWeight: FontWeight.w200),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<BeerBloc, BeerState>(
          builder: (ctx, state) {
            if (state is BeerLoadingState) {
              return LinearProgressIndicator();
            } else if (state is BeerLoadSuccessState) {
              return BeerList(
                beerListFromApi: state.beerlist,
              );
            } else if (state is BeerLoadFailureState) {
              return Center(
                child: Text(state.errorMessage),
              );
            }
            return Container();
          },
        ));
  }
}
