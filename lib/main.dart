import 'package:BeerApp/bloc/beer_events.dart';
import 'package:BeerApp/services/beer_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/beer_bloc.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(BeerApp());
}

class BeerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.amberAccent,
          scaffoldBackgroundColor: Color(0xFFf39c12)),
      home: BlocProvider(
        create: (context) => BeerBloc(
          beerRepository: BeerRepository(),
        )..add(FetchedAllBeers()),
        child: HomeScreen(),
      ),
    );
  }
}
