import 'package:arena/Animations/FadeInXCustom.dart';
import 'package:arena/Animations/FadeInYCustom.dart';
import 'package:arena/Colors/colors.dart';
import 'package:arena/Screens/Login&Registration/RegistrationScreen.dart';
import 'package:arena/model/login_model.dart';
import 'package:flutter/material.dart';

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

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  LoginRequestModel requestModel;

  @override
  void initState() {
    super.initState();
    requestModel = LoginRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: kBgColors),
      home: Scaffold(
        backgroundColor: kBgColors,
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            children: <Widget>[
              Center(
                child: FadeInYCustom(
                  0.5,
                  -50.0,
                  Text(
                    'Arena',
                    style: TextStyle(
                        color: kLoginTitleColor,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              SizedBox(height: 100),
              FadeInYCustom(
                0.5,
                -50.0,
                Container(
                  decoration: BoxDecoration(
                    color: kBgColorAccent,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(50),
                        offset: Offset(-1, -1),
                        spreadRadius: 5,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                  width: MediaQuery.of(context).size.width - 20 * 2,
                  height: MediaQuery.of(context).size.height * 0.5 + 10,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FadeInYCustom(
                            0.7,
                            -50.0,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                style: TextStyle(color: Colors.black),
                                keyboardType: TextInputType.emailAddress,
                                onSaved: (input) => requestModel.email = input,
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
                                onChanged: (value) {
                                  email = value;
                                },
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: kBgColors,
                                  ),
                                  labelStyle:
                                      TextStyle(color: kBgColors, fontSize: 13),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 5.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kBgColors),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: kBgColors),
                                    borderRadius: BorderRadius.circular(15.0),
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
                                style: TextStyle(color: Colors.black),
                                textAlignVertical: TextAlignVertical.center,
                                onSaved: (input) =>
                                    requestModel.password = input,
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
                                onChanged: (value) {
                                  password = value;
                                },
                                decoration: InputDecoration(
                                  labelStyle:
                                      TextStyle(color: kBgColors, fontSize: 13),
                                  labelText: 'Password',
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 5.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kBgColors),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: kBgColors),
                                    borderRadius: BorderRadius.circular(15.0),
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
                                            color: kBgColors.withOpacity(0.6),
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
                              borderRadius: BorderRadius.circular(15.0),
                              elevation: 15.0,
                              shadowColor: kBgColors,
                              child: MaterialButton(
                                minWidth: MediaQuery.of(context).size.width,
                                height: 40.0,
                                onPressed: () {
                                  if (validateAndSave()) {
                                    print(requestModel.toJson());
                                  }
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(color: kBgColorAccent),
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
                                    color: Colors.black, fontSize: 11.0),
                              ),
                            ),
                            FadeInYCustom(
                              1.7,
                              -50.0,
                              GestureDetector(
                                child: Text(
                                  ' Register Now',
                                  style:
                                      TextStyle(color: kBgColors, fontSize: 13),
                                ),
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RegistrationScreen.id);
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
            ],
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
