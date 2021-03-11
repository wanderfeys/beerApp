import 'package:BeerApp/blocs/beerBloc/beer_bloc.dart';
import 'package:BeerApp/blocs/beerBloc/beer_events.dart';
import 'package:BeerApp/blocs/beerBloc/beer_states.dart';
import 'package:BeerApp/components/beer_list.dart';
import 'package:BeerApp/components/search_beer.dart';
import 'package:BeerApp/services/beer_repository.dart';
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
                  showSearch(context: context, delegate: BeerSearch());
                }),
          ],
          title: Text(
            "Beer House",
            style: TextStyle(fontWeight: FontWeight.w200),
          ),
          centerTitle: true,
        ),
        body: BlocProvider<BeerBloc>(
            create: (context) => BeerBloc(
                  beerRepository: BeerRepository(),
                )..add(FetchedBeers()),
            child: BlocBuilder<BeerBloc, BeerState>(
              builder: (ctx, state) {
                if (state is BeerLoadInProgress) {
                  return LinearProgressIndicator();
                } else if (state is MainBeerSuccess) {
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
            )));
  }
}
