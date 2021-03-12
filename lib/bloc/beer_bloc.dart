import 'dart:async';
import 'package:BeerApp/model/beer.dart';
import 'package:BeerApp/services/beer_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'beer_events.dart';
import 'beer_states.dart';

//Сreates a block for application logic
class BeerBloc extends Bloc<BeerEvent, BeerState> {
  final BeerRepository beerRepository;
  BeerBloc({@required this.beerRepository})
      : assert(
          beerRepository != null,
        ),
        super(BeerInitialState());

  @override
  Stream<BeerState> mapEventToState(BeerEvent event) async* {
    //Return all beers if event FetchedAllBeers
    if (event is FetchedAllBeers) {
      yield BeerLoadingState();
      try {
        final List<Beer> _beerFromApi = await beerRepository
            .getBeersFromRepository()
            .timeout(const Duration(seconds: 5));
        yield BeerLoadSuccessState(beerlist: _beerFromApi);
      } on TimeoutException catch (e) {
        yield BeerLoadFailureState(errorMessage: e.message);
      } on dynamic catch (e) {
        yield BeerLoadFailureState(errorMessage: e.toString());
      }
    }
    // Return beer by name if FetchedBeerByName
    else if (event is FetchedBeerByName) {
      yield BeerLoadingState();
      try {
        final List<Beer> _beerNameFromApi = await beerRepository
            .getBeersFromRepository(event.beerName)
            .timeout(const Duration(seconds: 5));
        yield BeerLoadSuccessState(beerlist: _beerNameFromApi);
      } on TimeoutException catch (e) {
        yield BeerLoadFailureState(errorMessage: e.message);
      } on dynamic catch (e) {
        yield BeerLoadFailureState(errorMessage: e.toString());
      }
    }
  }
}
