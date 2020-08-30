import 'package:arena/Animations/FadeInXCustom.dart';
import 'package:arena/Animations/FadeInYCustom.dart';
import 'package:arena/Utilities/ProfileGamesPlayed.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBoardProfile extends StatelessWidget {
  final Duration duration;

  const DashBoardProfile({
    Key key,
    this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      animationDuration: duration,
      elevation: 10,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/bgImage.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: GestureDetector(
                      child: Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 25,
                      ),
                      onTap: () {},
                    ),
                  ),
                  FadeInYCustom(1,-50, Center(
                      child: Container(
                        margin: EdgeInsets.only(
                          top: 70.0,
                        ),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('images/bgProfile.jpg'),
                            fit: BoxFit.fill,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              blurRadius: 30.0,
                              spreadRadius: 5.0,
                              offset: Offset(10.0, 10.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    children: <Widget>[
                      FadeInYCustom(1.2,-50,  Center(
                          child: Text(
                            'Krypton',
                            style: GoogleFonts.nunito(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FadeInYCustom(1.4,-50, Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  color: Colors.pinkAccent,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25.0),
                                  ),
                                ),
                                child: Text(
                                  'Gamer',
                                  style: GoogleFonts.nunito(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25.0),
                                  ),
                                ),
                                child: Text(
                                  'Admin',
                                  style: GoogleFonts.nunito(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FadeInYCustom(1.6,-50,  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 90,
                              child: Divider(
                                color: Colors.black,
                                thickness: 0.4,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Games',
                              style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                            SizedBox(width: 5),
                            Container(
                              width: 90,
                              child: Divider(
                                color: Colors.black,
                                thickness: 0.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Expanded(
                        flex: 1,
                        child: FadeInXCustom(1.8,50,  GridView.count(
                            physics: BouncingScrollPhysics(),
                            crossAxisCount: 2,
                            childAspectRatio: 11 / 7,
                            children: listGamesPlayed
                                .map(
                                  (item) => Container(
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: item.color,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                        Center(
                                          child: Container(
                                            height: 100,
                                            width: 100,
                                            child: Image.asset(item.imageUrl),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
