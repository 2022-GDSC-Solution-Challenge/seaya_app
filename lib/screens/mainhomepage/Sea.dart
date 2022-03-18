import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:seaya_app/widgets/menuwidget/Menu.dart';
import 'package:seaya_app/screens/loginpage/login.dart';

class Sea extends StatefulWidget {
  const Sea({Key? key}) : super(key: key);

  @override
  _SeaState createState() => _SeaState();
}

// ignore: camel_case_types
class _SeaState extends State<Sea> with SingleTickerProviderStateMixin {
  //use "with SingleThickerProviderStateMixin" at last of class declaration
  //where you have to pass "vsync" argument, add this

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
    final double sh = (height / standardDeviceHeight);
    final double sd = (width / standardDeviceWidth);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 10 * (height / standardDeviceHeight),
            ),
            Card(
              elevation: 5.0,
              margin: EdgeInsets.fromLTRB(10*sd,10 * sh, 10*sd, 10 * sh),
              shadowColor: Colors.grey.withOpacity(0.4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                padding: new EdgeInsets.fromLTRB(15*sd, 20 * sh, 15*sd, 20*sh),
                width: 340 * (width / standardDeviceWidth),
                //height: 680 * (height / standardDeviceHeight),
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(10.0),
                // ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    //user info card
                    Card(
                      elevation: 3.0,
                      shadowColor: Colors.grey.withOpacity(0.4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                        //height: 45 * (height / standardDeviceHeight),
                        //width: 300 * (width / standardDeviceWidth),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          
                        ),
                        child: Container(
                          padding:  EdgeInsets.fromLTRB(20*sd,13*sh,15*sd,13*sh),
                          child: Row(children: [
                            //사용자 이름
                            Text(
                              "YoonJin",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontFamily: 'PTSansRegular'),
                            ),
                            SizedBox(
                              width: 160 * (width / standardDeviceWidth),
                            ),
                            //상위 몇 퍼센트 인지
                            Text(
                              "Top 30%",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontFamily: 'PTSansRegular'),
                            ),
                          ]),
                        ),
                      ),
                    ),
                    //기여도 -> 총 점수 10점 당 0.2%씩 증가 (ex. 총점수 72, 기여도 1.4%)
                    SizedBox(
                      height: 4 * (height / standardDeviceHeight),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(children: [
                        Text(
                          "1.4 %",
                          style: TextStyle(
                              fontSize: 32,
                              color: Color(0xff0068C1),
                              fontFamily: 'PTSansRegular'),
                        ),
                        SizedBox(
                          height: 7 * (height / standardDeviceHeight),
                        ),
                        Text(
                          " the view of the sea \n has been expanded.",
                          style: TextStyle(
                              fontSize: 17,
                              letterSpacing: 1.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: 'PTSansRegular'),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 20 * (height / standardDeviceHeight),
                    ),
                    //메인 배경 이미지
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          child: Image(
                            width: 240.0 * (width / standardDeviceWidth),
                            image: AssetImage(
                              'images/circle.png',
                            ),
                          ),
                        ),
                        //),
                        //북극곰 이미지
                        Container(
                          child: Image(
                            width: 115.0 * (width / standardDeviceWidth),
                            image: AssetImage(
                              'images/mainImage.png',
                            ),
                          ),
                        ),
                        // ),
                        Positioned(
                          top: 43 * (height / standardDeviceHeight),
                          left: 1 * (width / standardDeviceWidth),
                          child: Container(
                            width: 82.0 * (width / standardDeviceWidth),
                            //height: 82.0 * (height / standardDeviceHeight),
                            padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
                            decoration: new BoxDecoration(
                              color: Color.fromARGB(255, 118, 200, 241),
                              shape: BoxShape.circle,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Total",
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontFamily: 'PTSansRegular'),
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                  overflow: TextOverflow.fade,
                                ),
                                SizedBox(
                                  height: 3 * (height / standardDeviceHeight),
                                ),
                                Text(
                                  "72",
                                  style: TextStyle(
                                      fontSize: 32,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontFamily: 'PTSansRegular'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30 * (height / standardDeviceHeight),
                    ),
                    //세부점수 카드
                    Card(
                      elevation: 3.0,
                      shadowColor: Colors.grey.withOpacity(0.4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Container(
                        //height: 75 * (height / standardDeviceHeight),
                        width: 300 * (width / standardDeviceWidth),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          //color: Color.fromARGB(255, 43, 145, 204),
                        ),
                        child: Container(
                          padding:  EdgeInsets.fromLTRB(0,10*sh,0,10*sh),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //퀴즈 점수
                                Container(
                                  //height: 63 * (height / standardDeviceHeight),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Quiz",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontFamily: 'PTSansRegular'),
                                      ),
                                      Text(
                                        "12",
                                        style: TextStyle(
                                            fontSize: 28,
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontFamily: 'PTSansRegular'),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 24.5 * (width / standardDeviceWidth),
                                ),
                                Container(
                                  width: 1 * (width / standardDeviceWidth),
                                  height: 35 * (height / standardDeviceHeight),
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 24.5 * (width / standardDeviceWidth),
                                ),
                                //뉴스&켐페인 점수
                                Container(
                                  //color: Colors.blue,
                                  //height: 63 * (height / standardDeviceHeight),

                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "News / Campaign",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontFamily: 'PTSansRegular'),
                                      ),
                                      Text(
                                        "27",
                                        style: TextStyle(
                                            fontSize: 28,
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontFamily: 'PTSansRegular'),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 24.5 * (width / standardDeviceWidth),
                                ),
                                Container(
                                  width: 1 * (width / standardDeviceWidth),
                                  height: 35 * (height / standardDeviceHeight),
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 24.5,
                                ),
                                //미션 점수
                                Container(
                                  ///color: Colors.blue,
                                  //height: 63 * (height / standardDeviceHeight),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Mission",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontFamily: 'PTSansRegular'),
                                      ),
                                      Text(
                                        "33",
                                        style: TextStyle(
                                            fontSize: 28,
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontFamily: 'PTSansRegular'),
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10 * (height / standardDeviceHeight),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
