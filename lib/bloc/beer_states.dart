import 'package:BeerApp/model/beer.dart';
import 'package:flutter/material.dart';

@immutable
abstract class BeerState {}

class BeerInitial extends BeerState {}

class BeerLoadInProgress extends BeerState {}

class BeerLoadSuccess extends BeerState {
  final List<Beer> beerlist;
  BeerLoadSuccess({@required this.beerlist}) : assert(beerlist != null);
}

class BeerLoadFailure extends BeerState {
  BeerLoadFailure({this.errorMessage});
  final String errorMessage;
}
