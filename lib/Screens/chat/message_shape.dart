import 'package:arena/Colors/colors.dart';
import 'package:arena/Themes/TextTheme.dart';
import 'package:arena/services/auth_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MessageBubleShape extends StatelessWidget {
  final String messageText;
  final bool isMessageFromMe;
  final String user_name;
  final String image_url;
  // final String user_id;

  final Key key;
  MessageBubleShape({
    this.messageText,
    this.isMessageFromMe,
    this.user_name,
    this.image_url,
    // this.user_id,
    this.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment:
          isMessageFromMe ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        isMessageFromMe
            ? Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        kGradientBegin,
                        kGradientEnd,
                        Color(0xFF0F0478),
                        Color(0xFFFF0099),
                      ],
                    ),
                    image: image_url == null
                        ? null
                        : DecorationImage(
                            image: NetworkImage(image_url),
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              )
            : SizedBox(width: 0, height: 0),
        Column(
          crossAxisAlignment: isMessageFromMe
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text(
                user_name,
                style: kHomeScreenTitle(
                  isMessageFromMe ? kGradientEnd : Colors.grey,
                  13,
                  FontWeight.w500,
                ),
                textAlign: isMessageFromMe ? TextAlign.start : TextAlign.end,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color:
                    isMessageFromMe ? kGradientEnd : Colors.grey.withAlpha(70),
                borderRadius: isMessageFromMe
                    ? BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      )
                    : BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              margin: EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 3,
              ),
              child: Text(
                messageText,
                style: kHomeScreenTitle(
                  isMessageFromMe ? Colors.white : Colors.black,
                  15,
                  FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        isMessageFromMe == false
            ? Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        kGradientBegin,
                        kGradientEnd,
                        Color(0xFF0F0478),
                        Color(0xFFFF0099),
                      ],
                    ),
                    image: image_url == null
                        ? null
                        : DecorationImage(
                            image: NetworkImage(image_url),
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              )
            : SizedBox(width: 0, height: 0),
      ],
    );
  }
}
