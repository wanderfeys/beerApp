import 'package:flutter/material.dart';

@immutable
abstract class BeerEvent {}

class FetchedBeerByName extends BeerEvent {
  final String beerName;
  FetchedBeerByName(
    this.beerName,
  );
}

class FetchedAllBeers extends BeerEvent {}
