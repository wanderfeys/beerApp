import 'package:flutter/material.dart';

@immutable
abstract class BeerState {}

class BeerLoadSuccessState extends BeerState {
  final Iterable beerlist;
  BeerLoadSuccessState({@required this.beerlist}) : assert(beerlist != null);
}

class BeerInitialState extends BeerState {}

class BeerLoadingState extends BeerState {}

class BeerLoadFailureState extends BeerState {
  BeerLoadFailureState({this.errorMessage});
  final String errorMessage;
}
