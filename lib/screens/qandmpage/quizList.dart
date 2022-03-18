import 'package:flutter/material.dart';

import 'package:seaya_app/screens/qandmpage/Quiz.dart';
import 'package:seaya_app/screens/qandmpage/quizEnd.dart';

class quizList extends StatefulWidget {
  const quizList({Key? key}) : super(key: key);

  @override
  _quizListState createState() => _quizListState();
}

// ignore: camel_case_types
class _quizListState extends State<quizList>
    with SingleTickerProviderStateMixin {
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              text: "Question 1",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontFamily: 'PTSansRegular',
                              ),
                              children: [
                                TextSpan(
                                  text: "/5",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'PTSansRegular',
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: Color.fromARGB(255, 65, 65, 65),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.all(17),
                            width: 350,
                            height: 370,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 231, 240, 245),
                                borderRadius: BorderRadius.circular((25))),
                            child: Column(children: [
                              Text(
                                "세계환경의 날은 언제일까요?",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'PTSansRegular',
                                ),
                              ),
                              SizedBox(height: 70),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 50,
                                    width: 320,
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
                                            elevation: 3, //elevation of button
                                            shape: RoundedRectangleBorder(
                                                //to set border radius to button
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            padding: EdgeInsets.all(
                                                15) //content padding inside button
                                            ),
                                        onPressed: () {
                                          setState(() {
                                            Navigator.of(context)
                                                .pushReplacement(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const quizList(),
                                              ),
                                            );
                                          });
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '1. Test',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontFamily: 'PTSansRegular',
                                              ),
                                            ),
                                          ],
                                        )),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    width: 320,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Color.fromARGB(255, 255, 255,
                                              255), //background color of button
                                          side: BorderSide(
                                              width: 1,
                                              color: Color.fromARGB(
                                                  255,
                                                  185,
                                                  203,
                                                  218)), //border width and color
                                          elevation: 3, //elevation of button
                                          shape: RoundedRectangleBorder(
                                              //to set border radius to button
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          padding: EdgeInsets.all(
                                              15) //content padding inside button
                                          ),
                                      onPressed: () {
                                        setState(() {
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const quizList(),
                                            ),
                                          );
                                        });
                                      },
                                      child: const Text(
                                        '2. Test',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontFamily: 'PTSansRegular',
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    width: 320,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Color.fromARGB(255, 255, 255,
                                              255), //background color of button
                                          side: BorderSide(
                                              width: 1,
                                              color: Color.fromARGB(
                                                  255,
                                                  185,
                                                  203,
                                                  218)), //border width and color
                                          elevation: 3, //elevation of button
                                          shape: RoundedRectangleBorder(
                                              //to set border radius to button
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          padding: EdgeInsets.all(
                                              15) //content padding inside button
                                          ),
                                      onPressed: () {
                                        setState(() {
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const quizList(),
                                            ),
                                          );
                                        });
                                      },
                                      child: const Text(
                                        '3. Test',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontFamily: 'PTSansRegular',
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    width: 320,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Color.fromARGB(255, 255, 255,
                                              255), //background color of button
                                          side: BorderSide(
                                              width: 1,
                                              color: Color.fromARGB(
                                                  255,
                                                  185,
                                                  203,
                                                  218)), //border width and color
                                          elevation: 3, //elevation of button
                                          shape: RoundedRectangleBorder(
                                              //to set border radius to button
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          padding: EdgeInsets.all(
                                              15) //content padding inside button
                                          ),
                                      onPressed: () {
                                        setState(() {
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const quizEnd(),
                                            ),
                                          );
                                        });
                                      },
                                      child: const Text(
                                        '4. Test',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontFamily: 'PTSansRegular',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                          )
                        ])))
          ],
        ));
  }
}
