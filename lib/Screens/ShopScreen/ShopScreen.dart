import 'package:arena/Colors/colors.dart';
import 'package:arena/CustomClipper/ShopScreenClipBG.dart';
import 'package:arena/Screens/ShopScreen/Store_Item_Detail_Page.dart';
import 'package:arena/Screens/loading_screen.dart';

import 'package:arena/Themes/TextTheme.dart';
import 'package:arena/Utilities/FunkoPopDetail.dart';
import 'package:arena/Utilities/StoreItemDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Funko_Pop_Detail_Page.dart';

enum Game {
  Fortnite,
  ApexLegends,
  Valorant,
}

class ShopScreen extends StatefulWidget {
  static const id = 'ShopScreen';

  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  Game selectedGame = Game.Fortnite;

  List<FunkoPopDetail> funkoPops = listFunkoPop;
  List<Store> storeItems = listStoreItem;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: kMainBackGroundColor,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 20.0, top: 10.0, right: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Items', style: kShopScreenLabelTextStyle),
                      IconButton(
                        icon: Icon(
                          Icons.shopping_cart,
                          color: kShopScreenTextColor,
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 5),
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGame = Game.Fortnite;
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          margin: EdgeInsets.symmetric(horizontal: 2),
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                          decoration: BoxDecoration(
                            color: selectedGame == Game.Fortnite
                                ? kActiveGameItem
                                : kInactiveGameItem,
                            borderRadius: BorderRadius.all(
                              Radius.circular(25.0),
                            ),
                          ),
                          child: Text(
                            'Fortnite',
                            style: GoogleFonts.nunito(
                              fontSize: 12.0,
                              color: selectedGame == Game.Fortnite
                                  ? kActiveGameItemColor
                                  : kInctiveGameItemColor,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGame = Game.ApexLegends;
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                          margin: EdgeInsets.symmetric(horizontal: 2),
                          decoration: BoxDecoration(
                            color: selectedGame == Game.ApexLegends
                                ? kActiveGameItem
                                : kInactiveGameItem,
                            borderRadius: BorderRadius.all(
                              Radius.circular(25.0),
                            ),
                          ),
                          child: Text(
                            'ApexLegends',
                            style: GoogleFonts.nunito(
                              fontSize: 12.0,
                              color: selectedGame == Game.ApexLegends
                                  ? kActiveGameItemColor
                                  : kInctiveGameItemColor,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGame = Game.Valorant;
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                          margin: EdgeInsets.symmetric(horizontal: 2),
                          decoration: BoxDecoration(
                            color: selectedGame == Game.Valorant
                                ? kActiveGameItem
                                : kInactiveGameItem,
                            borderRadius: BorderRadius.all(
                              Radius.circular(25.0),
                            ),
                          ),
                          child: Text(
                            'Valorant',
                            style: GoogleFonts.nunito(
                              fontSize: 12.0,
                              color: selectedGame == Game.Valorant
                                  ? kActiveGameItemColor
                                  : kInctiveGameItemColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, top: 20),
                  child: Text(
                    'Funko Pops',
                    style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                Container(
                  width: 400,
                  height: 400,
                  padding: EdgeInsets.all(32),
                  child: Swiper(
                    itemCount: funkoPops.length,
                    itemWidth: width - 62 * 2,
                    itemHeight: height - 62 * 2,
                    layout: SwiperLayout.STACK,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, a, b) =>
                                  FunkoPopDetailPage(
                                funkoPops[index],
                              ),
                            ),
                          );
                        },
                        child: Stack(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: _buildBackground(index, width - 62 * 2,
                                  kShopScreenFunkoPopTheme),
                            ),
                            Positioned(
                              bottom: 50,
                              left: 50,
                              child: Image.asset(
                                funkoPops[index].imageUrl,
                                width: 300,
                                height: 300,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, top: 20),
                  child: Text(
                    'Store',
                    style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                  ),
                  child: SizedBox(
                    height: 350,
                    child: ListView.builder(
                      itemCount: storeItems.length,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StoreItemDetailPage(
                                  storeItem: storeItems[index],
                                ),
                              ),
                            );
                          },
                          child: Stack(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                    left: 10, top: 100, right: 10),
                                width: 300,
                                height: 250,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        storeItems[index].bgBeginColor,
                                        storeItems[index].bgEndColor,
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 100,
                                left: 70,
                                child: Image.asset(
                                  storeItems[index].itemImageUrl,
                                  fit: BoxFit.contain,
                                  height: 250,
                                  width: 250,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 35,
                                  top: 126,
                                ),
                                width: 250,
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: Stack(
                                  children: <Widget>[
                                    Positioned(
                                      top: 20,
                                      left: 20,
                                      child: Text(
                                        listStoreItem[index].name,
                                        style: kShopScreenItemNameTheme(
                                            storeItems[index].bgBeginColor, 25),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 20,
                                      right: 20,
                                      child: Text(
                                        '\$ ${listStoreItem[index].price}',
                                        style: kShopScreenItemNameTheme(
                                            storeItems[index].bgBeginColor, 25),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    color: Colors.black.withOpacity(0.3),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, LoadingScreen.id);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              margin: EdgeInsets.only(right: 10.0, top: 5),
                              child: Image.asset(
                                  'images/fortnite_commondo_bg.png'),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFF008CCB).withOpacity(0.6),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 10,
                            top: 30,
                            child: Text(
                              'Show Item Shop',
                              style: kShopScreenItemNameTheme(Colors.white, 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackground(int index, double width, TextStyle textStyle) {
    return ClipPath(
      clipper: AppClipper(cornerSize: 25, diagonalHeight: 100),
      child: Container(
        color: funkoPops[index].bgColor,
        width: width,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 160, left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 125,
                    child: Text(
                      funkoPops[index].title,
                      style: textStyle,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              left: 30,
              child: Text(funkoPops[index].price,
                  style: kShopScreenFunkoPopPriceTheme),
            ),
          ],
        ),
      ),
    );
  }
}
