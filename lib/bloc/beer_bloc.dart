import 'dart:async';

import 'package:BeerApp/bloc/beer_events.dart';
import 'package:BeerApp/bloc/beer_states.dart';
import 'package:BeerApp/model/beer.dart';
import 'package:BeerApp/services/beer_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BeerBloc extends Bloc<BeerEvent, BeerState> {
  final BeerRepository _beerRepository;
  BeerBloc(this._beerRepository)
      : assert(_beerRepository != null),
        super(BeerInitial());

  @override
  Stream<BeerState> mapEventToState(BeerEvent event) async* {
    if (event is FetchedBeers) {
      yield BeerLoadInProgress();
      try {
        final List<Beer> _beerFromApi = await _beerRepository
            .getBeers()
            .timeout(const Duration(seconds: 5));
        yield BeerLoadSuccess(beerlist: _beerFromApi);
      } on TimeoutException catch (e) {
        yield BeerLoadFailure(errorMessage: e.message);
      } on dynamic catch (e) {
        yield BeerLoadFailure(errorMessage: e);
      }
    }
  }
}
