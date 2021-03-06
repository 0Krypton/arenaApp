import 'package:flutter/material.dart';

class News {
  final String title;
  final String description;
  final String imageUrl;
  final Color bgColor;
  final String extraLinks;
  final String extraImages;
  final bool isUpperBg;

  News({
    this.bgColor,
    this.description,
    this.title,
    this.imageUrl,
    this.extraImages,
    this.extraLinks,
    this.isUpperBg,
  });
}

List<News> newsList = [
  // News(
  //   title: 'Fortnite Ch2 S4\nAvailable Now!',
  //   imageUrl: 'images/fortnites4.jpg',
  //   bgColor: Color(0xFF0090cd),
  //   isUpperBg: true,
  // ),
  News(
    title: 'Ninja\nReturn\nto Twitch',
    imageUrl: 'images/ninja_v3.png',
    bgColor: Color(0xFF008CCB),
    isUpperBg: true,
  ),
  News(
    title: 'Fortnite\nRaise The Cup\nTournoument',
    imageUrl: 'images/raise_the_cup.png',
    bgColor: Color(0xFFB9131F),
    isUpperBg: false,
  ),
];
