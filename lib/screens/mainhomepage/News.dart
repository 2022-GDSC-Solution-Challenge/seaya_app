import 'package:flutter/material.dart';
import 'package:seaya_app/widgets/menuwidget/Menu.dart';
import 'package:seaya_app/screens/loginpage/login.dart';
import 'package:seaya_app/screens/mainhomepage/Sea.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

// ignore: camel_case_types
class _NewsState extends State<News> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
                height: 15,
              ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(0.0),
              children: [
                Container(
                  height: 205,
                  child: Stack(
                    children: [
                      Positioned(
                          top: 35,
                          child: Material(
                            child: Container(
                              height: 160.0,
                              width: width * 0.91,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(0.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        offset: const Offset(-1.0, 1.0),
                                        blurRadius: 10.0,
                                        spreadRadius: 1.0),
                                  ]),
                            ),
                          )),
                      Positioned(
                        top: 0,
                        left: 10,
                        child: Card(
                          elevation: 10.0,
                          shadowColor: Colors.grey.withOpacity(0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            height: 180,
                            width: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: const DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(""),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          top: 50,
                          left: 160,
                          child: Container(
                            height: 150,
                            width: 180,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Title",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color.fromARGB(255, 37, 83, 182),
                                        fontFamily: 'PTSansBold'),
                                  ),
                                  Text(
                                    "Date, Name",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey,
                                        fontFamily: 'PTSansRegular'),
                                  ),
                                  Divider(
                                    color: Colors.black,
                                  ),
                                  Text(
                                    "content of the article",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color.fromARGB(255, 68, 68, 68),
                                        fontFamily: 'PTSansBold'),
                                  ),
                                ]),
                          ))
                    ],
                  ),
                ),
                Container(
                  height: 205,
                  child: Stack(
                    children: [
                      Positioned(
                          top: 35,
                          child: Material(
                            child: Container(
                              height: 160.0,
                              width: width * 0.91,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(0.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        offset: const Offset(-1.0, 1.0),
                                        blurRadius: 10.0,
                                        spreadRadius: 1.0),
                                  ]),
                            ),
                          )),
                      Positioned(
                        top: 0,
                        left: 10,
                        child: Card(
                          elevation: 10.0,
                          shadowColor: Colors.grey.withOpacity(0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            height: 180,
                            width: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: const DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(""),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          top: 50,
                          left: 160,
                          child: Container(
                            height: 150,
                            width: 180,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Title",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color.fromARGB(255, 37, 83, 182),
                                        fontFamily: 'PTSansBold'),
                                  ),
                                  Text(
                                    "Date, Name",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey,
                                        fontFamily: 'PTSansRegular'),
                                  ),
                                  Divider(
                                    color: Colors.black,
                                  ),
                                  Text(
                                    "content of the article",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color.fromARGB(255, 68, 68, 68),
                                        fontFamily: 'PTSansBold'),
                                  ),
                                ]),
                          ))
                    ],
                  ),
                ),
                Container(
                  height: 205,
                  child: Stack(
                    children: [
                      Positioned(
                          top: 35,
                          child: Material(
                            child: Container(
                              height: 160.0,
                              width: width * 0.91,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(0.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        offset: const Offset(-1.0, 1.0),
                                        blurRadius: 10.0,
                                        spreadRadius: 1.0),
                                  ]),
                            ),
                          )),
                      Positioned(
                        top: 0,
                        left: 10,
                        child: Card(
                          elevation: 10.0,
                          shadowColor: Colors.grey.withOpacity(0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            height: 180,
                            width: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: const DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(""),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          top: 50,
                          left: 160,
                          child: Container(
                            height: 150,
                            width: 180,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Title",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color.fromARGB(255, 37, 83, 182),
                                        fontFamily: 'PTSansBold'),
                                  ),
                                  Text(
                                    "Date, Name",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey,
                                        fontFamily: 'PTSansRegular'),
                                  ),
                                  Divider(
                                    color: Colors.black,
                                  ),
                                  Text(
                                    "content of the article",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color.fromARGB(255, 68, 68, 68),
                                        fontFamily: 'PTSansBold'),
                                  ),
                                ]),
                          ))
                    ],
                  ),
                ),
                Container(
                  height: 205,
                  child: Stack(
                    children: [
                      Positioned(
                          top: 35,
                          child: Material(
                            child: Container(
                              height: 160.0,
                              width: width * 0.91,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(0.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        offset: const Offset(-1.0, 1.0),
                                        blurRadius: 10.0,
                                        spreadRadius: 1.0),
                                  ]),
                            ),
                          )),
                      Positioned(
                        top: 0,
                        left: 10,
                        child: Card(
                          elevation: 10.0,
                          shadowColor: Colors.grey.withOpacity(0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            height: 180,
                            width: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: const DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(""),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          top: 50,
                          left: 160,
                          child: Container(
                            height: 150,
                            width: 180,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Title",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color.fromARGB(255, 37, 83, 182),
                                        fontFamily: 'PTSansBold'),
                                  ),
                                  Text(
                                    "Date, Name",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey,
                                        fontFamily: 'PTSansRegular'),
                                  ),
                                  Divider(
                                    color: Colors.black,
                                  ),
                                  Text(
                                    "content of the article",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color.fromARGB(255, 68, 68, 68),
                                        fontFamily: 'PTSansBold'),
                                  ),
                                ]),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
