import 'package:arena/Themes/TextTheme.dart';
import 'package:arena/Utilities/SearchScreenItemDetail.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _formSearch = GlobalKey<FormState>();

  List<SearchScreenTournoumentDetail> searchTournouments =
      searchScreenTournouments;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.cyan),
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      top: 15,
                    ),
                    child: Text(
                      'Explore',
                      style: kSearchScreenTextTheme(
                        Colors.black,
                        20,
                        FontWeight.w900,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25),
                    child: Row(
                      children: [
                        Expanded(
                          child: Form(
                            key: _formSearch,
                            child: TextFormField(
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              cursorColor: Colors.black,
                              textAlignVertical: TextAlignVertical.center,
                              onSaved: (input) {},
                              validator: (v) {
                                if (v.isEmpty) {
                                  return 'Enter Something to find';
                                }
                                return null;
                              },
                              textAlign: TextAlign.center,
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                labelStyle: TextStyle(
                                  color: Colors.cyan,
                                  fontSize: 15,
                                ),
                                labelText: 'Search',
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 5.0,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.cyan, width: 2),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    FontAwesomeIcons.search,
                                    color: Colors.cyan,
                                  ),
                                  onPressed: () {
                                    _formSearch.currentState.validate();
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 25,
                        right: 25,
                        top: 20,
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
                            return Container(
                              margin: EdgeInsets.only(
                                bottom: 20,
                              ),
                              height: 200,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 11,
                                    bottom: 0,
                                    child: Image.asset(
                                      searchScreenTournouments[index].imageUrl,
                                      fit: BoxFit.cover,
                                      height: 150,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                      color: (searchTournouments[index].bgColor)
                                          .withOpacity(0.5),
                                    ),
                                    height: 200,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                  Positioned(
                                    left: 10,
                                    top: 10,
                                    child: Row(
                                      children: [
                                        buildSearchItemTopLeftIcon(index),
                                        SizedBox(width: 5),
                                        Text(
                                          searchTournouments[index].creator,
                                          style: kSearchScreenTextTheme(
                                              Colors.white,
                                              15,
                                              FontWeight.w700),
                                        ),
                                        SizedBox(width: 10),
                                        Icon(
                                          searchTournouments[index].isPublic
                                              ? FontAwesomeIcons.unlock
                                              : FontAwesomeIcons.lock,
                                          size: 12,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    right: 15,
                                    bottom: 15,
                                    child: Container(
                                      height: 140,
                                      width: 200,
                                      padding:
                                          EdgeInsets.only(top: 10, left: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    flex: 5,
                                                    child: Text(
                                                      searchTournouments[index]
                                                          .title,
                                                      style:
                                                          kSearchScreenTextTheme(
                                                        searchTournouments[
                                                                index]
                                                            .bgColor,
                                                        11,
                                                        FontWeight.w800,
                                                      ),
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      '${searchTournouments[index].enteredPlayers} / ${searchTournouments[index].totalPlayers}',
                                                      style:
                                                          kSearchScreenTextTheme(
                                                        searchTournouments[
                                                                index]
                                                            .bgColor,
                                                        9,
                                                        FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 5),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Text(
                                                  searchTournouments[index]
                                                      .description,
                                                  style: kSearchScreenTextTheme(
                                                    searchTournouments[index]
                                                        .bgColor,
                                                    12,
                                                    FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Positioned(
                                            bottom: 10,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  FontAwesomeIcons.dollarSign,
                                                  color:
                                                      searchTournouments[index]
                                                          .bgColor,
                                                  size: 15,
                                                ),
                                                Text(
                                                  searchTournouments[index]
                                                      .prize
                                                      .toString(),
                                                  style: kSearchScreenTextTheme(
                                                    searchTournouments[index]
                                                        .bgColor,
                                                    12,
                                                    FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            right: 10,
                                            bottom: 10,
                                            child: Container(
                                              height: 30,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                color: searchTournouments[index]
                                                    .bgColor,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(5),
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Enter Now',
                                                  style: kSearchScreenTextTheme(
                                                    Colors.white,
                                                    10,
                                                    FontWeight.w800,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
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

  Container buildSearchItemTopLeftIcon(int index) {
    String logoImage(String game) {
      switch (game) {
        case 'fortnite':
          return 'images/fortnite_logo.png';
        case 'valorant':
          return 'images/valorant_logo.png';
      }
    }

    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: searchScreenTournouments[index].bgColor,
      ),
      child: Center(
        child: Image.asset(
          logoImage(
            searchScreenTournouments[index].game,
          ),
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}
