import 'dart:math';

import 'package:arena/Colors/colors.dart';
import 'package:arena/Screens/HomeScreen/HomeScreen.dart';
import 'package:arena/Screens/Login&Registration/LoginScreen.dart';
import 'package:arena/Screens/ProfileScreen/DashboardProfile.dart';
import 'package:arena/Screens/ExploreScreen/ExploreScreen.dart';
import 'package:arena/Screens/ShopScreen/ShopScreen.dart';
import 'package:arena/Screens/TopScreen/TopScreen.dart';
import 'package:arena/services/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'animated_bottom_bar.dart';

class BottomNavBar extends StatefulWidget {
  static const id = 'BottomNavBar';

  final List<BarItem> barItems = [
    BarItem(
      text: 'Shop',
      iconData: 'icons/BottomNavigationBarIcons/shopping-bag.svg',
      color: Color(0xFF9E00FF),
    ),
    BarItem(
      text: 'Top',
      iconData: 'icons/BottomNavigationBarIcons/barchart.svg',
      color: Color(0xFFFF11A0),
    ),
    BarItem(
      text: 'Home',
      iconData: 'icons/BottomNavigationBarIcons/home.svg',
      color: Color(0xFFFF4D00),
    ),
    BarItem(
      text: 'Explore',
      iconData: 'icons/BottomNavigationBarIcons/search.svg',
      color: Color(0xFF00D1FF),
    ),
    BarItem(
      text: 'Me',
      iconData: 'icons/BottomNavigationBarIcons/profile.svg',
      color: Color(0xFF33019F),
    ),
  ];

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with SingleTickerProviderStateMixin {
  int selectedBarIndex = 2;

  static final Duration duration = const Duration(milliseconds: 300);
  AnimationController animationController;

  var screens = [];

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: duration);
    animationController.addListener(() {});
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  final double maxSlide = -100.0;
  void toggle() {
    setState(() {
      animationController.forward();
      animationController.isCompleted
          ? animationController.reverse()
          : animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    screens = [
      ShopScreen(),
      TopScreen(),
      HomeScreen(),
      ExploreScreen(),
      DashBoardProfile(
        onPressed: toggle,
        duration: duration,
      ),
    ];

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, _) {
        double slide = maxSlide * animationController.value;
        double slideY = (MediaQuery.of(context).size.height / 5) *
            animationController.value;
        double scale = 1 - (animationController.value * 0.3);
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Stack(
            children: [
              Scaffold(
                body: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.person,
                              size: animationController.value * 24,
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Edit Profile',
                              style: GoogleFonts.nunito(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  fontSize: animationController.value * 14),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.payment,
                              size: animationController.value * 24,
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Payment',
                              style: GoogleFonts.nunito(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  fontSize: animationController.value * 14),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.settings,
                              size: animationController.value * 24,
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Settings',
                              style: GoogleFonts.nunito(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  fontSize: animationController.value * 14),
                            ),
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 4),
                        GestureDetector(
                          onTap: () {
                            print('Tapped LogOut');
                            toggle();
                            Navigator.of(context)
                                .pushReplacementNamed(LoginScreen.id);
                            Provider.of<Auth>(context, listen: false).logout();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.exit_to_app,
                                size: animationController.value * 24,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Logout',
                                style: GoogleFonts.nunito(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                    fontSize: animationController.value * 14),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Transform(
                transform: Matrix4.identity()
                  ..translate(
                    slide,
                    slideY,
                  )
                  ..scale(
                    scale,
                  ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: kGradientEnd,
                        blurRadius: 50,
                        spreadRadius: 15,
                      ),
                    ],
                  ),
                  child: Scaffold(
                    backgroundColor: Colors.white,
                    body: screens[selectedBarIndex],
                    bottomNavigationBar: AnimatedBottomBar(
                      barItems: widget.barItems,
                      animationDuration: const Duration(milliseconds: 200),
                      onBarTap: (index) {
                        setState(
                          () {
                            selectedBarIndex = index;
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
