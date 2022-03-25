import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:seaya_app/screens/loginpage/logIn.dart';
import 'package:seaya_app/screens/splash.dart';
import 'package:seaya_app/screens/mainhomepage/newsDialog.dart';
import 'package:seaya_app/screens/mainhomepage/Campaign.dart';
import 'package:seaya_app/widgets/naviwidget/Navigation.dart';
import 'package:seaya_app/providers/UserProvider.dart';

//비동기 처리 위해 main async로 수행
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //flutter코어엔진 초기화
  await Firebase.initializeApp(); //파베 초기화
  runApp(
    MyApp()
    );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home:        
         Navigation()// child 하위에 모든 것들은 Provider에 접근
       );
  }
}
