import 'package:flutter/material.dart';
import 'package:seat_finder/screens/seat_finder_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SeatFinderScreen(),
    );
  }
}
