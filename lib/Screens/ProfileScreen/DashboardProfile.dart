import 'dart:io';

import 'package:arena/Animations/FadeInXCustom.dart';
import 'package:arena/Animations/FadeInYCustom.dart';
import 'package:arena/Colors/colors.dart';
import 'package:arena/Themes/TextTheme.dart';
import 'package:arena/Utilities/ProfileGamesPlayed.dart';
import 'package:arena/services/auth_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DashBoardProfile extends StatefulWidget {
  final Duration duration;
  final Function onPressed;

  DashBoardProfile({
    Key key,
    this.duration,
    this.onPressed,
  }) : super(key: key);

  @override
  _DashBoardProfileState createState() => _DashBoardProfileState();
}

class _DashBoardProfileState extends State<DashBoardProfile> {
  File _imageProfile;
  File _imageBg;

  void _imageProfilePick() async {
    final image = await ImagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxHeight: 150,
      maxWidth: 150,
    );

    setState(() {
      _imageProfile = image;
    });
    final userId = Provider.of<Auth>(context, listen: false).userId;
    final ref =
        FirebaseStorage.instance.ref().child('user_profile_images').child(
              userId + '.jpg',
            );

    await ref.putFile(image).onComplete;
  }

  void _imageBgPick() async {
    final image = await ImagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxHeight: 150,
    );

    setState(() {
      _imageBg = image;
    });
    final userId = Provider.of<Auth>(context, listen: false).userId;
    final ref = FirebaseStorage.instance.ref().child('user_bg_images').child(
          userId + '.jpg',
        );

    await ref.putFile(image).onComplete;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        kGradientBegin,
                        kGradientEnd,
                      ],
                    ),
                    image: _imageBg != null
                        ? DecorationImage(
                            image: FileImage(_imageBg),
                            fit: BoxFit.fill,
                          )
                        : null,
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: GestureDetector(
                    child: Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 25,
                    ),
                    onTap: () {
                      widget.onPressed();
                    },
                  ),
                ),
                FadeInYCustom(
                  1,
                  -50,
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 70.0,
                      ),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            kGradientEnd,
                            kGradientBegin,
                          ],
                        ),
                        image: _imageProfile != null
                            ? DecorationImage(
                                image: FileImage(_imageProfile),
                                fit: BoxFit.fill,
                              )
                            : null,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            blurRadius: 30.0,
                            spreadRadius: 5.0,
                            offset: Offset(10.0, 10.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FadeInYCustom(
                          1.2,
                          -50,
                          Row(
                            children: [
                              Text(
                                'Profile',
                                style: kHomeScreenTitle(
                                  kGradientEnd,
                                  15,
                                  FontWeight.w900,
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.add_a_photo,
                                  size: 25,
                                ),
                                color: kGradientBegin,
                                onPressed: () {
                                  _imageProfilePick();
                                },
                              ),
                            ],
                          ),
                        ),
                        FadeInYCustom(
                          1.2,
                          -50,
                          Row(
                            children: [
                              Text(
                                'BG',
                                style: kHomeScreenTitle(
                                  kGradientEnd,
                                  15,
                                  FontWeight.w900,
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.add_photo_alternate,
                                  size: 25,
                                ),
                                color: kGradientBegin,
                                onPressed: () {
                                  _imageBgPick();
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    FadeInYCustom(
                      1.2,
                      -50,
                      Center(
                        child: Text(
                          Provider.of<Auth>(
                                context,
                                listen: true,
                              ).userName ??
                              '',
                          style: GoogleFonts.nunito(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    FadeInYCustom(
                      1.4,
                      -50,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.pinkAccent,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25.0),
                                ),
                              ),
                              child: Text(
                                'Gamer',
                                style: GoogleFonts.nunito(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.deepPurple,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25.0),
                                ),
                              ),
                              child: Text(
                                'Admin',
                                style: GoogleFonts.nunito(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    FadeInYCustom(
                      1.6,
                      -50,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 90,
                            child: Divider(
                              color: Colors.black,
                              thickness: 0.4,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Games',
                            style: GoogleFonts.nunito(
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                          SizedBox(width: 5),
                          Container(
                            width: 90,
                            child: Divider(
                              color: Colors.black,
                              thickness: 0.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Expanded(
                      flex: 1,
                      child: FadeInXCustom(
                        1.8,
                        50,
                        GridView.count(
                          physics: BouncingScrollPhysics(),
                          crossAxisCount: 2,
                          childAspectRatio: 11 / 7,
                          children: listGamesPlayed
                              .map(
                                (item) => Container(
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: item.color,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      Center(
                                        child: Container(
                                          height: 100,
                                          width: 100,
                                          child: Image.asset(item.imageUrl),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
