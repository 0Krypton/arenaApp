import 'package:flutter/material.dart';

class ShopScreenItemInfo {
  final String title;
  final String desc;
  final String bgImage;
  final String bgSkinImage;
  final List<String> itemsImage;
  final int itemCount;
  final double price;
  final bool isAvailable;
  final bool off;
  final double offPrice;
  final Color color;

  ShopScreenItemInfo({
    this.title,
    this.desc,
    this.bgImage,
    this.bgSkinImage,
    this.itemsImage,
    this.itemCount,
    this.price,
    this.isAvailable,
    this.off,
    this.offPrice,
    this.color,
  });
}

class InCartItemInfo {
  final String title;
  final String desc;
  final String bgSkinImage;
  final double price;
  final bool off;
  final double offPrice;
  final Color color;
  final int length;

  InCartItemInfo({
    @required this.title,
    @required this.desc,
    @required this.bgSkinImage,
    @required this.price,
    this.off,
    this.offPrice,
    @required this.color,
    @required this.length,
  });
}
