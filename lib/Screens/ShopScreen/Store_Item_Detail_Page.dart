import 'package:arena/Animations/FadeInXCustom.dart';
import 'package:arena/Animations/FadeInYCustom.dart';
import 'package:arena/Animations/fadeInX.dart';
import 'package:arena/Animations/fadeInY.dart';
import 'package:arena/Themes/TextTheme.dart';
import 'package:arena/Utilities/StoreItemDetail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StoreItemDetailPage extends StatelessWidget {
  final Store storeItem;

  const StoreItemDetailPage({Key key, this.storeItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            storeItem.bgEndColor,
            storeItem.bgBeginColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Details',
            style: GoogleFonts.nunito(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w700
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: -20,
                  child: FadeInYCustom(1,50.0, Container(
                      width: 400,
                      height: 450,
                      padding: EdgeInsets.all(20),
                      child: Image.asset(
                        storeItem.itemImageUrl,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 200, bottom: 20),
                        padding: EdgeInsets.symmetric(
                          vertical: 30,
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width - 2 * 20,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              FadeInYCustom(1.2,40,Center(
                                  child: Text(
                                    storeItem.name,
                                    style: kShopScreenItemNameTheme(
                                        storeItem.bgBeginColor, 40),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              FadeInXCustom(1.2,-50, Text(
                                  '${storeItem.itemCount} Items :',
                                  style: kShopScreenItemNameTheme(
                                      storeItem.bgBeginColor, 25),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              FadeInXCustom(1.4,-50, Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Text(
                                    storeItem.description,
                                    style: kShopScreenItemNameTheme(
                                        storeItem.bgBeginColor, 25),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              FadeInXCustom(1.6,-50,Text(
                                  'Price :   \$ ${storeItem.price}',
                                  style: kShopScreenItemNameTheme(
                                      storeItem.bgBeginColor, 25),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        padding: EdgeInsets.symmetric(vertical: 20),
                        height: 60,
                        width: MediaQuery.of(context).size.width - 2 * 20,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Add to Cart',
                              style: kShopScreenItemNameTheme(
                                storeItem.bgBeginColor,
                                20,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
