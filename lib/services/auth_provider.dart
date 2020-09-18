import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:arena/Utilities/http_exception.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;
  String _userEmail;
  String _userName;
  String _bgImageUrl;
  String _profileImageUrl;

  String get bgImageUrl => _bgImageUrl;
  String get profileImageUrl => _profileImageUrl;

  Timer _authTimer;

  bool get isAuth {
    return token != null;
  }

  String get userName => _userName;

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  String get userEmail => _userEmail;

  String get userId => _userId;

  Future<void> signup(
    String email,
    String password,
    String userName,
    File imageBg,
    File imageProfile,
  ) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyChekhvdyaNPQrjGlzect7DfOiDyJivtfk';

    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );

      final responseData = json.decode(response.body);

      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      ////uploading bg image
      final refBgImage =
          FirebaseStorage.instance.ref().child('user_bg_images').child(
                responseData['localId'] + '.jpg',
              );
      await refBgImage.putFile(imageBg).onComplete;

      ///
      //uploading profile image
      final refProfileImage =
          FirebaseStorage.instance.ref().child('user_profile_images').child(
                responseData['localId'] + '.jpg',
              );

      await refProfileImage.putFile(imageProfile).onComplete;

      ///

      _profileImageUrl = await refProfileImage.getDownloadURL();
      _bgImageUrl = await refBgImage.getDownloadURL();

      await Firestore.instance
          .collection('users')
          .document(responseData['localId'])
          .setData(
        {
          'username': userName,
          'email': email,
          'password': password,
          'bgImage': _bgImageUrl,
          'profileImage': _profileImageUrl,
        },
      );

      _userName = userName;
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _userEmail = responseData['email'];
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(responseData['expiresIn']),
        ),
      );
      _autoLogout();
      notifyListeners();

      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode({
        'token': _token,
        'userId': _userId,
        'email': _userEmail,
        'username': _userName,
        'bgImageUrl': _bgImageUrl,
        'profileImageUrl': _profileImageUrl,
        'expiryDate': _expiryDate.toIso8601String()
      });
      prefs.setString('userData', userData);
    } catch (error) {
      throw error;
    }
  }

  Future<void> signin(String email, String password) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyChekhvdyaNPQrjGlzect7DfOiDyJivtfk';

    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      final responseData = json.decode(response.body);

      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }

      final userFireStore = await Firestore.instance
          .collection('users')
          .document(responseData['localId'])
          .get();

      _bgImageUrl = userFireStore.data['bgImage'];
      _profileImageUrl = userFireStore.data['profileImage'];

      _userName = userFireStore.data['username'];

      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _userEmail = responseData['email'];

      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(responseData['expiresIn']),
        ),
      );
      _autoLogout();
      notifyListeners();

      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode({
        'token': _token,
        'userId': _userId,
        'email': _userEmail,
        'username': _userName,
        'bgImageUrl': _bgImageUrl,
        'profileImageUrl': _profileImageUrl,
        'expiryDate': _expiryDate.toIso8601String()
      });
      prefs.setString('userData', userData);
    } catch (error) {
      throw error;
    }
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }
    final extractedUserData =
        json.decode(prefs.getString('userData')) as Map<String, Object>;
    final expiryDate = DateTime.parse(extractedUserData['expiryDate']);

    if (expiryDate.isBefore(DateTime.now())) {
      return false;
    }
    _token = extractedUserData['token'];
    _userId = extractedUserData['userId'];
    _userEmail = extractedUserData['email'];
    _userName = extractedUserData['username'];
    _bgImageUrl = extractedUserData['bgImageUrl'];
    _profileImageUrl = extractedUserData['profileImageUrl'];
    _expiryDate = expiryDate;
    notifyListeners();
    _autoLogout();
    return true;
  }

  void logout() async {
    _token = null;
    _userId = null;
    _userEmail = null;
    _userName = null;
    _expiryDate = null;
    if (_authTimer != null) {
      _authTimer.cancel();
    }
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();

    prefs.clear();
  }

  void _autoLogout() {
    if (_authTimer != null) {
      _authTimer.cancel();
    }
    final timeToExpiry = _expiryDate.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
  }
}
