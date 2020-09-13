import 'package:arena/Screens/ShopScreen/Store_Item_Detail_Page.dart';
import 'package:arena/Themes/TextTheme.dart';
import 'package:arena/Utilities/ShopScreenItemInfo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShopItemCard extends StatelessWidget {
  final ShopScreenItemInfo items;
  final double offset;
  const ShopItemCard({
    Key key,
    @required this.items,
    @required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 8, right: 8, bottom: 24),
      elevation: 10,
      shadowColor: items.color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32)), //<--custom shape
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
            child: Stack(
              children: [
                Image.asset(
                  items.bgImage,
                  height: 250,
                  width: 600,
                  alignment: Alignment(-offset, 0),
                  fit: BoxFit.none,
                ),
                Container(
                  height: 250,
                  width: 450,
                  color: items.color.withOpacity(0.3) ??
                      Colors.white54.withOpacity(0.5),
                ),
                Positioned(
                  top: 50,
                  right: 0,
                  child: Image.asset(
                    items.bgSkinImage,
                    height: 250,
                    width: 250,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Expanded(
            child: CardContent(
              itemInfo: items,
            ),
          ),
        ],
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  final ShopScreenItemInfo itemInfo;

  const CardContent({
    Key key,
    @required this.itemInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      itemInfo.title ?? '',
                      style: kShopScreenStoreTextTheme(
                        itemInfo.color ?? Colors.black,
                        18,
                        FontWeight.w900,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>StoreItemDetailPage(storeItem: itemInfo,),),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: itemInfo.color ?? Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                          child: Icon(
                        FontAwesomeIcons.getPocket,
                        color: Colors.white,
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Row(
              children: [
                Text(
                  '${itemInfo.itemCount} Items' ?? '',
                  style: kShopScreenStoreTextTheme(
                    itemInfo.color,
                    20,
                    FontWeight.bold,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.dollarSign,
                      color: itemInfo.color,
                      size: 15,
                    ),
                    Text(itemInfo.off ? '${itemInfo.offPrice ?? 's'}' : ''),
                    Text(
                      '${itemInfo.price}' ?? '',
                      style: kShopScreenStoreTextTheme(
                        itemInfo.color,
                        18,
                        FontWeight.bold,
                      ).copyWith(
                        decoration:
                            itemInfo.off ? TextDecoration.lineThrough : null,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 25),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
