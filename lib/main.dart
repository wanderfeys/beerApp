import 'package:flutter/material.dart';

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
      home: HomeScreen(),
    );
  }
}
