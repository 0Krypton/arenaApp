import 'package:arena/Colors/colors.dart';
import 'package:arena/Screens/Intro_Screen.dart';
import 'package:arena/model/login_model.dart';
import 'package:flutter/material.dart';

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
                child: Text(
                  'Arena',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20.0),),),
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                width: MediaQuery.of(context).size.width - 20 * 2,
                height: MediaQuery.of(context).size.height * 0.5 + 40,
                child: ListView(
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                        SizedBox(
                          height: 20.0,
                        ),
                        Form(
                          key: _formEmail,
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (input) => requestModel.email = input,
                            validator: (v) {
                              if (v.isEmpty) {
                                return 'Please Enter an Email';
                              } else if (!v.contains('@') || !v.contains('.')) {
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
                                  TextStyle(color: Colors.grey, fontSize: 13),
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
                        SizedBox(
                          height: 20.0,
                        ),
                        Form(
                          //key: ,
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            textAlignVertical: TextAlignVertical.center,
                            //validator: ,
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              username = value;
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelStyle:
                                  TextStyle(color: Colors.grey, fontSize: 13),
                              labelText: 'UserName',
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
                                Icons.person,
                                color: kBgColors,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Form(
                          key: _formPassword,
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            textAlignVertical: TextAlignVertical.center,
                            onSaved: (input) => requestModel.password = input,
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
                                  TextStyle(color: Colors.grey, fontSize: 13),
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
                        SizedBox(
                          height: 20.0,
                        ),
                        Material(
                          color: kBgColors,
                          borderRadius: BorderRadius.circular(15.0),
                          elevation: 15.0,
                          shadowColor: kBgColorAccent,
                          child: MaterialButton(
                            minWidth: MediaQuery.of(context).size.width,
                            height: 40.0,
                            onPressed: () {
                              if (ValidateAndSave()) {
                                print(requestModel.toJson());
                                Navigator.popAndPushNamed(context, IntroScreen.id);
                              }
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool ValidateAndSave() {
    final formPass = _formPassword.currentState;
    final formEmail = _formEmail.currentState;

    if (formPass.validate() && formEmail.validate()) {
      formEmail.save();
      formPass.save();
      return true;
    }
    return false;
  }
}
