import 'package:flutter/material.dart';

@immutable
abstract class BeerEvent {}

class FetchedBeerName extends BeerEvent {}

class FetchedBeers extends BeerEvent {}
