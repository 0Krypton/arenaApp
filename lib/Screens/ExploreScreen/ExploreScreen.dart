import 'package:arena/Screens/ExploreScreen/BuildExploreScreenItems.dart';
import 'package:arena/Screens/ExploreScreen/SearchScreen.dart';
import 'package:arena/Themes/TextTheme.dart';
import 'package:arena/Utilities/ExploreScreenItemDetail.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List<ExploreScreenTournoumentDetail> searchTournouments =
      searchScreenTournouments;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.cyan),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 10,
          title: Text(
            'Explore',
            style: kSearchScreenTextTheme(
              Colors.black,
              20,
              FontWeight.w900,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
              ),
              onPressed: () {
                showSearch(context: context, delegate: Search());
              },
            )
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container(
                  //   width: MediaQuery.of(context).size.width,
                  //   height: 50,
                  //   margin: EdgeInsets.only(
                  //     left: 20,
                  //     right: 20,
                  //     top: 25,
                  //     bottom: 5,
                  //   ),
                  //   child: ListView(
                  //     physics: BouncingScrollPhysics(),
                  //     scrollDirection: Axis.horizontal,
                  //     children: [
                  //       Container(
                  //         color: Colors.red,
                  //         width: 100,
                  //         height: 50,
                  //       ),
                  //       Container(
                  //         color: Colors.yellow,
                  //         width: 100,
                  //         height: 50,
                  //       ),
                  //       Container(
                  //         color: Colors.red,
                  //         width: 100,
                  //         height: 50,
                  //       ),
                  //       Container(
                  //         color: Colors.yellow,
                  //         width: 100,
                  //         height: 50,
                  //       ),
                  //       Container(
                  //         color: Colors.red,
                  //         width: 100,
                  //         height: 50,
                  //       ),
                  //       Container(
                  //         color: Colors.yellow,
                  //         width: 100,
                  //         height: 50,
                  //       ),
                  //       Container(
                  //         color: Colors.red,
                  //         width: 100,
                  //         height: 50,
                  //       ),
                  //       Container(
                  //         color: Colors.yellow,
                  //         width: 100,
                  //         height: 50,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 15,
                      bottom: 5,
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
                  Expanded(
                    child: Padding(
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
                          itemCount: searchTournouments.length,
                          itemBuilder: (context, index) {
                            return BuildSearchScreenItems(
                                searchTournoument: searchTournouments[index]);
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
