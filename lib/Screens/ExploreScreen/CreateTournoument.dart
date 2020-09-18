import 'package:arena/Colors/colors.dart';
import 'package:arena/Screens/ExploreScreen/ExploreScreenProvider.dart';
import 'package:arena/Themes/TextTheme.dart';
import 'package:arena/Utilities/ExploreScreenItemDetail.dart';
import 'package:arena/Utilities/TournumentDetail.dart';
import 'package:arena/services/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class CreateTournoument extends StatefulWidget {
  static const id = 'Create_Tournoument';

  @override
  _CreateTournoumentState createState() => _CreateTournoumentState();
}

class _CreateTournoumentState extends State<CreateTournoument> {
  final _formKey = GlobalKey<FormState>();
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _playersFocusNode = FocusNode();
  final _gameFocusNode = FocusNode();
  bool _checkBoxValue = true;
  String _selectedGame;

  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();

  String title, desc, game;
  double prize;
  int totalPlayers;

  bool _isLoading = false;

  ExploreScreenTournoumentDetail _tour = ExploreScreenTournoumentDetail(
    title: '',
    description: '',
    prize: 0.0,
    isPublic: false,
    game: 'fortnite',
    totalPlayers: 0,
    enteredPlayers: 0,
    creator: 'Unknown',
    imageUrl: 'images/fortnite-seeker_cropped.png',
    bgColor: Color(0xFF656464),
  );

