import 'dart:async';
import 'package:flutter/material.dart';
import 'package:seaya_app/screens/loginpage/login.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  splash createState() => splash();
}

class splash extends State<Splash> {
  // 3초 후 로그인 화면으로 전환
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LogIn()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "images/splash_logo.png",
                      
                      ), fit: BoxFit.fitWidth
                     
                ),
              ),
            ),
             SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
