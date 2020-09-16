import 'package:arena/Colors/colors.dart';
import 'package:arena/Themes/TextTheme.dart';
import 'package:flutter/material.dart';

class MessageBubleShape extends StatelessWidget {
  final String messageText;
  final bool isMessageFromMe;


  final Key key;
  MessageBubleShape({
    this.messageText,
    this.isMessageFromMe,
    this.key,
  });


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isMessageFromMe ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isMessageFromMe ? kGradientEnd : Colors.grey.withAlpha(70),
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
            horizontal: 15,
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
    );
  }
}