  Future<void> _saveForm() async {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    print(_tour.title);
    print(_tour.description);
    print(_tour.prize);
    print(_tour.imageUrl);

    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      var userId = await Provider.of<Auth>(context).userId;
      var userEmail = await Provider.of<Auth>(context).userEmail;
      await Provider.of<ExploreScreenProvider>(context, listen: false)
          .add(_tour,userId,userEmail,);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Oops !!! an error occured'),
          content: Text(
            'Some thing went wrong :(',
          ),
          actions: [
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _isLoading = false;
                });
              },
            )
          ],
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });

      // _formKey.currentState.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: kBgColorCreateTournoument,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top,
            child: _isLoading
                ? Center(
                    child: SpinKitDoubleBounce(color: kGradientEnd, size: 50.0),
                  )
                : Stack(
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
                        top: 100,
                        left: MediaQuery.of(context).size.width / 12,
                        right: MediaQuery.of(context).size.width / 12,
                        child: Container(
                          height: (MediaQuery.of(context).size.height * 3 / 4) -
                              MediaQuery.of(context).padding.top,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          width: MediaQuery.of(context).size.width - 50,
                          child: Form(
                            key: _formKey,
                            child: ListView(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              children: <Widget>[
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                        color: kBgColorAccentCreateTournoument,
                                        fontSize: 17),
                                    labelText: 'Title',
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 5.0),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              kBgColorAccentCreateTournoument,
                                          width: 1),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              kBgColorAccentCreateTournoument,
                                          width: 1),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    // prefixIcon: Icon(
                                    //   Icons.lock,
                                    //   color: borderColor,
                                    // ),
                                  ),
                                  textInputAction: TextInputAction.next,
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context)
                                        .requestFocus(_descriptionFocusNode);
                                  },
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Title is Empty';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _tour = ExploreScreenTournoumentDetail(
                                      title: value,
                                      description: _tour.description,
                                      prize: _tour.prize,
                                      isPublic: _tour.isPublic,
                                      game: _tour.game,
                                      totalPlayers: _tour.totalPlayers,
                                      enteredPlayers: _tour.enteredPlayers,
                                      creator: _tour.creator,
                                      imageUrl: _tour.imageUrl,
                                      bgColor: _tour.bgColor,
                                    );
                                  },
                                ),
                                SizedBox(height: 10),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                        color: kBgColorAccentCreateTournoument,
                                        fontSize: 17),
                                    labelText: 'Description',
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 10),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              kBgColorAccentCreateTournoument,
                                          width: 1),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: kBgColorAccentCreateTournoument,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    // prefixIcon: Icon(
                                    //   Icons.lock,
                                    //   color: borderColor,
                                    // ),
                                  ),
                                  maxLines: 3,
                                  keyboardType: TextInputType.multiline,
                                  focusNode: _descriptionFocusNode,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter a description.';
                                    }
                                    if (value.length < 10) {
                                      return 'Should be at least 10 characters long.';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _tour = ExploreScreenTournoumentDetail(
                                      title: _tour.title,
                                      description: value,
                                      prize: _tour.prize,
                                      isPublic: _tour.isPublic,
                                      game: _tour.game,
                                      totalPlayers: _tour.totalPlayers,
                                      enteredPlayers: _tour.enteredPlayers,
                                      creator: _tour.creator,
                                      imageUrl: _tour.imageUrl,
                                      bgColor: _tour.bgColor,
                                    );
                                  },
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          labelStyle: TextStyle(
                                              color:
                                                  kBgColorAccentCreateTournoument,
                                              fontSize: 17),
                                          labelText: 'Prize',
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 8.0, vertical: 5.0),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color:
                                                    kBgColorAccentCreateTournoument,
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color:
                                                    kBgColorAccentCreateTournoument,
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          // prefixIcon: Icon(
                                          //   Icons.lock,
                                          //   color: borderColor,
                                          // ),
                                        ),
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.number,
                                        focusNode: _priceFocusNode,
                                        onFieldSubmitted: (_) {
                                          FocusScope.of(context)
                                              .requestFocus(_gameFocusNode);
                                        },
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter a price.';
                                          }
                                          if (double.tryParse(value) == null) {
                                            return 'Please enter a valid number.';
                                          }
                                          if (double.parse(value) <= 0) {
                                            return 'Please enter a number greater than zero.';
                                          }
                                          return null;
                                        },
                                        onSaved: (value) {
                                          _tour =
                                              ExploreScreenTournoumentDetail(
                                            title: _tour.title,
                                            description: _tour.description,
                                            prize: double.parse(value),
                                            isPublic: _tour.isPublic,
                                            game: _tour.game,
                                            totalPlayers: _tour.totalPlayers,
                                            enteredPlayers:
                                                _tour.enteredPlayers,
                                            creator: _tour.creator,
                                            imageUrl: _tour.imageUrl,
                                            bgColor: _tour.bgColor,
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          labelStyle: TextStyle(
                                              color:
                                                  kBgColorAccentCreateTournoument,
                                              fontSize: 17),
                                          labelText: 'Game',
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 8.0, vertical: 5.0),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color:
                                                    kBgColorAccentCreateTournoument,
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color:
                                                    kBgColorAccentCreateTournoument,
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          // prefixIcon: Icon(
                                          //   Icons.lock,
                                          //   color: borderColor,
                                          // ),
                                        ),
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.text,
                                        focusNode: _gameFocusNode,
                                        onFieldSubmitted: (_) {
                                          FocusScope.of(context)
                                              .requestFocus(_playersFocusNode);
                                        },
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter a game';
                                          }
                                          if (value
                                                  .toLowerCase()
                                                  .trim()
                                                  .contains('valorant') ||
                                              value
                                                  .toLowerCase()
                                                  .trim()
                                                  .contains('valrant')) {
                                            _selectedGame = 'valorant';
                                          }
                                          if (value
                                                  .toLowerCase()
                                                  .trim()
                                                  .contains('fortnite') ||
                                              value
                                                  .toLowerCase()
                                                  .trim()
                                                  .contains('fort')) {
                                            _selectedGame = 'fortnite';
                                          }
                                          print(_selectedGame);
                                          return null;
                                        },
                                        onSaved: (value) {
                                          _tour =
                                              ExploreScreenTournoumentDetail(
                                            title: _tour.title,
                                            description: _tour.description,
                                            prize: _tour.prize,
                                            isPublic: _tour.isPublic,
                                            game: value.trim(),
                                            totalPlayers: _tour.totalPlayers,
                                            enteredPlayers:
                                                _tour.enteredPlayers,
                                            creator: _tour.creator,
                                            imageUrl: _tour.imageUrl,
                                            bgColor: _tour.bgColor,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          labelStyle: TextStyle(
                                              color:
                                                  kBgColorAccentCreateTournoument,
                                              fontSize: 17),
                                          labelText: 'Players',
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 8.0, vertical: 5.0),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color:
                                                    kBgColorAccentCreateTournoument,
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color:
                                                    kBgColorAccentCreateTournoument,
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          // prefixIcon: Icon(
                                          //   Icons.lock,
                                          //   color: borderColor,
                                          // ),
                                        ),
                                        textInputAction: TextInputAction.next,
                                        focusNode: _playersFocusNode,
                                        inputFormatters: [
                                          WhitelistingTextInputFormatter
                                              .digitsOnly
                                        ],
                                        keyboardType:
                                            TextInputType.numberWithOptions(),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please provide a value.';
                                          }
                                          return null;
                                        },
                                        onSaved: (value) {
                                          _tour =
                                              ExploreScreenTournoumentDetail(
                                            title: _tour.title,
                                            description: _tour.description,
                                            prize: _tour.prize,
                                            isPublic: _tour.isPublic,
                                            game: _tour.game,
                                            totalPlayers: int.parse(value),
                                            enteredPlayers:
                                                _tour.enteredPlayers,
                                            creator: _tour.creator,
                                            imageUrl: _tour.imageUrl,
                                            bgColor: _tour.bgColor,
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          FittedBox(
                                            child: Text(
                                              'Is Public ?',
                                              style: kSearchScreenTextTheme(
                                                  kBgColorAccentCreateTournoument,
                                                  15,
                                                  FontWeight.w600),
                                            ),
                                          ),
                                          Checkbox(
                                            value: _checkBoxValue,
                                            activeColor:
                                                kBgColorAccentCreateTournoument,
                                            onChanged: (v) {
                                              setState(() {
                                                _checkBoxValue =
                                                    !_checkBoxValue;
                                              });
                                              print(_checkBoxValue);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Material(
                                  color: kBgColors,
                                  borderRadius: BorderRadius.circular(15.0),
                                  elevation: 15.0,
                                  shadowColor: kShadowColorCreateTournoument,
                                  child: MaterialButton(
                                    minWidth: MediaQuery.of(context).size.width,
                                    height: 40.0,
                                    onPressed: () {
                                      _saveForm();
                                    },
                                    child: Text(
                                      'Create',
                                      style: TextStyle(
                                        color: kBgColorAccentCreateTournoument,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
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
