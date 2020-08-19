import 'package:arena/Themes/TextTheme.dart';
import 'package:arena/Utilities/FunkoPopDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class FunkoPopDetailPage extends StatefulWidget {
  final FunkoPopDetail funkoPop;
  FunkoPopDetailPage(this.funkoPop);
  @override
  _FunkoPopDetailPageState createState() => _FunkoPopDetailPageState();
}

class _FunkoPopDetailPageState extends State<FunkoPopDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.funkoPop.bgColor,
      appBar: AppBar(
        backgroundColor: widget.funkoPop.bgColor,
        elevation: 0,
        title: Text(
          "Item Details",
          style: TextStyle(color: Colors.white),
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
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * .75,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  padding: EdgeInsets.only(top: 50, left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 300,
                        child: Text(
                          widget.funkoPop.title,
                          style: kShopScreenFunkoPopTheme.copyWith(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w100),
                        ),
                      ),
                      SizedBox(height: 16),
                      _buildRating(),
                      SizedBox(height: 24),
                      Text(
                        "DETAILS",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          widget.funkoPop.price,
                          style: kShopScreenFunkoPopPriceTheme.copyWith(
                              color: Colors.black.withOpacity(0.8),
                              fontSize: 15),
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(
                        "COLOR OPTIONS",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: <Widget>[
                          _buildColorOption(widget.funkoPop.bgColor),
                          // _buildColorOption(Colors.green),
                          // _buildColorOption(Colors.orange),
                          // _buildColorOption(Colors.red),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: _buildBottom(),
            ),
            Positioned(
              left: 110,
              bottom: 90,
              child: Hero(
                tag: widget.funkoPop.tagTitle,
                child: Image.asset(
                  widget.funkoPop.imageUrl,
                  width: MediaQuery.of(context).size.width * .85,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorOption(Color color) {
    return Container(
      width: 20,
      height: 20,
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
    );
  }

  Widget _buildRating() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RatingBar(
          initialRating: widget.funkoPop.rating.toDouble(),
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 20,
          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
        SizedBox(height: 10),
        Text(
          "${widget.funkoPop.remainingOfItem} Remaining",
          style: TextStyle(
            color: Colors.black54,
          ),
        )
      ],
    );
  }

  Widget _buildBottom() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        width: MediaQuery.of(context).size.width - 20,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: widget.funkoPop.bgColor,
              spreadRadius: 3,
              blurRadius: 10,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Price",
                    style: GoogleFonts.nunito(
                        color: Colors.black54, fontWeight: FontWeight.w700)),
                Text(
                  widget.funkoPop.price,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 50,
              ),
              decoration: BoxDecoration(
                color: widget.funkoPop.bgColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: Text(
                "ADD CART",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
