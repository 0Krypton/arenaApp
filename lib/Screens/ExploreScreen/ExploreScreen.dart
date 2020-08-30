import 'package:arena/Animations/FadeInXCustom.dart';
import 'package:arena/Animations/FadeInYCustom.dart';
import 'package:arena/Screens/ExploreScreen/BuildExploreScreenItems.dart';
import 'package:arena/Screens/ExploreScreen/ExploreScreenProvider.dart';
import 'package:arena/Screens/ExploreScreen/SearchScreen.dart';
import 'package:arena/Themes/TextTheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  Widget buildBottomSheet(BuildContext context) {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.cyan),
      home: ChangeNotifierProvider(
        create: (_) => ExploreScreenProvider(),
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Consumer<ExploreScreenProvider>(
                builder: (context, provider, child) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 30,
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
                                          items: provider.searchScreenTours));
                                },
                              )
                            ],
                          ),
                        ),
                        FadeInYCustom(1,-50,GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context, builder: buildBottomSheet);
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
                                color: Colors.brown.withAlpha(90),
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
                        FadeInYCustom(1.2,-50,Container(
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
                          child: FadeInXCustom(1,-50, Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: Container(
                                padding: EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                  top: 15,
                                  bottom: 5,
                                ),
                                width: MediaQuery.of(context).size.width,
                                child: ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  itemCount: provider.searchScreenTours.length,
                                  itemBuilder: (context, index) {
                                    return BuildSearchScreenItems(
                                        searchTournoument:
                                            provider.searchScreenTours[index]);
                                  },
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
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
