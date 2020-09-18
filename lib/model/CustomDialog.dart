import 'dart:math';

import 'package:arena/Screens/ExploreScreen/ExploreScreenProvider.dart';
import 'package:arena/Themes/TextTheme.dart';
import 'package:arena/Utilities/ExploreScreenItemDetail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomDialog extends StatelessWidget {
  final Size size;
  final ExploreScreenTournoumentDetail tournoument;
  CustomDialog({
    this.size,
    this.tournoument,
  });

  @override
  Widget build(BuildContext context) {
    // Provider.of<ExploreScreenProvider>(context).getTournoumentChatStats(tournoument.id);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: FutureBuilder(
        future: Provider.of<ExploreScreenProvider>(context, listen: false)
            .getTournoumentChatStats(tournoument.id),
        builder: (context, future) {
          // providerEX.getTournoumentChatStats(tournoument.id);
          // Map<String ,dynamic> value = providerEX.chatTournoumentStat;
          if (future.connectionState == ConnectionState.waiting) {
            return Container(
              height: size.height / 2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Center(
                child: Text('Loading...'),
              ),
            );
          }
          final List<dynamic> tourChatStats =
              Provider.of<ExploreScreenProvider>(context, listen: false)
                  .chatTournoumentStat
                  .values
                  .toList();
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
            height: size.height / 2,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Players",
                    style: kHomeScreenTitle(Colors.black, 18, FontWeight.w900),
                  ),
                ),
                Expanded(
                  child: Container(
                    // height: size.height/2 - 50,
                    width: size.width,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: tourChatStats.length,
                      // reverse: true,
                      itemBuilder: (context, index) {
                        var playerStats = tourChatStats[index];
                        return Container(
                          height: 120,
                          width: size.width,
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
                          margin: EdgeInsets.only(
                              left: 10, right: 10, top: 15, bottom: 10),
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
                                      image: playerStats['profileImageUrl'] ==
                                              null
                                          ? AssetImage(
                                              'images/profile_person.jpg')
                                          : NetworkImage(
                                              playerStats['profileImageUrl'],
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 10,
                                child: Text(
                                  '#${playerStats['rank'].toString()}',
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
                                  playerStats['userName'],
                                  style: kTopScreenTextTheme(
                                    Colors.black,
                                    20,
                                    FontWeight.w700,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 65,
                                left: 90,
                                child: Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.trophy,
                                      size: 20,
                                      color: Color(0xFFC0CC11),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "${playerStats['points']}",
                                      style: GoogleFonts.ptSansNarrow(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
