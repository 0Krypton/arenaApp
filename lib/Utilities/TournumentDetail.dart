import 'package:arena/Utilities/ShopScreenItemInfo.dart';
import 'package:flutter/material.dart';

class Tournoument {
  final String title;
  final String description;
  final double cost;
  final String imageUrl;
  final Color bgColor;
  final int totalCount;
  final int enteredCount;

  Tournoument({
    this.title,
    this.description,
    this.cost,
    this.imageUrl,
    this.bgColor,
    this.totalCount,
    this.enteredCount,
  });
}

List<Tournoument> tournuments = [
  Tournoument(
    title: 'Creative Zone Wars',
    description: '',
    cost: 5,
    enteredCount: 13,
    totalCount: 16,
    imageUrl: 'images/fortnite_torunoment_image.png',
    bgColor: Color(0xFF656464),
  ),
  Tournoument(
    title: 'Creative Box Fight',
    description: '',
    cost: 10,
    enteredCount: 16,
    totalCount: 16,
    imageUrl: 'images/fortnite_torunoment_image_2.png',
    bgColor: Color(0xFF439CEB),
  ),
  Tournoument(
    title: 'Pro Arena Scrims',
    description: '',
    cost: 20,
    enteredCount: 91,
    totalCount: 100,
    imageUrl: 'images/fortnite_torunoment_image_3.png',
    bgColor: Color(0xFF6C16DD),
  )
];
