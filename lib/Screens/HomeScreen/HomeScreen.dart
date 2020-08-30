import 'package:arena/Animations/FadeInXCustom.dart';
import 'package:arena/Animations/FadeInYCustom.dart';
import 'package:arena/Animations/fadeInX.dart';
import 'package:arena/Animations/fadeInY.dart';
import 'package:arena/Screens/HomeScreen/FortniteStatsScreen.dart';
import 'package:arena/Themes/TextTheme.dart';
import 'package:arena/Utilities/NewsDetail.dart';
import 'package:arena/Utilities/ProfileGamesPlayed.dart';
import 'package:arena/Utilities/TournumentDetail.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Home',
                        style: kMenuScreenItemNameTheme(Colors.black, 25),
                      ),
                      IconButton(
                        icon: Icon(Icons.notifications),
                        onPressed: () {
                          print('1');
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                FadeInXCustom(
                  0.5,
                  -50.0,
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Stats',
                      style: kHomeScreenNewsTitleTheme(
                        Colors.black,
                        20,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                FadeInXCustom(
                  0.7,
                  50.0,
                  BuildStats(),
                ),
                SizedBox(height: 20),
                FadeInXCustom(
                  0.9,
                  -50.0,
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'News',
                      style: kHomeScreenNewsTitleTheme(
                        Colors.black,
                        20,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                FadeInXCustom(
                  1.1,
                  50.0, BuildNews()),
                SizedBox(height: 25),
                FadeInYCustom(
                  0.5,
                  -50.0,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 80,
                        child: Divider(
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Get Ready For',
                        style: kMenuScreenItemNameTheme(
                          Colors.black,
                          15,
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 80,
                        child: Divider(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                FadeInXCustom(
                  0.5,
                  -50.0,
                  Container(
                    height: ((tournuments.length.toDouble() - 1) * 170),
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: ListView.builder(
                      itemCount: tournuments.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Stack(
                          children: <Widget>[
                            Positioned(
                              left: 20,
                              bottom: 10,
                              child: Image.asset(
                                tournuments[index].imageUrl,
                                fit: BoxFit.contain,
                                width: 120,
                                height: 120,
                              ),
                            ),
                            Container(
                              height: 150,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                color: (tournuments[index].bgColor)
                                    .withOpacity(0.5),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 50,
                              left: 120,
                              child: Text(
                                tournuments[index].title,
                                style: kHomeScreenNewsTitleTheme(
                                  Colors.white,
                                  20,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 110,
                              left: 140,
                              child: Text(
                                'Cost: \$${tournuments[index].cost}',
                                style: kHomeScreenNewsTitleTheme(
                                  Colors.white,
                                  17,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 110,
                              right: 30,
                              child: Text(
                                '${tournuments[index].enteredCount} / ${tournuments[index].totalCount}',
                                style: kHomeScreenNewsTitleTheme(
                                  Colors.white,
                                  17,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
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

class BuildStats extends StatelessWidget {
  const BuildStats({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listGamesPlayed.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Stack(
            children: <Widget>[
              InkWell(
                onTap: () {
                  if (index == 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return (FortniteStatsScreen(
                            color: listGamesPlayed[index].color,
                          ));
                        },
                      ),
                    );
                  }
                  print("$index");
                },
                child: Container(
                  height: 150,
                  width: 270,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: (listGamesPlayed[index].color),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: Container(
                      height: 100,
                      width: 150,
                      child: Image.asset(listGamesPlayed[index].imageUrl),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class BuildNews extends StatelessWidget {
  const BuildNews({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: newsList.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Stack(
            children: <Widget>[
              (newsList[index].isUpperBg == false)
                  ? Container(
                      height: 150,
                      width: 270,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: (newsList[index].bgColor),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 0,
                      width: 0,
                    ),
              Positioned(
                right: 25,
                child: Container(
                  height: 150,
                  child: Image.asset(
                    newsList[index].imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              newsList[index].isUpperBg
                  ? Container(
                      height: 150,
                      width: 270,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: (newsList[index].bgColor).withOpacity(0.65),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    )
                  : SizedBox(height: 0, width: 0),
              Positioned(
                left: 30,
                top: 20,
                child: Text(
                  newsList[index].title,
                  style: kHomeScreenNewsTitleTheme(Colors.white, 20),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
