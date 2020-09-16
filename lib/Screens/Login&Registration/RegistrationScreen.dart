import 'package:arena/Animations/FadeInXCustom.dart';
import 'package:arena/Animations/FadeInYCustom.dart';
import 'package:arena/BottomNavigationBar/MainScreen.dart';
import 'package:arena/Colors/colors.dart';
import 'package:arena/Themes/TextTheme.dart';
import 'package:arena/Utilities/http_exception.dart';
import 'package:arena/services/auth_provider.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  static const id = 'Registration_Screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email;
  String password;
  String username;

  bool _isHidden = true;
  final _formPassword = GlobalKey<FormState>();
  final _formEmail = GlobalKey<FormState>();
  final _formUserName = GlobalKey<FormState>();

  bool _isLoading = false;

  Map<String, String> _authData = {
    'email': '',
    'password': '',
    'username': '',
  };

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Oops an Error Occured'),
        content: Text(message),
        actions: [
          FlatButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formEmail.currentState.validate() ||
        !_formPassword.currentState.validate() ||
        !_formUserName.currentState.validate()) {
      return; //if state is Invalid
    }

    _formEmail.currentState.save();
    _formPassword.currentState.save();
    _formUserName.currentState.save();

    setState(() {
      _isLoading = true;
    });

    try {
      await Provider.of<Auth>(context, listen: false).signup(
        _authData['email'],
        _authData['password'],
        _authData['username'],
      );
      Navigator.of(context).pushReplacementNamed(BottomNavBar.id);
    } on HttpException catch (error) {
      var errorMessage = 'Oops Authenticate Failed :(';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage =
            'Email Address already exists, try again with another email address';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This isn\'t valid email address';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'This password is too weak';
      } else if (error.toString().contains('OPERATION_NOT_ALLOWED')) {
        errorMessage = 'Sign-in is disabled for now!';
      } else if (error.toString().contains('TOO_MANY_ATTEMPTS_TRY_LATER')) {
        errorMessage =
            'We have blocked all requests from this device due to unusual activity. Try again later.';
      }
      _showDialog(errorMessage);
    } catch (error) {
      var errorMessage =
          'Could not authenticate, please try Again or check your internet Connection.';
      _showDialog(errorMessage);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return MaterialApp(
      theme: ThemeData(primaryColor: kBgColors),
      home: Scaffold(
        backgroundColor: kBgColors,
        body: SafeArea(
          child: SingleChildScrollView(
            child: _isLoading
                ? Container(
                    height: deviceSize.height,
                    width: deviceSize.width,
                    child: Center(
                      child: SpinKitCircle(
                        size: 50,
                        color: kGradientEnd,
                      ),
                    ),
                  )
                : Column(
                    // padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                    children: <Widget>[
                      Container(
                        width: 120,
                        height: 120,
                        child: FlareActor(
                          'assets/arena_logo.flr',
                          animation: 'logo_play',
                          alignment: Alignment.center,
                        ),
                      ),
                      Center(
                        child: FadeInYCustom(
                          0.5,
                          -50.0,
                          Text(
                            'Arena',
                            style: kLoginTextTheme(
                              color: kLoginTitleColor,
                              fontSize: 35.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      FadeInYCustom(
                        0.5,
                        -50.0,
                        Container(
                          decoration: BoxDecoration(
                            // color: kBgColorAccent,
                            gradient: LinearGradient(
                              colors: [
                                kGradientBegin,
                                kGradientEnd,
                              ],
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 20.0),
                          width: MediaQuery.of(context).size.width - 20 * 2,
                          height: MediaQuery.of(context).size.height * 0.5 + 40,
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 20.0,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    FadeInYCustom(
                                      0.7,
                                      -50.0,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            'Registration',
                                            style: TextStyle(
                                                color: kBgColors,
                                                fontWeight: FontWeight.w900,
                                                fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20.0),
                                    FadeInXCustom(
                                      0.9,
                                      50.0,
                                      Form(
                                        key: _formEmail,
                                        child: TextFormField(
                                          cursorColor: kBgColors,
                                          style: TextStyle(color: Colors.white),
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          onSaved: (value) {
                                            _authData['email'] = value.trim();
                                          },
                                          validator: (v) {
                                            if (v.isEmpty) {
                                              return 'Please Enter an Email';
                                            } else if (!v.contains('@') ||
                                                !v.contains('.')) {
                                              return 'Email is invalid';
                                            } else if (v.lastIndexOf('@') >
                                                v.lastIndexOf('.')) {
                                              return 'Email is invalid';
                                            } else if (v.startsWith('@') ||
                                                v.startsWith('.') ||
                                                v.startsWith('\$') ||
                                                v.startsWith('#') ||
                                                v.startsWith('!') ||
                                                v.startsWith('&') ||
                                                v.startsWith('%') ||
                                                v.startsWith('^') ||
                                                v.startsWith('`') ||
                                                v.startsWith('/') ||
                                                v.startsWith('\\') ||
                                                v.startsWith("'") ||
                                                v.startsWith('"') ||
                                                v.startsWith('?') ||
                                                v.startsWith('<') ||
                                                v.startsWith('>') ||
                                                v.startsWith('-') ||
                                                v.startsWith('_') ||
                                                v.startsWith('*')) {
                                              return 'Email is invalid';
                                            }
                                            return null;
                                          },
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            labelText: 'Email',
                                            prefixIcon: Icon(
                                              Icons.email,
                                              color: kBgColors,
                                            ),
                                            labelStyle: TextStyle(
                                                color: kBgColors, fontSize: 13),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 8.0,
                                                    vertical: 5.0),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: kBgColors),
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            border: OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: kBgColors),
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20.0),
                                    FadeInXCustom(
                                      1.1,
                                      50.0,
                                      Form(
                                        key: _formUserName,
                                        child: TextFormField(
                                          style: TextStyle(color: Colors.white),
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          validator: (v) {
                                            if (v.isEmpty) {
                                              return 'UserName is Invalid';
                                            } else if (v.length < 3) {
                                              return 'UserName must be greater than 3 charachters';
                                            }
                                          },
                                          cursorColor: kBgColors,
                                          textAlign: TextAlign.center,
                                          onSaved: (value) {
                                            _authData['username'] =
                                                value.trim();
                                          },
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            labelStyle: TextStyle(
                                                color: kBgColors, fontSize: 13),
                                            labelText: 'UserName',
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 8.0,
                                                    vertical: 5.0),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: kBgColors),
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            border: OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: kBgColors),
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            prefixIcon: Icon(
                                              Icons.person,
                                              color: kBgColors,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20.0),
                                    FadeInXCustom(
                                      1.3,
                                      50.0,
                                      Form(
                                        key: _formPassword,
                                        child: TextFormField(
                                          cursorColor: kBgColors,
                                          style: TextStyle(color: Colors.white),
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          onSaved: (value) {
                                            _authData['password'] = value;
                                          },
                                          validator: (v) {
                                            if (v.isEmpty) {
                                              return 'Please Enter a password';
                                            } else if (v.length < 8) {
                                              return 'Password must be least than 8';
                                            }
                                            return null;
                                          },
                                          obscureText: _isHidden,
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            labelStyle: TextStyle(
                                                color: kBgColors, fontSize: 13),
                                            labelText: 'Password',
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 8.0,
                                                    vertical: 5.0),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: kBgColors),
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            border: OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: kBgColors),
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            prefixIcon: Icon(
                                              Icons.lock,
                                              color: kBgColors,
                                            ),
                                            suffixIcon: IconButton(
                                              onPressed: () {
                                                _toggleVisibility();
                                              },
                                              icon: _isHidden
                                                  ? Icon(
                                                      Icons.visibility_off,
                                                      color: kBgColors
                                                          .withOpacity(0.6),
                                                    )
                                                  : Icon(
                                                      Icons.visibility,
                                                      color: kBgColors,
                                                    ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20.0),
                                    FadeInYCustom(
                                      1.5,
                                      50.0,
                                      Material(
                                        color: kBgColors,
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        elevation: 15.0,
                                        shadowColor: kShadowColor,
                                        child: MaterialButton(
                                          minWidth:
                                              MediaQuery.of(context).size.width,
                                          height: 40.0,
                                          onPressed: () {
                                            _submit();
                                            // Navigator.popAndPushNamed(
                                            //     context, IntroScreen.id);
                                          },
                                          child: Text(
                                            'Register',
                                            style: TextStyle(
                                                color: kBgColorAccent),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
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
