import 'package:arena/Colors/colors.dart';
import 'package:arena/Themes/TextTheme.dart';
import 'package:arena/services/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class AddMessage extends StatefulWidget {
  final tournoumentId;
  AddMessage(this.tournoumentId);

  @override
  _AddMessageState createState() => _AddMessageState();
}

class _AddMessageState extends State<AddMessage> {
  var _enteredMessage = '';

  final _textController = TextEditingController();

  void _send() {
    //FocusScope.of(context).unfocus();
    // print("${Provider.of<Auth>(context,listen:false).userId}");
    Firestore.instance.collection('chats/${widget.tournoumentId}/messages').add(
      {
        'text': _enteredMessage,
        'createdAt': Timestamp.now(),
        'userId': Provider.of<Auth>(context, listen: false).userId,
      },
    );
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Enter a message',
                border: null,
              ),
              onChanged: (value) {
                setState(() {
                  _enteredMessage = value;
                });
              },
            ),
          ),
          IconButton(
            onPressed: _enteredMessage.trim().isEmpty ? null : _send,
            icon: Icon(
              FontAwesomeIcons.telegramPlane,
            ),
            color: kGradientEnd,
          )
        ],
      ),
    );
  }
}
