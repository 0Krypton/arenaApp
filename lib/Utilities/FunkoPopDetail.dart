import 'package:flutter/material.dart';

class FunkoPopDetail {
  final String imageUrl;
  final String bgImageUrl;
  final String bgUpperImageUrl;
  final String price;
  final String title;
  final String desc;
  final Color bgColor;
  final int remainingOfItem;
  final int rating;
  final String date;

  FunkoPopDetail({
    this.imageUrl,
    this.bgImageUrl,
    this.bgUpperImageUrl,
    this.rating,
    this.price,
    this.title,
    this.desc,
    this.bgColor,
    this.remainingOfItem,
    this.date,
  });
}

List<FunkoPopDetail> listFunkoPop = [
  FunkoPopDetail(
    imageUrl: 'images/funko_pop_fortnite_1.png',
    bgImageUrl: 'images/slurpyswamps_poi.png',
    bgUpperImageUrl: 'images/fortniterippley.png',
    price: '\$ 6.99',
    title: 'Rippley vs Sludge',
    desc: 'Fortnite outfit\nRippley vs Sludge\'s FunkoPop',
    bgColor: Color(0xFFb6deef),
    remainingOfItem: 2,
    rating: 3,
    date: '9,20,4',
  ),
  FunkoPopDetail(
    imageUrl: 'images/funko_pop_fortnite_2.png',
    bgImageUrl: 'images/luckylanding_poi.jpg',
    bgUpperImageUrl: 'images/pandateamleader_thumbnail.png',
    price: '\$ 4.99',
    title: 'P.A.N.D.A Team Leader',
    desc: 'Fortnite outfit P.A.N.D.A Team\nLeader\'s FunkoPop',
    bgColor: Color(0xFFa6a5a5),
    remainingOfItem: 8,
    rating: 5,
    date: '9,20,4',
  ),
  FunkoPopDetail(
    imageUrl: 'images/funko_pop_fortnite_3.png',
    bgImageUrl: 'images/coralcastle_poi.jpg',
    bgUpperImageUrl: 'images/fish_thumbnail.png',
    price: '\$ 9.99',
    title: 'Fish Skin',
    desc: 'Fortnite outfit\nFish\'s FunkoPop',
    bgColor: Color(0xFFff855a),
    remainingOfItem: 22,
    rating: 4,
    date: '9,20,4',
  ),
  FunkoPopDetail(
    imageUrl: 'images/funko_pop_fortnite_4.png',
     bgImageUrl: 'images/tiltedtower_poi.jpg',
    bgUpperImageUrl: 'images/wildcard.png',
    price: '\$ 14.99',
    title: 'Wild Card',
    desc: 'Fortnite outfit\nWild Card\'s FunkoPop',
    bgColor: Color(0xFFe04545),
    remainingOfItem: 8,
    rating: 5,
    date: '9,20,4',
  )
];
