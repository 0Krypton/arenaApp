import 'package:arena/Colors/colors.dart';
import 'package:arena/Themes/TextTheme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'ShopScreenItemProvider.dart';

class CartScreen extends StatefulWidget {
  static const id = 'CartScreen';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Consumer<ShopScreenItemProvider>(
          builder: (context, provider, child) {
            var inCartItems = provider.inCart;
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: !inCartItems.isEmpty
                        ? ListView.builder(
                            itemCount: inCartItems.length,
                            itemBuilder: (context, index) {
                              return Dismissible(
                                key: ValueKey(inCartItems[index].title),
                                direction: DismissDirection.endToStart,
                                onDismissed: (d) {
                                  provider.removeInCartItem(
                                      inCartItems[index].title);
                                },
                                background: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  color: Colors.red,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: inCartItems[index]
                                        .color
                                        .withOpacity(0.2),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                  child: ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 15,
                                    ),
                                    leading: Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: inCartItems[index]
                                            .color
                                            .withOpacity(0.5),
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage(
                                            inCartItems[index].bgSkinImage,
                                          ),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    title: Text(
                                      "${inCartItems[index].title}   x${inCartItems[index].length}",
                                      style: kShopScreenStoreTextTheme(
                                        inCartItems[index].color,
                                        15,
                                        FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Text(
                                      inCartItems[index].desc,
                                      softWrap: true,
                                      style: kShopScreenStoreTextTheme(
                                        inCartItems[index].color,
                                        12,
                                        FontWeight.bold,
                                      ),
                                    ),
                                    trailing: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.cartPlus,
                                          size: 15,
                                          color: inCartItems[index].color,
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          '\$ ${inCartItems[index].price}',
                                          style: kSearchScreenTextTheme(
                                            inCartItems[index].color,
                                            12,
                                            FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        : Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 30),
                            child: Text(
                              'There isn\'t any Item !!!',
                              style: kShopScreenStoreTextTheme(
                                  Colors.black, 20, FontWeight.bold),
                            ),
                          ),
                  ),
                  Positioned(
                    right: 10,
                    left: 10,
                    bottom: 10,
                    child: Container(
                      height: 70,
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Colors.blue[800],
                          width: 2,
                        ),
                        gradient: LinearGradient(
                          colors: [
                            kGradientBegin,
                            kGradientEnd,
                          ],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Enroll Now',
                          style: kShopScreenStoreTextTheme(
                              Colors.white, 25, FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
