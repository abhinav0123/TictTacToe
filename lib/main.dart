import 'package:flutter/material.dart';
import 'package:tictac/splashscreen.dart';

import 'homepage.dart';
void main() => runApp(const Myapp());

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic tac toe Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
       routes: {
        '/homepage': (context) => Homepage(), // Define the route to your Homepage
      },
    );
  }
}