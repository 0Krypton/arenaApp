import 'package:arena/Animations/FadeInXCustom.dart';
import 'package:arena/Animations/FadeInYCustom.dart';
import 'package:arena/Colors/colors.dart';
import 'package:arena/Screens/ExploreScreen/BuildExploreScreenItems.dart';
import 'package:arena/Screens/ExploreScreen/CreateTournoument.dart';
import 'package:arena/Screens/ExploreScreen/ExploreScreenProvider.dart';
import 'package:arena/Screens/ExploreScreen/SearchScreen.dart';
import 'package:arena/Themes/TextTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  void initState() {
    // Future.delayed(Duration.zero, () async {
    //   try {
    //     await Provider.of<ExploreScreenProvider>(
    //       context,
    //       listen: false,
    //     ).fetchAndSetProduct();
    //   } catch (e) {
    //     Scaffold.of(context).showSnackBar(
    //       SnackBar(
    //         content: Text('Oops something went Wrong!\nPlease check your connection'),
    //       ),
    //     );
    //   }
    // });
    super.initState();
  }

  Future<void> _refreshTours(BuildContext context) async {
    try {
      await Provider.of<ExploreScreenProvider>(
        context,
        listen: false,
      ).fetchAndSetProduct();
    } catch (e) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content:
              Text('Oops something went Wrong!\nPlease check your connection'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: kBgColorAccentCreateTournoument),
      home: Scaffold(
        body: RefreshIndicator(
          onRefresh: () => _refreshTours(context),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.bottom -
                    MediaQuery.of(context).padding.top -
                    50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 15,
                        right: 15,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Explore',
                            style: kSearchScreenTextTheme(
                              Colors.black,
                              25,
                              FontWeight.w700,
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(
                              Icons.search,
                            ),
                            onPressed: () {
                              showSearch(
                                context: context,
                                delegate: Search(
                                    items: Provider.of<ExploreScreenProvider>(
                                            context,
                                            listen: false)
                                        .searchScreenTours),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    FadeInYCustom(
                      1,
                      -50,
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateTournoument()),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          margin: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 25,
                            bottom: 5,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                right: 0,
                                top: 10,
                                child: Image.asset(
                                  'images/fortnite_commondo_bg.png',
                                  height: 90,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Positioned(
                                left: 30,
                                top: 10,
                                child: Image.asset(
                                  'images/valorant_background.png',
                                  height: 90,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey.withOpacity(0.5),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 20,
                                top: 25,
                                child: Text(
                                  'Create Your\nOwn Tournoument',
                                  style: kSearchScreenTextTheme(
                                    Colors.white,
                                    18,
                                    FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    FadeInYCustom(
                      1.2,
                      -50,
                      Container(
                        margin: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 5,
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 70,
                                child: Divider(
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Suggestions'),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: 70,
                                child: Divider(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: FadeInXCustom(
                        1,
                        -50,
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: FutureBuilder(
                            future: Provider.of<ExploreScreenProvider>(
                              context,
                              listen: false,
                            ).fetchAndSetProduct(),
                            builder: (context, snapShopt) {
                              if (snapShopt.hasError) {
                                return Center(
                                    child: Text(
                                  'Oops There was an Error',
                                  style: kSearchScreenTextTheme(
                                    Colors.black,
                                    20,
                                    FontWeight.bold,
                                  ),
                                ));
                              } else if (snapShopt.connectionState ==
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
                                        SpinKitDoubleBounce(
                                          size: 50,
                                          color: kGradientEnd,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              } else if (snapShopt.connectionState ==
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
                                        itemCount:
                                            list.searchScreenTours.length,
                                        itemBuilder: (context, index) {
                                          return BuildSearchScreenItems(
                                            key: ValueKey(
                                                list.searchScreenTours[index]),
                                            searchTournoument:
                                                list.searchScreenTours[index],
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String logoImage(String game) {
    if (game.toLowerCase() == 'fortnite')
      return 'images/fortnite_logo.png';
    else if (game.toLowerCase() == 'valorant')
      return 'images/valorant_logo.png';
  }
}
