import 'package:arena/Screens/ExploreScreen/BuildExploreScreenItems.dart';
import 'package:arena/Themes/TextTheme.dart';
import 'package:arena/Utilities/ExploreScreenItemDetail.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Search extends SearchDelegate<Widget> {
  final List<ExploreScreenTournoumentDetail> items = searchScreenTournouments;
  ExploreScreenTournoumentDetail item = ExploreScreenTournoumentDetail();

  @override
  List<Widget> buildActions(BuildContext context) {
    //actions for appbar
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
        ),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //leading icon on the left of app bar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //show some result based on the selection
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BuildSearchScreenItems(
        searchTournoument: item,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //show whe someone search for something
    final suggestionList = query.isEmpty
        ? recents
        : items
            .where(
              (e) =>
                  e.title.toLowerCase().contains(query) ||
                  e.description.toLowerCase().contains(query) ||
                  e.creator.toLowerCase().contains(query),
            )
            .toList();

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 10),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              if (!recents.contains(suggestionList[index])) {
                recents.add(suggestionList[index]);
              }
              item = suggestionList[index];
              showResults(context);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: suggestionList[index].bgColor.withOpacity(0.5),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        suggestionList[index].imageUrl,
                        
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                title: RichText(
                  text: TextSpan(
                    text:
                        suggestionList[index].title.substring(0, query.length),
                    style: TextStyle(
                      color: suggestionList[index].bgColor,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text:
                            suggestionList[index].title.substring(query.length),
                        style: TextStyle(
                          color: suggestionList[index].bgColor.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
                subtitle: RichText(
                  text: TextSpan(
                    text: suggestionList[index]
                        .description
                        .substring(0, query.length),
                    style: TextStyle(
                      color: suggestionList[index].bgColor,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: suggestionList[index]
                            .description
                            .substring(query.length),
                        style: TextStyle(
                          color: suggestionList[index].bgColor.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.trophy,
                      size: 15,
                      color: suggestionList[index].bgColor,
                    ),
                    Text(
                      '\$ ${suggestionList[index].prize}',
                      style: kSearchScreenTextTheme(
                          suggestionList[index].bgColor, 10, FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
