import 'package:flutter/material.dart';

@immutable
abstract class BeerState {}

class BeerLoadSuccess<T> extends BeerState {
  final Iterable<T> beerlist;
  BeerLoadSuccess({@required this.beerlist}) : assert(beerlist != null);
}

class MainBeerSuccess<T> extends BeerState {
  final Iterable<T> beerlist;
  MainBeerSuccess({@required this.beerlist}) : assert(beerlist != null);
}

class BeerInitial extends BeerState {}

class BeerLoadInProgress extends BeerState {}

class BeerLoadFailure extends BeerState {
  BeerLoadFailure({this.errorMessage});
  final String errorMessage;
}
