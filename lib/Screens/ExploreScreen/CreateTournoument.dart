import 'package:arena/Colors/colors.dart';
import 'package:arena/Screens/ExploreScreen/ExploreScreenProvider.dart';
import 'package:arena/Utilities/ExploreScreenItemDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CreateTournoument extends StatefulWidget {
  static const id = 'Create_Tournoument';

  @override
  _CreateTournoumentState createState() => _CreateTournoumentState();
}

class _CreateTournoumentState extends State<CreateTournoument> {
  final _formTitle = GlobalKey<FormState>();
  final _formDescription = GlobalKey<FormState>();
  final _formPrice = GlobalKey<FormState>();
  final _formGame = GlobalKey<FormState>();
  final _formTotalPlayers = GlobalKey<FormState>();
  TextEditingController _textFieldController = TextEditingController();

  String title, desc, game;
  double prize;
  int totalPlayers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: kBgColorCreateTournoument,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  child: Image.asset(
                    'images/fortnite_map_background.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 15,
                  left: 15,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Positioned(
                  top: 150,
                  left: MediaQuery.of(context).size.width / 12,
                  right: MediaQuery.of(context).size.width / 12,
                  child: Container(
                    height: 350,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width - 70,
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      children: [
                        Column(
                          children: [
                            CreateField(
                              formTitle: _formTitle,
                              validator: (v) {
                                if (v.isEmpty) {
                                  return 'Empty Title';
                                }
                                return null;
                              },
                              textColor: kLabelTitleColorCreateTournoument,
                              borderColor: kBgColorAccentCreateTournoument,
                              labelText: 'Title',
                              onSaved: (input) {
                                title = input;
                              },
                            ),
                            SizedBox(height: 20),
                            CreateField(
                              formTitle: _formDescription,
                              validator: null,
                              textColor: kLabelTitleColorCreateTournoument,
                              borderColor: kBgColorAccentCreateTournoument,
                              labelText: 'Description',
                              onSaved: (input) {
                                desc = input;
                              },
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: CreateField(
                                    formTitle: _formPrice,
                                    validator: null,
                                    textColor:
                                        kLabelTitleColorCreateTournoument,
                                    borderColor:
                                        kBgColorAccentCreateTournoument,
                                    labelText: 'Prize',
                                    onSaved: (input) {
                                      prize = double.parse(input);
                                    },
                                    type: TextInputType.number,
                                    formatter: [
                                      WhitelistingTextInputFormatter.digitsOnly
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: CreateField(
                                    formTitle: _formGame,
                                    validator: (v) {
                                      if (v.isEmpty) {
                                        return 'Please Enter Game';
                                      }
                                      return null;
                                    },
                                    textColor:
                                        kLabelTitleColorCreateTournoument,
                                    borderColor:
                                        kBgColorAccentCreateTournoument,
                                    labelText: 'Game',
                                    onSaved: (input) {
                                      game = input;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            CreateField(
                              formTitle: _formTotalPlayers,
                              validator: (v) {
                                if (v.isEmpty) {
                                  return 'TotalPlayers is Empty';
                                }
                                return null;
                              },
                              onSaved: (v) {
                                totalPlayers = int.parse(v);
                              },
                              textColor: kLabelTitleColorCreateTournoument,
                              borderColor: kBgColorAccentCreateTournoument,
                              labelText: 'Total Players',
                              type: TextInputType.number,
                              formatter: [
                                WhitelistingTextInputFormatter.digitsOnly
                              ],
                            ),
                            SizedBox(height: 15),
                            Material(
                              color: kBgColors,
                              borderRadius: BorderRadius.circular(15.0),
                              elevation: 15.0,
                              shadowColor: kShadowColorCreateTournoument,
                              child: MaterialButton(
                                minWidth: MediaQuery.of(context).size.width,
                                height: 40.0,
                                onPressed: () {
                                  if (_formTitle.currentState.validate() &&
                                      _formDescription.currentState
                                          .validate() &&
                                      _formPrice.currentState.validate() &&
                                      _formGame.currentState.validate() &&
                                      _formTotalPlayers.currentState
                                          .validate()) {
                                    _formTitle.currentState.save();
                                    _formDescription.currentState.save();
                                    _formGame.currentState.save();
                                    _formPrice.currentState.save();
                                    _formTotalPlayers.currentState.save();
                                    ExploreScreenTournoumentDetail tour =
                                        ExploreScreenTournoumentDetail(
                                      title: title,
                                      description: desc,
                                      prize: prize,
                                      isPublic: false,
                                      game: game,
                                      totalPlayers: totalPlayers,
                                      enteredPlayers: 0,
                                      creator: 'Unknown',
                                      imageUrl:
                                          'images/fortnite-seeker_cropped.png',
                                      bgColor: Color(0xFF656464),
                                    );
                                    Provider.of<ExploreScreenProvider>(context,
                                            listen: false)
                                        .add(tour);
                                    _formTitle.currentState.reset();
                                    _formDescription.currentState.reset();
                                    _formGame.currentState.reset();
                                    _formPrice.currentState.reset();
                                    _formTotalPlayers.currentState.reset();
                                  }
                                },
                                child: Text(
                                  'Create',
                                  style: TextStyle(
                                    color: kBgColorAccentCreateTournoument,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CreateField extends StatelessWidget {
  final Color borderColor;
  final Color textColor;
  final String labelText;
  final Function validator;
  final Function onSaved;
  final List<TextInputFormatter> formatter;
  final TextInputType type;

  const CreateField({
    Key key,
    this.formTitle,
    this.validator,
    this.formatter,
    this.borderColor,
    this.type,
    this.labelText,
    this.textColor,
    this.onSaved,
  }) : super(key: key);

  final GlobalKey<FormState> formTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formTitle,
      child: TextFormField(
        cursorColor: borderColor,
        style: TextStyle(color: Colors.black),
        textAlignVertical: TextAlignVertical.center,
        onSaved: onSaved,
        keyboardType: type,
        inputFormatters: formatter,
        validator: validator,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: borderColor, fontSize: 17),
          labelText: labelText,
          contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: 1),
            borderRadius: BorderRadius.circular(15.0),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: 1),
            borderRadius: BorderRadius.circular(15.0),
          ),
          // prefixIcon: Icon(
          //   Icons.lock,
          //   color: borderColor,
          // ),
        ),
      ),
    );
  }
}
