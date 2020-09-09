import 'package:arena/Animations/FadeInXCustom.dart';
import 'package:arena/Animations/FadeInYCustom.dart';
import 'package:arena/Themes/TextTheme.dart';
import 'package:arena/Utilities/ShopScreenItemInfo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StoreItemDetailPage extends StatelessWidget {
  final ShopScreenItemInfo storeItem;

  const StoreItemDetailPage({Key key, this.storeItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Details',
            style: GoogleFonts.nunito(
                color: storeItem.color,
                fontSize: 20,
                fontWeight: FontWeight.w900),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: storeItem.color,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.white24,
                  margin:
                      EdgeInsets.only(top: 30, bottom: 20, left: 30, right: 30),
                  width: MediaQuery.of(context).size.width - 2 * 20,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FadeInYCustom(
                          1.2,
                          40,
                          Text(
                            storeItem.title,
                            style:
                                kShopScreenItemNameTheme(storeItem.color, 30),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FadeInXCustom(
                          1.2,
                          -50,
                          Text(
                            '${storeItem.itemCount} ${storeItem.desc}',
                            style:
                                kShopScreenItemNameTheme(storeItem.color, 25),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        FadeInXCustom(
                          1.7,
                          50,
                          SizedBox(
                            height: 250,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: storeItem.itemsImage.length,
                              itemBuilder: (context, index) {
                                return AspectRatio(
                                  aspectRatio: 1,
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(left: 10, right: 10),
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          storeItem.itemsImage[index],
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        FadeInXCustom(
                          1.6,
                          -50,
                          Text(
                            'Price :   \$ ${storeItem.price}',
                            style:
                                kShopScreenItemNameTheme(storeItem.color, 25),
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
                    color: storeItem.color,
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
                          Colors.white,
                          20,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
