import 'package:arena/Themes/TextTheme.dart';
import 'package:arena/Utilities/FunkoPopDetail.dart';
import 'package:flutter/material.dart';

import 'Funko_Pop_Detail_Page.dart';

class SlidingCard extends StatelessWidget {
  final FunkoPopDetail funkoPop;
  final double offset;
  const SlidingCard({
    Key key,
    @required this.funkoPop,
    @required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 8, right: 8, bottom: 24),
      elevation: 8,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32)), //<--custom shape
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
            child: Stack(
              children: [
                Image.asset(
                  funkoPop.bgImageUrl,
                  height: 250,
                  width: 600,
                  alignment: Alignment(-offset, 0),
                  fit: BoxFit.none,
                ),
                Container(
                  height: 250,
                  width: 450,
                  color: funkoPop.bgColor.withOpacity(0.4),
                ),
                Positioned(
                  top: 50,
                  child: Image.asset(
                    funkoPop.bgUpperImageUrl,
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
              funkoPop: funkoPop,
            ),
          ),
        ],
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  final FunkoPopDetail funkoPop;

  const CardContent({
    Key key,
    @required this.funkoPop,
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
                      funkoPop.title ?? '',
                      style: kShopScreenFunkoPopTheme.copyWith(
                          color: Colors.black, fontSize: 15),
                    ),
                  ),
                  Spacer(),
                  Text(
                    '\$ ${funkoPop.price.toString()}' ?? '',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Text(
              funkoPop.desc ?? '',
              style: kShopScreenFunkoPopTheme.copyWith(
                  color: Colors.grey, fontSize: 14),
            ),
          ),
          Spacer(),
          Flexible(
            child: Row(
              children: <Widget>[
                SizedBox(width: 20),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0, top: 10),
                    child: Text(funkoPop.date ?? '',
                        style: kShopScreenFunkoPopTheme.copyWith(
                            color: Colors.black, fontSize: 14)),
                  ),
                ),
                Spacer(),
                RaisedButton(
                  color: funkoPop.bgColor ?? Colors.black,
                  child: Text('Show Detail'),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, a, b) => FunkoPopDetailPage(funkoPop),
                      ),
                    );
                  },
                ),
                SizedBox(width: 10),
              ],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
