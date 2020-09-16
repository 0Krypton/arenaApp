import 'package:arena/Screens/chat/ChatScreen.dart';
import 'package:arena/Screens/ExploreScreen/ExploreScreenProvider.dart';
import 'package:arena/Themes/TextTheme.dart';
import 'package:arena/Utilities/ExploreScreenItemDetail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TourSuggestionItem extends StatefulWidget {
  final ExploreScreenTournoumentDetail tournoumentDetail;

  const TourSuggestionItem({Key key, this.tournoumentDetail}) : super(key: key);
  @override
  _TourSuggestionItemState createState() => _TourSuggestionItemState();
}

class _TourSuggestionItemState extends State<TourSuggestionItem> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final positionFromLeft = 40.0;

    String logoImage(String game) {
      if (game.toLowerCase().trim() == 'fortnite')
        return 'images/fortnite_logo.png';
      else if (game.toLowerCase().trim() == 'valorant')
        return 'images/valorant_logo.png';
    }

    return Dismissible(
      key: ValueKey(widget.tournoumentDetail.title),
      direction: DismissDirection.endToStart,
      onDismissed: (d) async {
        await Provider.of<ExploreScreenProvider>(context, listen: true)
            .leaveTournoument(widget.tournoumentDetail.id);
      },
      background: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: positionFromLeft,
            child: Container(
              padding: EdgeInsets.only(top: 10),
              height: deviceSize.height / 5,
              child: Image.network(
                widget.tournoumentDetail.imageUrl,
              ),
            ),
          ),
          Container(
            height: deviceSize.height / 5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  (widget.tournoumentDetail.bgColor).withOpacity(0.7),
                  (widget.tournoumentDetail.bgColor).withOpacity(0.5),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: deviceSize.width / 5 + 10,
            child: FittedBox(
              child: Text(
                widget.tournoumentDetail.creator,
                style: kHomeScreenTitle(
                  Colors.white,
                  18,
                  FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: deviceSize.width / 5 + 15,
            child: FittedBox(
              child: Text(
                widget.tournoumentDetail.title,
                style: kHomeScreenTitle(
                  Colors.white,
                  15,
                  FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: deviceSize.width / 5 + 20,
            child: FittedBox(
              child: Text(
                '${widget.tournoumentDetail.enteredPlayers} of ${widget.tournoumentDetail.totalPlayers}',
                style: kHomeScreenTitle(
                  Colors.white,
                  13,
                  FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: positionFromLeft / 2,
            child: Container(
              padding: EdgeInsets.all(5),
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.tournoumentDetail.bgColor,
              ),
              child: Image.asset(
                logoImage(
                  widget.tournoumentDetail.game,
                ),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            right: 10,
            child: Container(
              height: deviceSize.height / 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ChatScreen(
                            tournoumentDetail: widget.tournoumentDetail,
                          ),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// ListTile(
//         contentPadding: EdgeInsets.symmetric(
//           vertical: 10,
//           horizontal: 15,
//         ),
//         leading: Container(
//           height: 80,
//           width: 80,
//           decoration: BoxDecoration(
//             color: widget.tournoumentDetail.bgColor.withOpacity(0.5),
//             shape: BoxShape.circle,
//             image: DecorationImage(
//               image: NetworkImage(
//                 widget.tournoumentDetail.imageUrl,
//               ),
//               fit: BoxFit.contain,
//             ),
//           ),
//         ),
//         title: Text(
//           widget.tournoumentDetail.title,
//           style: kHomeSuggestionTours(
//               widget.tournoumentDetail.bgColor, 15, FontWeight.w400),
//         ),
//         subtitle: Text(
//           widget.tournoumentDetail.description,
//           overflow: TextOverflow.fade,
//           style: kHomeSuggestionTours(
//               widget.tournoumentDetail.bgColor, 12, FontWeight.w400),
//         ),
//         trailing: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               FontAwesomeIcons.trophy,
//               size: 15,
//               color: widget.tournoumentDetail.bgColor,
//             ),
//             SizedBox(height: 5),
//             Text(
//               '\$ ${widget.tournoumentDetail.prize}',
//               style: kHomeSuggestionTours(
//                   widget.tournoumentDetail.bgColor, 12, FontWeight.bold),
//             ),
//           ],
//         ),
//       )
