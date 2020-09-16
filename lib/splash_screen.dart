import 'dart:async';

import 'package:arena/BottomNavigationBar/MainScreen.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const id = 'Splash_screen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // bool isPaused = false;
  // @override
  // void initState() {
  //   super.initState();
  //   startTime();
  // }

  // startTime() async {
  //   var duration = new Duration(seconds: 6);
  //   return Timer(duration, route);
  // }

  // route() {
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => BottomNavBar(),
  //     ),
  //   );
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   isPaused = true;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 200,
              height: 200,
              child: FlareActor(
                'assets/arena_logo.flr',
                animation: 'play',
                alignment: Alignment.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
