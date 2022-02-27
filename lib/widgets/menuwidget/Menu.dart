import 'package:flutter/material.dart';
import 'package:seaya_app/widgets/naviwidget/Navigation.dart';
import 'package:seaya_app/screens/loginpage/logIn.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              //appbar----------
              SizedBox(
                width: 354,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10.0,
                    ),
                    const Image(
                      width: 53.0,
                      image: AssetImage(
                        'images/seaya_logo.png',
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    const Text("Seaya",
                        style: TextStyle(
                            color: Color(0xff02171a),
                            fontFamily: 'PTSansRegular',
                            letterSpacing: 2.5,
                            fontSize: 15.0),
                        textAlign: TextAlign.left),
                    const SizedBox(
                      width: 180.0,
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
                height: 30,
              ),
              //menu buttons-----------
              Center(
                child: Column(children: [
                  //mypage button---
                  Container(
                    width: 310.0,
                    height: 50.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                      primary: const Color(0xffF3F5F9),
                      shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Color.fromARGB(134, 236, 236, 236),
                      ),
                      borderRadius: BorderRadius.circular(7),
                      ),),
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
                          /*
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => BasicPage(),
                                    ),
                                  );
                                  */
                        });
                      },
                    
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  //setting button---
                  Container(
                    width: 310.0,
                    height: 50.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 219, 231, 240),
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                      )),
                      child: const Text(
                        'Setting',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Color(0xff2B2B2B),
                          fontFamily: 'PTSansRegular',
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          /*
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => BasicPage(),
                                    ),
                                  );
                                  */
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  //logout button---
                  Container(
                    width: 310.0,
                    height: 50.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                      primary: const Color(0xffF3F5F9),
                      shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Color.fromARGB(134, 236, 236, 236),
                      ),
                      borderRadius: BorderRadius.circular(7),
                    ),),
                      child: const Text(
                        'Logout',
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
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
