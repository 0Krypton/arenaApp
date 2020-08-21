import 'package:flutter/material.dart';


class GameItemData{
  final String imageUrl;
  final Color color;

  GameItemData({this.color , this.imageUrl});

}
final List<GameItemData> listGamesPlayed = [
  GameItemData(color: Colors.red, imageUrl: 'images/apex_legends.png'),
  GameItemData(color: Colors.blue, imageUrl: 'images/fortnite.png'),
  GameItemData(color: Colors.black, imageUrl: 'images/rainbow_six.png'),
];
