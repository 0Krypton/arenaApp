import 'package:arena/BottomNavigationBar/MainScreen.dart';
import 'package:arena/Screens/ExploreScreen/CreateTournoument.dart';
import 'package:arena/Screens/ExploreScreen/ExploreScreenProvider.dart';
import 'package:arena/Screens/Intro_Screen.dart';
import 'package:arena/Screens/Login&Registration/LoginScreen.dart';
import 'package:arena/Screens/Login&Registration/RegistrationScreen.dart';
import 'package:arena/Screens/ShopScreen/CartShopScreen.dart';
import 'package:arena/Screens/ShopScreen/ShopScreenItemProvider.dart';
import 'package:arena/Screens/WelcomeScreen.dart';
import 'package:arena/Screens/loading_screen.dart';
import 'package:arena/services/auth_provider.dart';
import 'package:arena/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/ShopScreen/ShopScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Auth()),
        ChangeNotifierProxyProvider<Auth, ExploreScreenProvider>(
          builder: (context, auth, previous) => ExploreScreenProvider(
            auth.token,
            auth.userEmail,
            auth.userId,
            previous == null ? [] : previous.searchScreenTours,
          ),
        ),
        ChangeNotifierProvider.value(
          value: ShopScreenItemProvider(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (context, auth, _) {
          return MaterialApp(
            title: 'Arena App',
            initialRoute: auth.isAuth ? BottomNavBar.id : LoginScreen.id,
            routes: {
              CreateTournoument.id: (context) => CreateTournoument(),
              WelcomeScreen.id: (context) => WelcomeScreen(),
              LoadingScreen.id: (context) => LoadingScreen(),
              IntroScreen.id: (context) => IntroScreen(),
              LoginScreen.id: (context) => LoginScreen(),
              RegistrationScreen.id: (context) => RegistrationScreen(),
              ShopScreen.id: (context) => ShopScreen(),
              BottomNavBar.id: (context) => BottomNavBar(),
              SplashScreen.id: (context) => SplashScreen(),
              CartScreen.id: (context) => CartScreen(),
            },
          );
        },
      ),
    );
  }
}
