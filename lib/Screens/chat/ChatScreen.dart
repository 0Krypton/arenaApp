import 'package:arena/Colors/colors.dart';
import 'package:arena/Screens/chat/add_message.dart';
import 'package:arena/Screens/chat/messages.dart';
import 'package:arena/Utilities/ExploreScreenItemDetail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChatScreen extends StatelessWidget {
  final ExploreScreenTournoumentDetail tournoumentDetail;

  const ChatScreen({Key key, this.tournoumentDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print("id: ${tournoumentDetail.id}\n${tournoumentDetail.title}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: kGradientBegin,
          ),
        ),
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
