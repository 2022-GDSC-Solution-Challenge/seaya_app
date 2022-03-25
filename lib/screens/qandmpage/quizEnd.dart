import 'package:flutter/material.dart';

import 'package:seaya_app/screens/qandmpage/Quiz.dart';
import 'package:seaya_app/widgets/naviwidget/Navigation.dart';

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
    final double sh = (height / standardDeviceHeight);
    final double sd = (width / standardDeviceWidth);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(40 * sd, 20 * sh, 40 * sd, 10 * sh),
              //퀴즈 총결과 화면
              child: quizcard(context, sh, sd),
            ),
            SizedBox(
              height: 10 * sh,
            ),

            //퀴즈 선지와 정답 화면
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return quizanswer(context, sh, sd);
                  }),
            ),

            SizedBox(
              height: 10 * sh,
            ),
            //돌아가기 버튼
            Padding(
              padding: EdgeInsets.fromLTRB(20 * sd, 5 * sh, 20 * sd, 5 * sh),
              child: ElevatedButton(
                style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all<EdgeInsets>(EdgeInsets.only(
                      left: 130 * sd,
                      right: 130 * sd,
                      top: 12 * sh,
                      bottom: 12 * sh,
                    )),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 171, 195, 214))),
                child: const Text(
                  'Go Home',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontFamily: 'PTSansRegular',
                  ),
                ),
                onPressed: () {
                  setState(() {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const Navigation(),
                      ),
                    );
                  });
                },
              ),
            ),
            SizedBox(
              height: 10 * sh,
            ),
          ],
        ),
      ),
    );
  }
}

//결과점수카드
Widget quizcard(BuildContext context, double sh, double sd) {
  return Card(
    elevation: 5.0,
    shadowColor: Color.fromARGB(255, 200, 213, 233).withOpacity(0.8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: Container(
      //margin: EdgeInsets.fromLTRB(10,10,10,10),
      padding: EdgeInsets.fromLTRB(0, 25 * sh, 0, 25 * sh),

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
                color: Color.fromARGB(255, 43, 100, 185),
                fontSize: 35,
                fontFamily: 'PTSansBold',
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget quizanswer(BuildContext context, double sh, double sd) {
  return Container(
    margin: EdgeInsets.fromLTRB(30 * sd, 0, 30 * sd, 10 * sh),
    padding: EdgeInsets.fromLTRB(10 * sd, 20 * sh, 10 * sd, 20 * sh),
    //height: 185.0 * sh,
    width: 300 * sd,
    decoration: BoxDecoration(
        color: Color.fromARGB(255, 231, 240, 245),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(-1.0, 1.0),
              blurRadius: 0,
              spreadRadius: 0),
        ]),
    child: Column(
      children: [
        Container(
          width : 300 * sd,
          //color: Colors.redAccent,
        child: Text(
          'Q1',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xff2B2B2B),
            fontFamily: 'PTSansRegular',
          ),
        ),
        ),
        Container(
          padding: EdgeInsets.only(
            top: 10 * sh,
          ),
          child: Column(children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                    width: 1, color: Color.fromARGB(255, 185, 203, 218)),
              ),

              padding: EdgeInsets.fromLTRB(
                  120, 7, 120, 7), //content padding inside button

              child: const Text(
                '1. Test',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'PTSansRegular',
                ),
              ),
            ),
            SizedBox(
              height: 5 * sh,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                    width: 1, color: Color.fromARGB(255, 185, 203, 218)),
              ),

              padding: EdgeInsets.fromLTRB(
                  120, 7, 120, 7), //content padding inside button

              child: const Text(
                '1. Test',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'PTSansRegular',
                ),
              ),
            ),
            SizedBox(
              height: 5 * sh,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                    width: 1, color: Color.fromARGB(255, 185, 203, 218)),
              ),

              padding: EdgeInsets.fromLTRB(
                  120, 7, 120, 7), //content padding inside button

              child: const Text(
                '1. Test',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'PTSansRegular',
                ),
              ),
            ),
            SizedBox(
              height: 5 * sh,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                    width: 1, color: Color.fromARGB(255, 185, 203, 218)),
              ),

              padding: EdgeInsets.fromLTRB(
                  120, 7, 120, 7), 

              child: const Text(
                '1. Test',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'PTSansRegular',
                ),
              ),
            ),
          ]),
        ),
      ],
    ),
  );
}
