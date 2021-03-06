import 'package:arena/Colors/colors.dart';
import 'package:arena/Screens/chat/message_shape.dart';
import 'package:arena/Themes/TextTheme.dart';
import 'package:arena/services/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class Messages extends StatelessWidget {
  final tournoumentId;
  final tournoumentTitle;
  Messages(
    this.tournoumentId,
    this.tournoumentTitle,
  );

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance
          .collection('chats/$tournoumentId/messages')
          .orderBy(
            'createdAt',
            descending: true,
          )
          .snapshots(),
      builder: (context, chatSnapShot) {
        if (chatSnapShot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
            
          );
        } else if (chatSnapShot.data.documents.length == 0) {
          return Center(
            child: Text(
              'There isn\'t any Message\n From $tournoumentTitle',
              textAlign: TextAlign.center,
              style: kHomeScreenTitle(
                kGradientEnd,
                16,
                FontWeight.w700,
              ),
            ),
          );
        }
        var userId = Provider.of<Auth>(context, listen: false).userId;
        return ListView.builder(
          reverse: true,
          itemCount: chatSnapShot.data.documents.length,
          itemBuilder: (context, index) => MessageBubleShape(
            messageText: chatSnapShot.data.documents[index]['text'],
            user_name: chatSnapShot.data.documents[index]['username'],
            image_url: chatSnapShot.data.documents[index]['image_url'],
            isMessageFromMe: chatSnapShot.data.documents[index]['userId'] == userId,
            key: ValueKey(chatSnapShot.data.documents[index].documentID),
          ),
        );
      },
    );
  }
}
