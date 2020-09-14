import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyItemsScreen extends StatefulWidget {
  MyItemsScreen({this.itemData});

  final itemData;

  @override
  _MyItemsScreenState createState() => _MyItemsScreenState();
}

class _MyItemsScreenState extends State<MyItemsScreen> {
  List<dynamic> dailyItemList = [];
  List<dynamic> featuredItemList = [];

  @override
  void initState() {
    super.initState();

    updateUI(widget.itemData);
  }

  void updateUI(dynamic itemData) {

    dailyItemList = itemData['daily'];
    featuredItemList = itemData['featured'];
  }

//  ItemCard(url: dailyItemList[0]['full_background']),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          //#131339
          color: Color(0xFF131339),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 30.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Item Shop',
                        style: GoogleFonts.acme(
                            color: Colors.white, fontSize: 40.0),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                ItemShop(typeItemList: dailyItemList),
                Container(
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF2C2B5F),
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 50.0),
                        child: Text(
                          'Featured Items',
                          style: GoogleFonts.acme(
                              fontSize: 20.0, color: Colors.white),
                        ),
                      ),
                      Container(
                        height: 500,
                        padding: const EdgeInsets.only(left: 32),
                        child: Container()
//                         Swiper(
//                           itemCount: featuredItemList.length,
//                           itemWidth: MediaQuery.of(context).size.width - 2 * 64,
//                           layout: SwiperLayout.STACK,
// //                  pagination: SwiperPagination(
// //                    builder: DotSwiperPaginationBuilder(activeSize: 10, space: 5),
// //                  ),
//                           itemBuilder: (context, index) {
//                             return Stack(
//                               children: <Widget>[
//                                 Column(
//                                   children: <Widget>[
//                                     SizedBox(height: 100),
//                                     Card(
//                                       elevation: 8,
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(32),
//                                       ),
//                                       color: Color(0xFF434285),
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(32.0),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.stretch,
//                                           children: <Widget>[
//                                             SizedBox(height: 100),
//                                             Text(
//                                               featuredItemList[index]['name'],
//                                               style: GoogleFonts.acme(
//                                                   fontSize: 20.0,
//                                                   color: Colors.white),
//                                               textAlign: TextAlign.left,
//                                             ),
//                                             Padding(
//                                               padding: EdgeInsets.only(
//                                                   top: 20.0,
//                                                   left: 8.0,
//                                                   right: 8.0),
//                                               child: Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: <Widget>[
//                                                   Text(
//                                                     '${featuredItemList[index]['price']}',
//                                                     style: GoogleFonts.acme(
//                                                         fontSize: 20.0,
//                                                         color: Colors.white),
//                                                     textAlign: TextAlign.left,
//                                                   ),
//                                                   Text(
//                                                     featuredItemList[index]
//                                                         ['type'],
//                                                     style: GoogleFonts.acme(
//                                                         fontSize: 25.0,
//                                                         color: Colors.white),
//                                                     textAlign: TextAlign.left,
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: <Widget>[
//                                     Container(
//                                       child: Image.network(
//                                           featuredItemList[index]['image']),
//                                       width: 220,
//                                       height: 220,
//                                     ),
//                                   ],
//                                 )
//                               ],
//                             );
//                           },
//                         ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
//      Container(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.center,
//          children: <Widget>[
//          ],
//        ),
//      ),
    );
  }
}

class ItemShop extends StatelessWidget {
  const ItemShop({
    Key key,
    @required this.typeItemList,
  }) : super(key: key);

  final List typeItemList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Color(0xFF2C2B5F),
        borderRadius: BorderRadius.circular(32.0),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 50.0),
            child: Text(
              'Daily Items',
              style: GoogleFonts.acme(fontSize: 20.0, color: Colors.white),
            ),
          ),
          Container(
            height: 500,
            padding: const EdgeInsets.only(left: 32),
            child: Container()
//             Swiper(
//               itemCount: typeItemList.length,
//               itemWidth: MediaQuery.of(context).size.width - 2 * 64,
//               layout: SwiperLayout.STACK,
// //                  pagination: SwiperPagination(
// //                    builder: DotSwiperPaginationBuilder(activeSize: 10, space: 5),
// //                  ),
//               itemBuilder: (context, index) {
//                 return Stack(
//                   children: <Widget>[
//                     Column(
//                       children: <Widget>[
//                         SizedBox(height: 100),
//                         Card(
//                           elevation: 8,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(32),
//                           ),
//                           color: Color(0xFF434285),
//                           child: Padding(
//                             padding: const EdgeInsets.all(32.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.stretch,
//                               children: <Widget>[
//                                 SizedBox(height: 100),
//                                 Text(
//                                   typeItemList[index]['name'],
//                                   style: GoogleFonts.acme(
//                                       fontSize: 20.0, color: Colors.white),
//                                   textAlign: TextAlign.left,
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                       top: 20.0, left: 8.0, right: 8.0),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: <Widget>[
//                                       Text(
//                                         '${typeItemList[index]['price']}',
//                                         style: GoogleFonts.acme(
//                                             fontSize: 20.0,
//                                             color: Colors.white),
//                                         textAlign: TextAlign.left,
//                                       ),
//                                       Text(
//                                         typeItemList[index]['type'],
//                                         style: GoogleFonts.acme(
//                                             fontSize: 25.0,
//                                             color: Colors.white),
//                                         textAlign: TextAlign.left,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         ItemImage(
//                           typeItemList: typeItemList,
//                           index: index,
//                         ),
// //                        Container(
// //                          child: Image.network(
// //                              typeItemList[index]['image']),
// //                          width: 200,
// //                          height: 200,
// //                        ),
//                       ],
//                     )
//                   ],
//                 );
//               },
//             ),
          ),
        ],
      ),
    );
  }
}

class ItemImage extends StatelessWidget {
  const ItemImage({Key key, @required this.typeItemList, @required this.index})
      : super(key: key);

  final List typeItemList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(typeItemList[index]['image']),
      width: 200,
      height: 200,
    );
  }
}

class ItemCard extends StatelessWidget {
  final String url;

  const ItemCard({Key key, @required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      color: Colors.transparent,
      child: Container(
        height: 250.0,
        width: 250.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(url),
          ),
        ),
      ),
    );
  }
}
