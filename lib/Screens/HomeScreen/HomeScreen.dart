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
    final appBar = AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        'Home',
        style: kMenuScreenItemNameTheme(Colors.black, 25),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.notifications,
            color: Colors.black,
          ),
          onPressed: () {
            print('1');
          },
        ),
      ],
      leading: null,
    );
    return Container(
      child: Scaffold(
        appBar: appBar,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FadeInXCustom(
                  0.5,
                  -50.0,
                  Container(
                    height: (MediaQuery.of(context).size.height -
                            appBar.preferredSize.height) *
                        0.05,
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Stats',
                      style: kHomeScreenNewsTitleTheme(
                        Colors.black,
                        20,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: (MediaQuery.of(context).size.height -
                          appBar.preferredSize.height -
                          MediaQuery.of(context).padding.top) *
                      0.025,
                ),
                FadeInXCustom(
                  0.7,
                  50.0,
                  BuildStats(
                    appBar: appBar,
                  ),
                ),
                SizedBox(
                  height: (MediaQuery.of(context).size.height -
                          appBar.preferredSize.height -
                          MediaQuery.of(context).padding.top) *
                      0.025,
                ),
                FadeInYCustom(
                  0.5,
                  -50.0,
                  Container(
                    height: (MediaQuery.of(context).size.height -
                            appBar.preferredSize.height -
                            MediaQuery.of(context).padding.top) *
                        0.05,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 80,
                          child: Divider(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 10),
                        FittedBox(
                          child: Text(
                            'Get Ready For',
                            style: kMenuScreenItemNameTheme(
                              Colors.black,
                              15,
                            ),
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
                ),
                SizedBox(
                  height: (MediaQuery.of(context).size.height -
                          appBar.preferredSize.height -
                          MediaQuery.of(context).padding.top) *
                      0.025,
                ),
                FadeInXCustom(
                  0.5,
                  -50.0,
                  Container(
                    height: (MediaQuery.of(context).size.height -
                            MediaQuery.of(context).padding.bottom - appBar.preferredSize.height) *
                        0.5,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 10),
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
  final AppBar appBar;
  const BuildStats({
    Key key,
    this.appBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.height -
              appBar.preferredSize.height -
              MediaQuery.of(context).padding.top) *
          0.2,
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
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      height: constraints.maxHeight,
                      width: 200,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: (listGamesPlayed[index].color),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: listGamesPlayed[index].color,
                              blurRadius: 10,
                            )
                          ]),
                      child: Center(
                        child: Container(
                          height: constraints.maxHeight / 2,
                          width: 150,
                          child: Image.asset(listGamesPlayed[index].imageUrl),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}