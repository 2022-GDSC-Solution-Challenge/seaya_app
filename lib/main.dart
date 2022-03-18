import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seaya_app/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
