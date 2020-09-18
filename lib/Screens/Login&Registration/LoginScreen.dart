import 'package:arena/Animations/FadeInXCustom.dart';
import 'package:arena/Animations/FadeInYCustom.dart';
import 'package:arena/BottomNavigationBar/MainScreen.dart';
import 'package:arena/Colors/colors.dart';
import 'package:arena/Screens/Login&Registration/RegistrationScreen.dart';
import 'package:arena/Themes/TextTheme.dart';
import 'package:arena/Utilities/http_exception.dart';
import 'package:arena/services/auth_provider.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const id = 'LogIn_Screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;

  bool _isHidden = true;

  final _formPassword = GlobalKey<FormState>();
  final _formEmail = GlobalKey<FormState>();

  bool _isLoading = false;

  Map<String, String> _authData = {
    'email': '',
    'password': '',
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

  void _submit() async {
    if (!_formEmail.currentState.validate() ||
        !_formPassword.currentState.validate()) {
      return; //if state is Invalid
    }

    _formEmail.currentState.save();
    _formPassword.currentState.save();
    setState(() {
      _isLoading = true;
    });

    try {
      await Provider.of<Auth>(context, listen: false).signin(
        _authData['email'],
        _authData['password'],
      );
      Navigator.of(context).pushReplacementNamed(BottomNavBar.id);
    } on HttpException catch (error) {
      var errorMessage = 'Oops Authenticate Failed :(';
      if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Could not find a user with that Email Address';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'The password is invalid';
      } else if (error.toString().contains('USER_DISABLED')) {
        errorMessage = 'The user account has been disabled by an administrator';
      }
      _showDialog(errorMessage);
    } catch (error) {
      const errorMessage =
          'Could not authenticate, please try Again or check your internet Connection.';
      _showDialog(errorMessage);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
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
                          //animation: 'logo_play',
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
                        SingleChildScrollView(
                          child: Container(
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
                              boxShadow: [
                                BoxShadow(
                                  color: kShadowColor.withAlpha(70),
                                  offset: Offset(-1, -1),
                                  spreadRadius: 5,
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 20.0),
                            width: deviceSize.width - 20 * 2,
                            height: deviceSize.height * 0.5,
                            //MediaQuery.of(context).size.height * 0.5 + 10,
                            child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Column(
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      FadeInYCustom(
                                        0.7,
                                        -50.0,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              'Login',
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
                                            style:
                                                TextStyle(color: Colors.white),
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
                                            // onChanged: (value) {
                                            //   email = value;
                                            // },
                                            decoration: InputDecoration(
                                              labelText: 'Email',
                                              prefixIcon: Icon(
                                                Icons.email,
                                                color: kBgColors,
                                              ),
                                              labelStyle: TextStyle(
                                                  color: kBgColors,
                                                  fontSize: 13),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 8.0,
                                                      vertical: 5.0),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: kBgColors),
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: kBgColors),
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
                                          key: _formPassword,
                                          child: TextFormField(
                                            cursorColor: kBgColors,
                                            style:
                                                TextStyle(color: Colors.white),
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
                                            // onChanged: (value) {
                                            //   password = value;
                                            // },
                                            decoration: InputDecoration(
                                              labelStyle: TextStyle(
                                                  color: kBgColors,
                                                  fontSize: 13),
                                              labelText: 'Password',
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 8.0,
                                                      vertical: 5.0),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: kBgColors),
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: kBgColors),
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
                                        1.3,
                                        50.0,
                                        Material(
                                          color: kBgColors,
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          elevation: 15.0,
                                          shadowColor: kShadowColor,
                                          child: MaterialButton(
                                            minWidth: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 40.0,
                                            onPressed: () {
                                              _submit();
                                            },
                                            child: Text(
                                              'Login',
                                              style: TextStyle(
                                                  color: kBgColorAccent),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 20.0),
                                  Divider(color: kBgColors),
                                  SizedBox(height: 10.0),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        FadeInYCustom(
                                          1.5,
                                          -50.0,
                                          Text(
                                            'Don\'t have an account? ',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13.0),
                                          ),
                                        ),
                                        FadeInYCustom(
                                          1.7,
                                          -50.0,
                                          GestureDetector(
                                            child: Text(
                                              ' Register Now',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            onTap: () {
                                              Navigator.pushNamed(context,
                                                  RegistrationScreen.id);
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
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

  bool validateAndSave() {
    final formPass = _formPassword.currentState;
    final formEmail = _formEmail.currentState;

    if (formEmail.validate() && formPass.validate()) {
      formEmail.save();
      formPass.save();
      return true;
    }
    return false;
  }
}
