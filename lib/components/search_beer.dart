import 'package:BeerApp/blocs/beerBloc/beer_bloc.dart';
import 'package:BeerApp/blocs/beerBloc/beer_events.dart';
import 'package:BeerApp/blocs/beerBloc/beer_states.dart';
import 'package:BeerApp/components/beer_list.dart';
import 'package:BeerApp/components/contstants.dart';
import 'package:BeerApp/services/beer_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//Creates search and  as result return api call with name parametr
class BeerSearch extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
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
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocProvider<BeerBloc>(
      create: (context) => BeerBloc(
        beerRepository: BeerRepository(),
        beerName: query,
      )..add(FetchedBeerName()),
      child: Container(
        child: BlocBuilder<BeerBloc, BeerState>(
          builder: (ctx, state) {
            if (state is BeerLoadInProgress) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is BeerLoadSuccess && state.beerlist.isNotEmpty) {
              return BeerList(
                beerListFromApi: state.beerlist,
              );
            } else if (state is BeerLoadFailure) {
              return Center(
                child: Text(state.errorMessage),
              );
            }
            return Container(
              child: Center(
                child: Text(
                  "Support only english language for search. \n Try searching again but with: \n English langugage,\n A more accurate name for beer, \n Without symbols, \n Or by similar names.  ",
                  style: kSubtitleStyle,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return BlocProvider<BeerBloc>(
      create: (context) => BeerBloc(
        beerRepository: BeerRepository(),
      )..add(FetchedBeers()),
      child: Container(
        child: BlocBuilder<BeerBloc, BeerState>(
          builder: (ctx, state) {
            if (state is BeerLoadInProgress) {
              return Center(child: CircularProgressIndicator());
            } else if (state is MainBeerSuccess && state.beerlist.isNotEmpty) {
              return BeerList(
                beerListFromApi: state.beerlist,
              );
            } else if (state is BeerLoadFailure) {
              return Center(
                child: Text(state.errorMessage),
              );
            }
            return Container(
              child: Center(
                child: Text(
                  "Support only english language for search \n Try searching again but with: \n English langugage.\n A more accurate name for beer, \n Without symbols, \n Or by similar names.  ",
                  style: kSubtitleStyle,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
