import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seaya_app/widgets/naviwidget/Navigation.dart';
import 'package:seaya_app/screens/loginpage/login.dart';
import 'package:seaya_app/utilities/Setdata.dart';

class Authservice {
  final _authInstance = FirebaseAuth.instance;

  String? token;
  //sign in with email & password
  Future signIn(context, String _userEmail, String _userPassword) async {
    try {
      final newUser = await _authInstance.signInWithEmailAndPassword(
        email: _userEmail,
        password: _userPassword,
      );

      if (newUser.user != null) {
        //await setCurrentUser(_authInstance, null);
        print(await _authInstance.currentUser!.getIdToken(true));

        token = await _authInstance.currentUser!.getIdToken(true);
        String uid = await _authInstance.currentUser!.uid;
        //setUserData(token);
        final point = await loginUserData(token, uid);
        if (point! == 1) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Navigation(key: UniqueKey())));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Your data doesn't exist.")),
          );
        }
      }
    } catch (error) {
      print('error: ${error}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Check your email and password.')),
      );
    }
  }

  // register with email & password
  Future signUp(context, String _userEmail, String _userPassword,
      String _userName) async {
    try {
      print(_userEmail);
      final newUser = await _authInstance.createUserWithEmailAndPassword(
        email: _userEmail.trim(), //이메일 형식 에러가 나서 trim으로 문자열 정리
        password: _userPassword,
      );

      if (newUser.user != null) {
        await newUser.user!.updateDisplayName(_userName);

        //휴대폰 사용은 추후 이야기
        //newUser.user!.updatePhoneNumber(_userPhone);
        token = await _authInstance.currentUser!.getIdToken(true);
        createUserData(token, _userName);

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LogIn(),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('회원가입 성공!')),
        );
      }
    } catch (e) {
      print('error: ${e}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('잘못된 이메일 형식입니다.')),
      );
    }
  }

  //sign out
  Future signOut() async {
    try {
      print('sign out complete');
      return await _authInstance.signOut();
    } catch (e) {
      print('sign out failed');
      print(e.toString());
      return null;
    }
  }
}
