import 'package:flutter/material.dart';

class FortniteStatsScreen extends StatefulWidget {
  final Color color;

  const FortniteStatsScreen({Key key, this.color}) : super(key: key);
  @override
  _FortniteStatsScreenState createState() => _FortniteStatsScreenState();
}

class _FortniteStatsScreenState extends State<FortniteStatsScreen> {
  String url = 'https://api.fortnitetracker.com/v1/profile';
  String platform;
  String userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.color,
      body: SafeArea(
        child: Container(
          child: Text('hello'),
        ),
      ),
    );
  }
}
