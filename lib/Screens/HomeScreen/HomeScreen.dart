import 'package:arena/Animations/FadeInXCustom.dart';
import 'package:arena/Animations/FadeInYCustom.dart';
import 'package:arena/Animations/fadeInX.dart';
import 'package:arena/Animations/fadeInY.dart';
import 'package:arena/Colors/colors.dart';
import 'package:arena/Screens/ExploreScreen/ExploreScreenProvider.dart';
import 'package:arena/Screens/HomeScreen/FortniteStatsScreen.dart';
import 'package:arena/Themes/TextTheme.dart';
import 'package:arena/Utilities/NewsDetail.dart';
import 'package:arena/Utilities/ProfileGamesPlayed.dart';
import 'package:arena/Utilities/TournumentDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

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
                            MediaQuery.of(context).padding.bottom -
                            appBar.preferredSize.height) *
                        0.5,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: FutureBuilder(
                      future: Provider.of<ExploreScreenProvider>(context,
                              listen: false)
                          .fetchEnteredTournouments(),
                      builder: (context, snapShot) {
                        if (snapShot.hasError) {
                          return Center(
                            child: Text(
                              'Go to Explorer and Join to the one of our Tournouments xD',
                              style: kSearchScreenTextTheme(
                                Colors.black,
                                20,
                                FontWeight.bold,
                              ),
                            ),
                          );
                        } else if (snapShot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: Container(
                              child: Column(
                                children: [
                                  Text(
                                    'Loading...',
                                    style: kSearchScreenTextTheme(
                                      Colors.black,
                                      20,
                                      FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SpinKitCircle(
                                    size: 50,
                                    color: kGradientEnd,
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else if (snapShot.connectionState ==
                            ConnectionState.done) {
                          return Container(
                            padding: EdgeInsets.only(
                              left: 10,
                              right: 10,
                              top: 15,
                              bottom: 5,
                            ),
                            width: MediaQuery.of(context).size.width,
                            child: Consumer<ExploreScreenProvider>(
                              builder: (context, list, child) {
                                return ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  itemCount: list.enteredTours.length,
                                  itemBuilder: (context, index) {
                                    return list.enteredTours.length == 0
                                        ? Text('Oops')
                                        : ListTile(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              vertical: 10,
                                              horizontal: 15,
                                            ),
                                            leading: Container(
                                              height: 80,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                color: list
                                                    .enteredTours[index].bgColor
                                                    .withOpacity(0.5),
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                    list.enteredTours[index]
                                                        .imageUrl,
                                                  ),
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                            title: Text(
                                              list.enteredTours[index].title,
                                              style: kHomeScreenNewsTitleTheme(
                                                list.enteredTours[index]
                                                    .bgColor,
                                                15,
                                              ),
                                            ),
                                            subtitle: Text(
                                              list.enteredTours[index]
                                                  .description,
                                              overflow: TextOverflow.fade,
                                              style: kHomeScreenNewsTitleTheme(
                                                list.enteredTours[index]
                                                    .bgColor,
                                                12,
                                              ),
                                            ),
                                            trailing: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  FontAwesomeIcons.trophy,
                                                  size: 15,
                                                  color: list
                                                      .enteredTours[index]
                                                      .bgColor,
                                                ),
                                                SizedBox(height: 5),
                                                Text(
                                                  '\$ ${list.enteredTours[index].prize}',
                                                  style: kSearchScreenTextTheme(
                                                      list.enteredTours[index]
                                                          .bgColor,
                                                      12,
                                                      FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          );
                                  },
                                );
                              },
                            ),
                          );
                        }
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
