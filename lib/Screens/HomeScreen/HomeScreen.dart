import 'package:arena/Themes/TextTheme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Home',
                      style: kMenuScreenItemNameTheme(Colors.black, 25),
                    ),
                    IconButton(
                      icon: Icon(Icons.notifications),
                      onPressed: () {
                        print('1');
                      },
                    ),
                  ],
                ),
              ),
              ListView.builder(
                itemBuilder: (context, index) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
