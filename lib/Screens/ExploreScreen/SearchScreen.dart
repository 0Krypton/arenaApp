import 'package:arena/Screens/ExploreScreen/BuildExploreScreenItems.dart';
import 'package:arena/Utilities/ExploreScreenItemDetail.dart';

import 'package:flutter/material.dart';

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
                  e.title.toLowerCase().startsWith(query) ||
                  e.description.toLowerCase().startsWith(query) ||
                  e.creator.toLowerCase().startsWith(query),
            )
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            if (!recents.contains(suggestionList[index])) {
              recents.add(suggestionList[index]);
            }
            item = suggestionList[index];
            showResults(context);
          },
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
                )),
          ),
          title: RichText(
            text: TextSpan(
              text: suggestionList[index].title.substring(0, query.length),
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: suggestionList[index].title.substring(query.length),
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
