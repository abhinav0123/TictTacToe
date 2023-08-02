

// import 'dart:js';



import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
     super.initState();
    // Add a delay before navigating to the homepage
    Future.delayed(Duration(seconds: 2), () {
       Navigator.pushReplacementNamed(context, '/homepage');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/splash.png'),
      ),
    );
  }
}
