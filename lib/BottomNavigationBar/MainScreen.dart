import 'package:arena/Screens/HomeScreen/HomeScreen.dart';
import 'package:arena/Screens/ProfileScreen/DashboardProfile.dart';
import 'package:arena/Screens/SearchScreen/SearchScreen.dart';
import 'package:arena/Screens/ShopScreen/ShopScreen.dart';
import 'package:flutter/material.dart';
import 'animated_bottom_bar.dart';

class BottomNavBar extends StatefulWidget {
  static const id = 'BottomNavBar';

  final List<BarItem> barItems = [
    BarItem(
      text: 'Shop',
      iconData: Icons.shopping_basket,
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
      Container(
        child: Center(
          child: Text('top'),
        ),
      ),
      HomeScreen(),
      SearchScreen(),
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
                    selectedBarIndex = index ;
                  },
                );
              },
            ),
    );
  }
}
