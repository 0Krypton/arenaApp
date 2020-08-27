import 'dart:math';

import 'package:arena/Screens/TopScreen/TopScreenPlayers.dart';
import 'package:arena/Screens/TopScreen/TopScreenPlayersProvider.dart';
import 'package:arena/Themes/TextTheme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TopScreen extends StatefulWidget {
  @override
  _TopScreenState createState() => _TopScreenState();
}

class _TopScreenState extends State<TopScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (_) => TopScreenPlayersProvider(),
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Consumer<TopScreenPlayersProvider>(
                builder: (context, playerProvider, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              top: 60,
                              right: 20,
                              left: 20,
                            ),
                            width: MediaQuery.of(context).size.width,
                            height: 300,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withAlpha(50),
                                  blurRadius: 15,
                                  offset: Offset(10, -10),
                                ),
                              ],
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFFFF0099),
                                  Color(0xFF0F0478),
                                ],
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 100),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xFF00FF4C),
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          'Wins',
                                          style: kTopScreenTextTheme(
                                            Colors.white,
                                            15,
                                            FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 20),
                                    Row(
                                      children: [
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xFFAB00FF),
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          'Kills',
                                          style: kTopScreenTextTheme(
                                            Colors.white,
                                            15,
                                            FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 20),
                                    Row(
                                      children: [
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xFF00CBFF)),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          'K/D',
                                          style: kTopScreenTextTheme(
                                            Colors.white,
                                            15,
                                            FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 0,
                            child: Container(
                              height: 120,
                              width: 120,
                              margin: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width / 3),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF0F0478),
                                    Color(0xFFFF0099),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 70,
                            child: Divider(
                              color: Colors.black.withAlpha(90),
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Top 100',
                            style: kTopScreenTextTheme(
                                Colors.black, 20, FontWeight.bold),
                          ),
                          SizedBox(width: 10),
                          Container(
                            width: 70,
                            child: Divider(
                              color: Colors.black.withAlpha(90),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 30,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            BuildRegionServers(
                              regionName: 'NA-West',
                            ),
                            BuildRegionServers(
                              regionName: 'NA-East',
                            ),
                            BuildRegionServers(
                              regionName: 'Iran',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      playerProvider.selectedPlayerRegion != null
                          ? BuildTop100Regions(
                              varSelectedPlayerRegion:
                                  playerProvider.selectedPlayerRegion,
                            )
                          : Center(
                              child: Text(
                                'Select a region',
                                style: kTopScreenTextTheme(
                                  Colors.black,
                                  25,
                                  FontWeight.bold,
                                ),
                              ),
                            ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BuildTop100Regions extends StatelessWidget {
  const BuildTop100Regions({
    Key key,
    this.varSelectedPlayerRegion,
  }) : super(key: key);

  final List<PlayerStats> varSelectedPlayerRegion;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 160,
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: varSelectedPlayerRegion.length,
            itemBuilder: (context, index) {
              PlayerStats playerStats = varSelectedPlayerRegion[index];
              return Container(
                height: 120,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(50),
                      blurRadius: 15,
                      offset: Offset(5, -5),
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                margin:
                    EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 10),
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Stack(
                  children: [
                    Positioned(
                      top: 30,
                      left: 10,
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(50),
                              blurRadius: 15,
                              offset: Offset(0, 5),
                            ),
                          ],
                          color: Colors.white,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: playerStats.urlImage == null
                                ? AssetImage('images/profile_person.jpg')
                                : AssetImage(playerStats.urlImage),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      child: Text(
                        playerStats.rank,
                        style: GoogleFonts.ptSansNarrow(
                          color: Color(0xFFECECEC),
                          fontSize: 90,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 30,
                      left: 85,
                      child: Text(
                        playerStats.playerName,
                        style: kTopScreenTextTheme(
                          Colors.black,
                          15,
                          FontWeight.w700,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 90,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            transform: Matrix4.rotationZ(pi / 4),
                            color: Color(0xFF00E5FF),
                            width: 10,
                            height: 10,
                          ),
                          Text(
                            playerStats.clan,
                            style: kTopScreenTextTheme(
                              Colors.black,
                              15,
                              FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 85,
                      left: 90,
                      child: Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.trophy,
                            size: 15,
                            color: Color(0xFFC0CC11),
                          ),
                          SizedBox(width: 10),
                          Text(playerStats.wins.toString()),
                          SizedBox(width: 50),
                          Icon(
                            FontAwesomeIcons.dollarSign,
                            size: 15,
                            color: Color(0xFF009D10),
                          ),
                          SizedBox(width: 2),
                          Text(playerStats.earning),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}

class BuildRegionServers extends StatelessWidget {
  const BuildRegionServers({
    this.regionName,
    Key key,
  }) : super(key: key);

  final String regionName;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: () {
          Provider.of<TopScreenPlayersProvider>(context, listen: false)
              .setPlayerRegion(regionName);
        },
        child: Container(
          height: 25,
          margin: EdgeInsets.symmetric(horizontal: 5),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Color(0xFFECECEC),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Text(
            regionName,
            style: kTopScreenTextTheme(
              Colors.black,
              12,
              FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
