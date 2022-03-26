import 'package:flutter/material.dart';
import 'package:seaya_app/widgets/naviwidget/Navigation.dart';
import 'package:seaya_app/screens/loginpage/logIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:seaya_app/screens/loginpage/signUp.dart';
import 'package:seaya_app/utilities/Authservice.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

//메뉴 상세 화면------
class _MenuState extends State<Menu> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    print(height);
    print(width);

    final standardDeviceWidth = 390;
    final standardDeviceHeight = 844;

    final Authservice _auth = Authservice();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              //appbar----------
              SizedBox(
                width: 354 * (width / standardDeviceWidth),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10.0 * (width / standardDeviceWidth),
                    ),
                    Image(
                      width: 53.0 * (width / standardDeviceWidth),
                      image: AssetImage(
                        'images/seaya_logo.png',
                      ),
                    ),
                    SizedBox(
                      width: 10.0 * (width / standardDeviceWidth),
                    ),
                    const Text("Seaya",
                        style: TextStyle(
                            color: Color(0xff02171a),
                            fontFamily: 'PTSansRegular',
                            letterSpacing: 2.5,
                            fontSize: 15.0),
                        textAlign: TextAlign.left),
                    SizedBox(
                      width: 180.0 * (width / standardDeviceWidth),
                    ),
                    IconButton(
                        icon: const Icon(
                          Icons.close,
                          size: 24,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: 30 * (height / standardDeviceHeight),
              ),
              //menu buttons-----------
              Center(
                child: Column(children: [
                  //mypage button---
                  Container(
                    width: 310.0 * (width / standardDeviceWidth),
                    height: 50.0 * (height / standardDeviceHeight),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 219, 231, 240),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Color.fromARGB(134, 236, 236, 236),
                          ),
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      child: const Text(
                        'My page',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Color(0xff2B2B2B),
                          fontFamily: 'PTSansRegular',
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => LogIn(),
                            ),
                          );
                        });
                      },
                    ),
                  ),
                  // SizedBox(
                  //   height: 8 * (height / standardDeviceHeight),
                  // ),
                  // //setting button---
                  // Container(
                  //   width: 310.0 * (width / standardDeviceWidth),
                  //   height: 50.0 * (height / standardDeviceHeight),
                  //   child: ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //         primary: Color.fromARGB(255, 219, 231, 240),
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(7),
                  //         )),
                  //     child: const Text(
                  //       'Setting',
                  //       style: TextStyle(
                  //         fontSize: 12.0,
                  //         color: Color(0xff2B2B2B),
                  //         fontFamily: 'PTSansRegular',
                  //       ),
                  //     ),
                  //     onPressed: () {
                  //       setState(() {
                  //         /*
                  //                 Navigator.of(context).pushReplacement(
                  //                   MaterialPageRoute(
                  //                     builder: (context) => BasicPage(),
                  //                   ),
                  //                 );
                  //                 */
                  //       });
                  //     },
                  //   ),
                  // ),
                  SizedBox(
                    height: 10 * (height / standardDeviceHeight),
                  ),
                  //logout button---
                  Container(
                    width: 310.0 * (width / standardDeviceWidth),
                    height: 50.0 * (height / standardDeviceHeight),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xffF3F5F9),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Color.fromARGB(134, 236, 236, 236),
                          ),
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      child: const Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Color(0xff2B2B2B),
                          fontFamily: 'PTSansRegular',
                        ),
                      ),
                      onPressed: () async {
                        setState(() {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => LogIn(),
                            ),
                          );
                        });
                        await _auth.signOut();
                      },
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
