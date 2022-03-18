import 'package:flutter/material.dart';

import 'package:seaya_app/screens/qandmpage/Quiz.dart';

class quizEnd extends StatefulWidget {
  const quizEnd({Key? key}) : super(key: key);

  @override
  _quizEndState createState() => _quizEndState();
}

// ignore: camel_case_types
class _quizEndState extends State<quizEnd> with SingleTickerProviderStateMixin {
  Widget build(BuildContext context) {
   final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    
    final standardDeviceWidth = 390;
    final standardDeviceHeight = 844;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SafeArea(
                child: Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Column(
                      children: [
                        Positioned(
                          top: 10,
                          left: 2.5,
                          child: Card(
                            elevation: 5.0,
                            shadowColor: Color.fromARGB(255, 200, 213, 233)
                                .withOpacity(0.8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Container(
                              padding: EdgeInsets.only(
                                top: 25,
                              ),
                              height: 150,
                              width: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(
                                      "수고하셨습니다!",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontFamily: 'PTSansRegular',
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "YoonJin님의 점수는",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontFamily: 'PTSansRegular',
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                      "4/5",
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 43, 100, 185),
                                        fontSize: 35,
                                        fontFamily: 'PTSansBold',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: ListView(
                            padding: const EdgeInsets.all(0.0),
                            children: [
                              Container(
                                height: 195,
                                child: Stack(
                                  children: [
                                    Positioned(
                                        top: 5,
                                        child: Material(
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                                top: 7, left: 20),
                                            child: Text(
                                              'Q1',
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                color: Color(0xff2B2B2B),
                                                fontFamily: 'PTSansRegular',
                                              ),
                                            ),
                                            height: 185.0,
                                            width: width * 0.91,
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 231, 240, 245),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.2),
                                                      offset: const Offset(
                                                          -1.0, 1.0),
                                                      blurRadius: 0,
                                                      spreadRadius: 0),
                                                ]),
                                          ),
                                        )),
                                    Container(
                                      padding: const EdgeInsets.only(
                                        top: 43,
                                      ),
                                      child: Center(
                                        child: Column(children: [
                                          SizedBox(
                                            height: 30,
                                            width: 300,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Color.fromARGB(
                                                      255,
                                                      255,
                                                      255,
                                                      255), //background color of button
                                                  side: BorderSide(
                                                      width: 1,
                                                      color: Color.fromARGB(
                                                          255,
                                                          185,
                                                          203,
                                                          218)), //border width and color
                                                  elevation:
                                                      3, //elevation of button
                                                  shape: RoundedRectangleBorder(
                                                      //to set border radius to button
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                  padding: EdgeInsets.all(
                                                      0) //content padding inside button
                                                  ),
                                              onPressed: () {},
                                              child: const Text(
                                                '1. Test',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontFamily: 'PTSansRegular',
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          SizedBox(
                                            height: 30,
                                            width: 300,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Color.fromARGB(
                                                      255,
                                                      255,
                                                      255,
                                                      255), //background color of button
                                                  side: BorderSide(
                                                      width: 1,
                                                      color: Color.fromARGB(
                                                          255,
                                                          185,
                                                          203,
                                                          218)), //border width and color
                                                  elevation:
                                                      3, //elevation of button
                                                  shape: RoundedRectangleBorder(
                                                      //to set border radius to button
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                  padding: EdgeInsets.all(
                                                      0) //content padding inside button
                                                  ),
                                              onPressed: () {},
                                              child: const Text(
                                                '2. Test',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontFamily: 'PTSansRegular',
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          SizedBox(
                                            height: 30,
                                            width: 300,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Color.fromARGB(
                                                      255,
                                                      255,
                                                      255,
                                                      255), //background color of button
                                                  side: BorderSide(
                                                      width: 1,
                                                      color: Color.fromARGB(
                                                          255,
                                                          185,
                                                          203,
                                                          218)), //border width and color
                                                  elevation:
                                                      3, //elevation of button
                                                  shape: RoundedRectangleBorder(
                                                      //to set border radius to button
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                  padding: EdgeInsets.all(
                                                      0) //content padding inside button
                                                  ),
                                              onPressed: () {},
                                              child: const Text(
                                                '3. Test',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontFamily: 'PTSansRegular',
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          SizedBox(
                                            height: 30,
                                            width: 300,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Color.fromARGB(
                                                      255,
                                                      255,
                                                      255,
                                                      255), //background color of button
                                                  side: BorderSide(
                                                      width: 1,
                                                      color: Color.fromARGB(
                                                          255,
                                                          185,
                                                          203,
                                                          218)), //border width and color
                                                  elevation:
                                                      3, //elevation of button
                                                  shape: RoundedRectangleBorder(
                                                      //to set border radius to button
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                  padding: EdgeInsets.all(
                                                      0) //content padding inside button
                                                  ),
                                              onPressed: () {},
                                              child: const Text(
                                                '4. Test',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontFamily: 'PTSansRegular',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ]),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 195,
                                child: Stack(
                                  children: [
                                    Positioned(
                                        top: 5,
                                        child: Material(
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                                top: 7, left: 20),
                                            child: Text(
                                              'Q2',
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                color: Color(0xff2B2B2B),
                                                fontFamily: 'PTSansRegular',
                                              ),
                                            ),
                                            height: 185.0,
                                            width: width * 0.91,
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 231, 240, 245),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.2),
                                                      offset: const Offset(
                                                          -1.0, 1.0),
                                                      blurRadius: 0,
                                                      spreadRadius: 0),
                                                ]),
                                          ),
                                        )),
                                    Container(),
                                  ],
                                ),
                              ),
                              Container(
                                height: 195,
                                child: Stack(
                                  children: [
                                    Positioned(
                                        top: 5,
                                        child: Material(
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                                top: 7, left: 20),
                                            child: Text(
                                              'Q3',
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                color: Color(0xff2B2B2B),
                                                fontFamily: 'PTSansRegular',
                                              ),
                                            ),
                                            height: 185.0,
                                            width: width * 0.91,
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 231, 240, 245),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.2),
                                                      offset: const Offset(
                                                          -1.0, 1.0),
                                                      blurRadius: 0,
                                                      spreadRadius: 0),
                                                ]),
                                          ),
                                        )),
                                    Container(),
                                  ],
                                ),
                              ),
                              Container(
                                height: 195,
                                child: Stack(
                                  children: [
                                    Positioned(
                                        top: 5,
                                        child: Material(
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                                top: 7, left: 20),
                                            child: Text(
                                              'Q4',
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                color: Color(0xff2B2B2B),
                                                fontFamily: 'PTSansRegular',
                                              ),
                                            ),
                                            height: 185.0,
                                            width: width * 0.91,
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 231, 240, 245),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.2),
                                                      offset: const Offset(
                                                          -1.0, 1.0),
                                                      blurRadius: 0,
                                                      spreadRadius: 0),
                                                ]),
                                          ),
                                        )),
                                    Container(),
                                  ],
                                ),
                              ),
                              Container(
                                height: 195,
                                child: Stack(
                                  children: [
                                    Positioned(
                                        top: 5,
                                        child: Material(
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                                top: 7, left: 20),
                                            child: Text(
                                              'Q5',
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                color: Color(0xff2B2B2B),
                                                fontFamily: 'PTSansRegular',
                                              ),
                                            ),
                                            height: 185.0,
                                            width: width * 0.91,
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 231, 240, 245),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.2),
                                                      offset: const Offset(
                                                          -1.0, 1.0),
                                                      blurRadius: 0,
                                                      spreadRadius: 0),
                                                ]),
                                          ),
                                        )),
                                    Container(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.only(
                                left: 130,
                                right: 130,
                                top: 12,
                                bottom: 12,
                              )),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromARGB(255, 171, 195, 214))),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Go Home',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: 'PTSansRegular',
                            ),
                          ),
                        ),
                      ],
                    )))
          ],
        ));
  }
}
