import 'package:flutter/material.dart';

class Store {
  final String name;
  final String description;
  final double price;
  final int itemCount;
  final String itemImageUrl;
  final String detailItemImageUrl;
  final Color bgBeginColor;
  final Color bgEndColor;
  final int tagTitle;

  Store({
    this.tagTitle,
    this.name,
    this.description,
    this.price,
    this.itemCount,
    this.itemImageUrl,
    this.detailItemImageUrl,
    this.bgBeginColor,
    this.bgEndColor,
  });
}

List<Store> listStoreItem = [
  Store(
    tagTitle: 1,
    name: 'Psycho\nBundle',
    description: '1 Skin\n1 Backbling\n1 Pickaxe',
    price: 22.99,
    itemCount: 3,
    itemImageUrl: 'images/psycho_bundle.png',
    detailItemImageUrl: 'images/psycho_bundle.png',
    bgBeginColor: Color(0xFFE86839),
    bgEndColor: Color(0xFFCE3233),
  ),
  Store(
    tagTitle: 2,
    name: 'Sahdow\nRising',
    description: '3 Skin\n3 Backbling\n1 Wrap',
    price: 19.99,
    itemCount: 7,
    itemImageUrl: 'images/shadow_bundle.png',
    detailItemImageUrl: 'images/shadow_bundle_image.png',
    bgBeginColor: Color(0xFF666666),
    bgEndColor: Color(0xFF131313),
  ),
  Store(
    tagTitle: 3,
    name: 'DarkFire\nBundle',
    description: '3 Skin\n3 Backbling\n3 Pickaxe\n3 Wrap\n1 Emote',
    price: 29.99,
    itemCount: 13,
    itemImageUrl: 'images/darkpowerchord.png',
    detailItemImageUrl: 'images/darkfire_pack.png',
    bgBeginColor: Color(0xFFBF80B7),
    bgEndColor: Color(0xFF56206C),
  ),
];
