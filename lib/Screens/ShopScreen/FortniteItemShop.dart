import 'package:arena/Themes/TextTheme.dart';
import 'package:flutter/material.dart';

class FortniteItemShop extends StatefulWidget {
  final itemData;

  const FortniteItemShop({Key key, this.itemData}) : super(key: key);

  @override
  _FortniteItemShopState createState() => _FortniteItemShopState();
}

class _FortniteItemShopState extends State<FortniteItemShop> {
  List<dynamic> dailyItemList = [];
  List<dynamic> featuredItemList = [];
  List<dynamic> specialFeaturedItemList = [];
  List<dynamic> specialDailyItemList = [];
  List<dynamic> communityItemList = [];
  List<dynamic> offersItemList = [];

  @override
  void initState() {
    super.initState();
    updateUI(widget.itemData);
  }

  void updateUI(dynamic itemData) {
    dailyItemList = itemData['daily'];
    featuredItemList = itemData['featured'];
    specialFeaturedItemList = itemData['specialFeatured'];
    specialDailyItemList = itemData['specialDaily'];
    communityItemList = itemData['community'];
    offersItemList = itemData['offers'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Item Shop',
          style: kShopScreenItemNameTheme(Colors.black, 20),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          margin: EdgeInsets.symmetric(vertical: 40),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8.0,top: 30),
                child: Text(
                  dailyItemList.length == 0 ? '' : 'Daily Items',
                  style: kShopScreenItemNameTheme(Colors.black, 20),
                ),
              ),
              SizedBox(height: dailyItemList.length == 0 ? 0 : 10),
              dailyItemList.length == 0
                  ? SizedBox(height: 0)
                  : ItemList(list: dailyItemList),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: Text(
                  featuredItemList.length == 0 ? '' : 'Featured Items',
                  style: kShopScreenItemNameTheme(Colors.black, 20),
                ),
              ),
              SizedBox(height: featuredItemList.length == 0 ? 0 : 10),
              featuredItemList.length == 0
                  ? SizedBox(height: 0)
                  : ItemList(list: featuredItemList),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: Text(
                    specialFeaturedItemList.length == 0
                        ? ''
                        : 'Special Featured Items',
                    style: kShopScreenItemNameTheme(Colors.black, 20)),
              ),
              SizedBox(height: specialFeaturedItemList.length == 0 ? 0 : 10),
              specialFeaturedItemList.length == 0
                  ? SizedBox(height: 0)
                  : ItemList(list: specialFeaturedItemList),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  specialDailyItemList.length == 0 ? '' : 'Special Daily Items',
                  style: kShopScreenItemNameTheme(Colors.black, 20),
                ),
              ),
              SizedBox(height: specialDailyItemList.length == 0 ? 0 : 10),
              dailyItemList.length == 0
                  ? SizedBox(
                      height: 0,
                    )
                  : ItemList(list: specialDailyItemList),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  communityItemList.length == 0 ? '' : 'Community Items',
                  style: kShopScreenItemNameTheme(Colors.black, 20),
                ),
              ),
              SizedBox(height: communityItemList.length == 0 ? 0 : 10),
              communityItemList.length == 0
                  ? SizedBox(height: 0)
                  : ItemList(list: communityItemList),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  offersItemList.length == 0 ? '' : 'Offers Items',
                  style: kShopScreenItemNameTheme(Colors.black, 20),
                ),
              ),
              SizedBox(
                height: offersItemList.length == 0 ? 0 : 10,
              ),
              offersItemList.length == 0
                  ? SizedBox(height: 0)
                  : ItemList(list: offersItemList),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  const ItemList({
    Key key,
    @required this.list,
  }) : super(key: key);

  final List list;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
        child: GridView.count(
    crossAxisCount: 3,
    childAspectRatio: 1,
    children: list
        .map(
          (item) => Image.network(item['full_background']),
        )
        .toList(),
        ),
      );
  }
}
