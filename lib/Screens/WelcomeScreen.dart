import 'package:arena/BottomNavigationBar/MainScreen.dart';
import 'package:arena/Screens/Intro_Screen.dart';
import 'package:arena/Screens/Login&Registration/LoginScreen.dart';
import 'package:arena/Screens/Login&Registration/RegistrationScreen.dart';
import 'package:arena/Screens/ShopScreen/ShopScreen.dart';
import 'package:arena/Screens/loading_screen.dart';
import 'package:arena/splash_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = 'Welcome_Screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: <Widget>[
                FlatButton(
                  child: Text(
                    'Go to the ItemShop',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, LoadingScreen.id);
                  },
                ),
                FlatButton(
                  child: Text(
                    'Go to the Intro Page',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, IntroScreen.id);
                  },
                ),
                FlatButton(
                  child: Text(
                    'Go to the LoginPage',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                ),
                FlatButton(
                  child: Text(
                    'Go to the RegistrationPage',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                ),
                FlatButton(
                  child: Text(
                    'Go to the ShopPage',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, ShopScreen.id);
                  },
                ),
                FlatButton(
                  child: Text(
                    'Go to the BottomNavBar',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, BottomNavBar.id);
                  },
                ),
                FlatButton(
                  child: Text(
                    'Go to Splash Screen',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, SplashScreen.id);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
