import 'package:arena/Colors/colors.dart';
import 'package:arena/Screens/ExploreScreen/ExploreScreenProvider.dart';
import 'package:arena/Screens/chat/add_message.dart';
import 'package:arena/Screens/chat/messages.dart';
import 'package:arena/Themes/TextTheme.dart';
import 'package:arena/Utilities/ExploreScreenItemDetail.dart';
import 'package:arena/model/CustomDialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  final ExploreScreenTournoumentDetail tournoumentDetail;

  const ChatScreen({Key key, this.tournoumentDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print("id: ${tournoumentDetail.id}\n${tournoumentDetail.title}");

    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: kGradientBegin,
          ),
        ),
        title: Text(
          '${tournoumentDetail.enteredPlayers} members',
          style: kHomeScreenTitle(
            kGradientBegin,
            15,
            FontWeight.w800,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => CustomDialog(
                  size: screenSize,
                  tournoument: tournoumentDetail,
                ),
              );
            },
            icon: Icon(
              FontAwesomeIcons.userFriends,
              color: kGradientBegin,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: Messages(tournoumentDetail.id, tournoumentDetail.title),
              ),
              AddMessage(tournoumentDetail.id),
            ],
          ),
        ),
      ),

      // StreamBuilder(
      //   stream: Firestore.instance
      //       .collection('chat')
      //       .snapshots(),
      //   builder: (context, streamSnapShopt) {
      //     if (streamSnapShopt.connectionState == ConnectionState.waiting) {
      //       return Center(
      //         child: SpinKitFoldingCube(
      //           size: 50,
      //           color: kGradientEnd,
      //         ),
      //       );
      //     }
      //     final documents = streamSnapShopt.data.documents;
      //     return ListView.builder(
      //       itemCount: documents.length,
      //       itemBuilder: (context, index) {
      //         return Container(
      //           padding: EdgeInsets.all(10),
      //           child: Text(documents[index]['text']),
      //         );
      //       },
      //     );
      //   },
      // ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(
      //     Icons.add,
      //     color: Colors.white,
      //   ),
      //   onPressed: () {
      //     Firestore.instance
      //         .collection('chats/${tournoumentDetail.id}/messages')
      //         .add(
      //       {'text': 'This was added by clicking'},
      //     );
      //   },
      // ),
    );
  }
}

// print("${tournoumentDetail.id}");

//               .listen(
//             (data) {
//               data.documents.forEach((document){
//                 print(document['text']);
//               });

//             },
//           );
