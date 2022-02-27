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
        body: SingleChildScrollView(
          child: Center(
              child: Column(children: const <Widget>[
            SizedBox(
              height: 330.0,
            ),
            Image(
              width: 90.0,
              image: AssetImage(
                'images/seaya_logo.png',
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Text(
              'SeaYa',
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
                fontFamily: 'PTSansRegular',
                letterSpacing: 3.0,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              'view to the sea',
              style: TextStyle(
                fontSize: 13.0,
                color: Color.fromARGB(255, 49, 96, 119),
                fontFamily: 'PTSansRegular',
                letterSpacing: 3.0,
              ),
            ),
          ])),
        ));
  }
}
