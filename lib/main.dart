import 'package:arena/BottomNavigationBar/MainScreen.dart';
import 'package:arena/Screens/Intro_Screen.dart';
import 'package:arena/Screens/Login&Registration/LoginScreen.dart';
import 'package:arena/Screens/Login&Registration/RegistrationScreen.dart';
import 'package:arena/Screens/ShopScreen/ShopItemDetailPage.dart';
import 'package:arena/Screens/WelcomeScreen.dart';
import 'package:arena/Screens/loading_screen.dart';
import 'package:arena/splash_screen.dart';
import 'package:flutter/material.dart';

import 'Screens/ShopScreen/ShopScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arena App',
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoadingScreen.id: (context) => LoadingScreen(),
        IntroScreen.id: (context) => IntroScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ShopScreen.id: (context) => ShopScreen(),
        ShopItemDetailPage.id: (context) => ShopItemDetailPage(),
        BottomNavBar.id: (context) => BottomNavBar(),
        SplashScreen.id: (context) => SplashScreen(),
      },
    );
  }
}
