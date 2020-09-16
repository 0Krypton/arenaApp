import 'package:arena/Colors/colors.dart';
import 'package:arena/Screens/ExploreScreen/ExploreScreenProvider.dart';
import 'package:arena/Themes/TextTheme.dart';
import 'package:arena/Utilities/ExploreScreenItemDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class BuildSearchScreenItems extends StatelessWidget {
  const BuildSearchScreenItems({
    Key key,
    @required this.searchTournoument,
  }) : super(key: key);

  final ExploreScreenTournoumentDetail searchTournoument;

  String logoImage(String game) {
    if (game.toLowerCase().trim() == 'fortnite')
      return 'images/fortnite_logo.png';
    else if (game.toLowerCase().trim() == 'valorant')
      return 'images/valorant_logo.png';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 20,
      ),
      height: 200,
      child: Stack(
        children: [
          Positioned(
            left: 20,
            bottom: 0,
            child: Image.network(
              searchTournoument.imageUrl.trim() ??
                  'images/fortnite-seeker_cropped.png',
              fit: BoxFit.cover,
              height: 150,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              color: (searchTournoument.bgColor).withOpacity(0.5),
            ),
            height: 200,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            left: 10,
            top: 10,
            child: Row(
              children: [
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: searchTournoument.bgColor,
                  ),
                  child: Center(
                    child: Image.asset(
                      logoImage(
                        searchTournoument.game,
                      ),
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  searchTournoument.creator,
                  style:
                      kSearchScreenTextTheme(Colors.white, 15, FontWeight.w700),
                ),
                SizedBox(width: 10),
                Icon(
                  searchTournoument.isPublic
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
              padding: EdgeInsets.only(top: 10, left: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Text(
                              searchTournoument.title,
                              style: kSearchScreenTextTheme(
                                searchTournoument.bgColor,
                                11,
                                FontWeight.w800,
                              ),
                            ),
                          ),
                          Spacer(),
                          Expanded(
                            flex: 2,
                            child: Text(
                              '${searchTournoument.enteredPlayers} / ${searchTournoument.totalPlayers}',
                              style: kSearchScreenTextTheme(
                                searchTournoument.bgColor,
                                9,
                                FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          searchTournoument.description,
                          style: kSearchScreenTextTheme(
                            searchTournoument.bgColor,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          FontAwesomeIcons.dollarSign,
                          color: searchTournoument.bgColor,
                          size: 15,
                        ),
                        Text(
                          searchTournoument.prize.toString(),
                          style: kSearchScreenTextTheme(
                            searchTournoument.bgColor,
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
                        color: searchTournoument.bgColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Center(
                        child: FlatButton(
                          onPressed: () async {
                            Provider.of<ExploreScreenProvider>(context,
                                    listen: false)
                                .toggleIsLoading();

                            try {
                              await Provider.of<ExploreScreenProvider>(
                                context,
                                listen: false,
                              ).enterToTournoument(
                                searchTournoument.id,
                                Provider.of<ExploreScreenProvider>(
                                  context,
                                  listen: false,
                                ).isEntered,
                              );
                            } catch (e) {
                              Scaffold.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: searchTournoument.bgColor,
                                  content: Text(e.toString()),
                                ),
                              );
                            }

                            Provider.of<ExploreScreenProvider>(context,
                                    listen: false)
                                .toggleIsLoading();
                          },
                          child: Provider.of<ExploreScreenProvider>(context,
                                      listen: false)
                                  .isLoading
                              ? SpinKitCircle(
                                  size: 15,
                                  color: Colors.white,
                                )
                              : Text(
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
