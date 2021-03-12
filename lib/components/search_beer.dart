import 'package:BeerApp/bloc/beer_bloc.dart';
import 'package:BeerApp/bloc/beer_events.dart';
import 'package:BeerApp/bloc/beer_states.dart';
import 'package:BeerApp/components/beer_list.dart';
import 'package:BeerApp/model/beer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:BeerApp/constants/styles.dart';

//Creates search and  as result return api call with name parametr
class BeerSearch extends SearchDelegate<Beer> {
  final BeerBloc beerBloc;
  BeerSearch(this.beerBloc);
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          beerBloc.add(FetchedAllBeers());
          query = "";
          showSuggestions(context);
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          beerBloc.add(FetchedAllBeers());
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isNotEmpty) {
      beerBloc.add(FetchedBeerByName(query));
    } else
      beerBloc.add(FetchedAllBeers());

    return Container(
      child: BlocBuilder<BeerBloc, BeerState>(
        cubit: beerBloc,
        builder: (ctx, state) {
          if (state is BeerLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is BeerLoadSuccessState &&
              state.beerlist.isNotEmpty) {
            return BeerList(
              beerListFromApi: state.beerlist,
            );
          } else if (state is BeerLoadFailureState) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return Container(
            child: Center(
              child: Text(
                "Support only english language for search. \n Try searching again but with: \n English langugage,\n A more accurate name for beer, \n Without symbols, \n Or by similar names.  ",
                style: Styles.kSubtitleStyle,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      child: BlocBuilder<BeerBloc, BeerState>(
          cubit: beerBloc,
          builder: (ctx, state) {
            if (state is BeerLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is BeerLoadSuccessState &&
                state.beerlist.isNotEmpty) {
              return BeerList(
                beerListFromApi: state.beerlist,
              );
            } else if (state is BeerLoadFailureState) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else
              return Container();
          }),
    );
  }
}
