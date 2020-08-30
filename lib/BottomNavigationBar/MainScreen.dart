import 'package:arena/Screens/HomeScreen/HomeScreen.dart';
import 'package:arena/Screens/ProfileScreen/DashboardProfile.dart';
import 'package:arena/Screens/ExploreScreen/ExploreScreen.dart';
import 'package:arena/Screens/ShopScreen/ShopScreen.dart';
import 'package:arena/Screens/TopScreen/TopScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'animated_bottom_bar.dart';

class BottomNavBar extends StatefulWidget {
  static const id = 'BottomNavBar';

  final List<BarItem> barItems = [
    BarItem(
      text: 'Shop',
      iconData: FontAwesomeIcons.shoppingBag,
      color: Colors.indigo,
    ),
    BarItem(
      text: 'Top',
      iconData: Icons.show_chart,
      color: Colors.pinkAccent,
    ),
    BarItem(
      text: 'Home',
      iconData: Icons.home,
      color: Colors.yellow.shade900,
    ),
    BarItem(
      text: 'Explore',
      iconData: Icons.search,
      color: Colors.cyan,
    ),
    BarItem(
      text: 'Me',
      iconData: Icons.person,
      color: Colors.deepPurple,
    ),
  ];

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with TickerProviderStateMixin {
  int selectedBarIndex = 2;

  static final Duration duration = const Duration(milliseconds: 300);

  var screens = [];

  @override
  Widget build(BuildContext context) {
    screens = [
      ShopScreen(),
      TopScreen(),
      HomeScreen(),
      ExploreScreen(),
      DashBoardProfile(
        duration: duration,
      ),
    ];

    return Scaffold(
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
    );
  }
}
