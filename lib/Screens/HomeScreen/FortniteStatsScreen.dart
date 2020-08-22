import 'package:arena/Themes/TextTheme.dart';
import 'package:arena/services/fortnite_stats_api.dart';
import 'package:flutter/material.dart';

class FortniteStatsScreen extends StatefulWidget {
  final Color color;

  const FortniteStatsScreen({Key key, this.color}) : super(key: key);
  @override
  _FortniteStatsScreenState createState() => _FortniteStatsScreenState();
}

class _FortniteStatsScreenState extends State<FortniteStatsScreen> {
  String url = 'https://api.fortnitetracker.com/v1/profile';
  String platform;
  String userId;

  final _formUserId = GlobalKey<FormState>();
  final _formPlatform = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  var stats;
  var epicUserId = 'UserName';
  var soloStats;
  var dousStats;
  var squadStats;
  var soloCurrentSeasonStats;
  var dousCurrentSeasonStats;
  var squadCurrentSeasonStats;
  var lifeTimeStats;
  List<StatPicker> statsList = [];
  LifeTimeStatPicker lifeTimeStatPicker;

  fetchData() async {
    try {
      FortniteStats status =
          FortniteStats(userId: userId, platform: 'pc', url: url);
      stats = await status.getStats();
    } catch (e) {
      return _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('Invalid UserName or Platform'),
        ),
      );
    }
    /////////////////////////////////////////
    try {
      lifeTimeStats = stats['lifeTimeStats'];
      lifeTimeStatPicker = LifeTimeStatPicker(
        score: lifeTimeStats[6]['value'],
        wins: lifeTimeStats[8]['value'],
        kills: lifeTimeStats[10]['value'],
        kd: lifeTimeStats[11]['value'],
      );
    } catch (e) {
      return _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('There isn\'t any LifeTimeStats'),
        ),
      );
    }
    print(lifeTimeStatPicker.kd);
    /////////////////////////////////////////
    setState(() {
      epicUserId = stats['epicUserHandle'];
    });
    /////////////////////////////////////////
    try {
      soloStats = stats['stats']['p2'];
      statsList.add(
        StatPicker(
          mode: 'Solo',
          trnRatingRank: soloStats['trnRating']['rank'],
          trnRatingValue: soloStats['trnRating']['value'],
          scoreValue: soloStats['score']['value'],
          kdValue: soloStats['kd']['value'],
          killsValue: soloStats['kills']['value'],
          wins: soloStats['top1']['value'],
        ),
      );
    } catch (e) {
      return _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('There Isn\'t any Solo Stats'),
        ),
      );
    }
    /////////////////////////////////////////
    try {
      dousStats = stats['stats']['p10'];
      statsList.add(
        StatPicker(
          mode: 'Dous',
          trnRatingRank: dousStats['trnRating']['rank'],
          trnRatingValue: dousStats['trnRating']['value'],
          scoreValue: dousStats['score']['value'],
          kdValue: dousStats['kd']['value'],
          killsValue: dousStats['kills']['value'],
          wins: dousStats['top1']['value'],
        ),
      );
    } catch (e) {
      return _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('There isn\'t any Dous Stats'),
        ),
      );
    }
    print(statsList[1].wins);
    /////////////////////////////////////////
    try {
      squadStats = stats['stats']['p9'];
      statsList.add(
        StatPicker(
          mode: 'Squad',
          trnRatingRank: squadStats['trnRating']['rank'],
          trnRatingValue: squadStats['trnRating']['value'],
          scoreValue: squadStats['score']['value'],
          kdValue: squadStats['kd']['value'],
          killsValue: squadStats['kills']['value'],
          wins: squadStats['top1']['value'],
        ),
      );
    } catch (e) {
      return _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('There isn\'t any Squad Stat'),
        ),
      );
    }
    print(statsList[2].wins);
    /////////////////////////////////////////
    try {
      soloCurrentSeasonStats = stats['stats']['curr_p2'];
      statsList.add(
        StatPicker(
          mode: 'Solo Current Season',
          trnRatingRank: soloCurrentSeasonStats['trnRating']['rank'],
          trnRatingValue: soloCurrentSeasonStats['trnRating']['value'],
          scoreValue: soloCurrentSeasonStats['score']['value'],
          kdValue: soloCurrentSeasonStats['kd']['value'],
          killsValue: soloCurrentSeasonStats['kills']['value'],
          wins: soloCurrentSeasonStats['top1']['value'],
        ),
      );
    } catch (e) {
      return _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('There isn\'t any Solo Stats in This Season'),
        ),
      );
    }
    print(statsList[3].wins);
    /////////////////////////////////////////
    try {
      dousCurrentSeasonStats = stats['stats']['curr_p10'];
      statsList.add(
        StatPicker(
          mode: 'Dous Current Season',
          trnRatingRank: dousCurrentSeasonStats['trnRating']['rank'],
          trnRatingValue: dousCurrentSeasonStats['trnRating']['value'],
          scoreValue: dousCurrentSeasonStats['score']['value'],
          kdValue: dousCurrentSeasonStats['kd']['value'],
          killsValue: dousCurrentSeasonStats['kills']['value'],
          wins: dousCurrentSeasonStats['top1']['value'],
        ),
      );
    } catch (e) {
      return _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('There isn\'t any Dous Stats in This Season'),
        ),
      );
    }
    print(statsList[4].wins);
    /////////////////////////////////////////
    try {
      squadCurrentSeasonStats = stats['stats']['curr_p9'];
      statsList.add(
        StatPicker(
          mode: 'Squad Current Season',
          trnRatingRank: squadCurrentSeasonStats['trnRating']['rank'],
          trnRatingValue: squadCurrentSeasonStats['trnRating']['value'],
          scoreValue: squadCurrentSeasonStats['score']['value'],
          kdValue: squadCurrentSeasonStats['kd']['value'],
          killsValue: squadCurrentSeasonStats['kills']['value'],
          wins: squadCurrentSeasonStats['top1']['value'],
        ),
      );
    } catch (e) {
      return _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('There isn\'t any Squad Stats in This Season'),
        ),
      );
    }
    print(statsList[5].wins);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      home: Scaffold(
        key: _scaffoldKey,
        backgroundColor: widget.color,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Fill the blanks',
            style: kFortniteStatsTextTheme(Colors.white, 20, FontWeight.w800),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '* Notice Platforms: kbm, gamepad, touch',
                    style: kFortniteStatsTextTheme(
                      Colors.white,
                      15,
                      FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Form(
                          key: _formUserId,
                          child: TextFormField(
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textAlignVertical: TextAlignVertical.center,
                            onSaved: (input) => userId = input,
                            validator: (v) {
                              if (v.isEmpty) {
                                return 'Empty UserName';
                              }
                              return null;
                            },
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              userId = value;
                            },
                            decoration: InputDecoration(
                              labelStyle:
                                  TextStyle(color: Colors.white, fontSize: 15),
                              labelText: 'Epic User Id',
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 5.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        flex: 3,
                        child: Form(
                          key: _formPlatform,
                          child: TextFormField(
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textAlignVertical: TextAlignVertical.center,
                            onSaved: (input) => platform = input,
                            validator: (v) {
                              if (v.isEmpty) {
                                return 'Empty Platform';
                              }
                              return null;
                            },
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              userId = value;
                            },
                            decoration: InputDecoration(
                              labelStyle:
                                  TextStyle(color: Colors.white, fontSize: 15),
                              labelText: 'Platform',
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 5.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            if (_formUserId.currentState.validate() &&
                                _formPlatform.currentState.validate()) {
                              _formUserId.currentState.save();
                              _formPlatform.currentState.save();
                              //setState(() {
                              fetchData();
                              //});
                            }
                          },
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        epicUserId ?? '',
                        style: kFortniteStatsTextTheme(
                            Colors.white, 20, FontWeight.w900),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.create,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(
                            () {
                              _formUserId.currentState.reset();
                              _formPlatform.currentState.reset();
                              statsList = [];
                              lifeTimeStatPicker = null;
                              epicUserId = 'UserName';
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  lifeTimeStatPicker == null
                      ? SizedBox(
                          height: 0,
                          width: 0,
                        )
                      : Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          height: 300,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [

                            ],
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class StatPicker {
  final String mode;
  final int trnRatingRank;
  final String trnRatingValue;
  final String scoreValue;
  final String kdValue;
  final String killsValue;
  final String wins;

  StatPicker({
    this.mode,
    this.trnRatingRank, //['p2']['trnRating']['rank']
    this.trnRatingValue, //['p2']['trnRating']['value']
    this.scoreValue, //['p2']['score']['value']
    this.kdValue, //['p2']['kd']['value']
    this.killsValue, //['p2']['kills']['value']
    this.wins, //['p2']['top1']['value']
  });
}

class LifeTimeStatPicker {
  var score; //['lifeTimeStats'][6]['value']
  var wins; //['lifeTimeStats'][8]['value']
  var kills; //['lifeTimeStats][10]['value']
  var kd; //['lifeTimeStats][11]['value']

  LifeTimeStatPicker({
    this.score,
    this.wins,
    this.kills,
    this.kd,
  });
}