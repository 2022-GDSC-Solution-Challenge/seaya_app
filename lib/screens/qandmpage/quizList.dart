import 'package:flutter/material.dart';
//import 'package:flutter_swiper/flutter_swiper.dart';

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
    final double sh = (height / standardDeviceHeight);
    final double sd = (width / standardDeviceWidth);

    return Scaffold(
        backgroundColor: Colors.white,
        body:  quizpiece(context, sh, sd)
              
        );
  }

  Widget quizpiece(BuildContext context, double sh, double sd) {
   // print(index);
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(30 * sd, 80 * sh, 30 * sd, 50 * sh),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //퀴즈 이름
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
              width: 350 * sd,
              height: 370,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 231, 240, 245),
                  borderRadius: BorderRadius.circular((25))),
              child: Column(
                children: [
                  //quiz content
                  Text(
                    "세계환경의 날은 언제일까요?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'PTSansRegular',
                    ),
                  ),
                  SizedBox(height: 70 * sh),
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 255, 255, 255),
                            side: BorderSide(
                                width: 1,
                                color: Color.fromARGB(255, 185, 203, 218)),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            padding: EdgeInsets.fromLTRB(
                                120 * sd, 17 * sh, 120 * sd, 17 * sh)
                            //content padding inside button
                            ),
                        onPressed: () {
                          //if (index != 5) {
                            setState(() {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const quizList(),
                                ),
                              );
                            });
                         // }
                        },
                        child: Text(
                          '1. Test',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'PTSansRegular',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10 * sh,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 255, 255, 255),
                              side: BorderSide(
                                  width: 1,
                                  color: Color.fromARGB(255, 185, 203,
                                      218)), //border width and color
                              elevation: 3, //elevation of button
                              shape: RoundedRectangleBorder(
                                  //to set border radius to button
                                  borderRadius: BorderRadius.circular(30)),
                              padding: EdgeInsets.fromLTRB(
                                  120 * sd, 17 * sh, 120 * sd, 17 * sh)
                              //content padding inside button
                              ),
                          onPressed: () {
                           // if (index != 5) {
                              setState(() {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => const quizList(),
                                  ),
                                );
                              });
                          //  }
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '2. Test',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'PTSansRegular',
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 10 * sh,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 255, 255,
                                255), //background color of button
                            side: BorderSide(
                                width: 1,
                                color: Color.fromARGB(255, 185, 203,
                                    218)), //border width and color
                            elevation: 3, //elevation of button
                            shape: RoundedRectangleBorder(
                                //to set border radius to button
                                borderRadius: BorderRadius.circular(30)),
                            padding: EdgeInsets.fromLTRB(
                                120 * sd, 17 * sh, 120 * sd, 17 * sh)
                            //content padding inside button
                            ),
                        onPressed: () {
                          //if (index != 5) {
                            setState(() {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const quizList(),
                                ),
                              );
                            });
                         // }
                        },
                        child: Text(
                          '3. Test',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'PTSansRegular',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10 * sh,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 255, 255,
                                255), //background color of button
                            side: BorderSide(
                                width: 1,
                                color: Color.fromARGB(255, 185, 203,
                                    218)), //border width and color
                            elevation: 3, //elevation of button
                            shape: RoundedRectangleBorder(
                                //to set border radius to button
                                borderRadius: BorderRadius.circular(30)),
                            padding: EdgeInsets.fromLTRB(
                                120 * sd, 17 * sh, 120 * sd, 17 * sh)
                            //content padding inside button
                            ),
                        onPressed: () {
                         // if (index != 5) {
                            setState(() {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const quizList(),
                                ),
                              );
                            });
                         // }
                        },
                        child: Text(
                          '4. Test',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'PTSansRegular',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10 * sh,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
