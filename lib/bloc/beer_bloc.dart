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
  final String beerName;
  BeerBloc({@required this.beerRepository, this.beerName})
      : assert(beerRepository != null, beerName != null),
        super(BeerInitial());

  @override
  Stream<BeerState> mapEventToState(BeerEvent event) async* {
    if (event is FetchedBeers) {
      yield BeerLoadInProgress();
      try {
        final List<Beer> _beerFromApi =
            await beerRepository.getBeers().timeout(const Duration(seconds: 5));
        yield MainBeerSuccess(beerlist: _beerFromApi);
      } on TimeoutException catch (e) {
        yield BeerLoadFailure(errorMessage: e.message);
      } on dynamic catch (e) {
        yield BeerLoadFailure(errorMessage: e.toString());
      }
    } else if (event is FetchedBeerName) {
      yield BeerLoadInProgress();
      try {
        final List<Beer> _beerNameFromApi = await beerRepository
            .getNameOfBeer(beerName)
            .timeout(const Duration(seconds: 5));
        yield BeerLoadSuccess(beerlist: _beerNameFromApi);
      } on TimeoutException catch (e) {
        yield BeerLoadFailure(errorMessage: e.message);
      } on dynamic catch (e) {
        yield BeerLoadFailure(errorMessage: e.toString());
      }
    }
  }
}
