import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:seaya_app/widgets/menuwidget/Menu.dart';
import 'package:seaya_app/screens/loginpage/login.dart';
import 'package:seaya_app/utilities/Seawaves.dart';
import 'package:seaya_app/utilities/Setdata.dart';
import 'package:seaya_app/models/userModel.dart';

import '../../providers/UserProvider.dart';

class Sea extends StatefulWidget {
  const Sea({Key? key}) : super(key: key);

  @override
  _SeaState createState() => _SeaState();
}

// ignore: camel_case_types
class _SeaState extends State<Sea> with SingleTickerProviderStateMixin {
  late UserProvider _userProvider;
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
    _userProvider = Provider.of<UserProvider>(context, listen: true);

    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

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
                //카드 둥글게 처리해주는거 살리는 코드
                clipBehavior: Clip.antiAlias,
                elevation: 5.0,
                margin: EdgeInsets.fromLTRB(10 * sd, 10 * sh, 10 * sd, 10 * sh),
                shadowColor: Colors.grey.withOpacity(0.4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Stack(children: [
                  Positioned.fill(
                    child: Seawaves(),
                  ),
                  _seaCard(context, sh, sd, _userProvider),
                ])),
            SizedBox(
              height: 10 * (height / standardDeviceHeight),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _seaCard(BuildContext context, double sh, double sw, UserProvider usp) {
  double h = sh;
  double w = sw;

  return Container(
    padding: new EdgeInsets.fromLTRB(15 * w, 20 * h, 15 * w, 20 * h),
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
              padding: EdgeInsets.fromLTRB(20 * w, 13 * h, 15 * w, 13 * h),
              child: Row(children: [
                //사용자 이름
                Text(
                  usp.user!.name, //'이름',
                  style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'PTSansRegular'),
                ),
                SizedBox(
                  width: 160 * w,
                ),
                //상위 몇 퍼센트 인지
                Text(
                  double.parse(usp.user!.percentile).round().toString() + "%",
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
          height: 4 * h,
        ),
        Container(
          padding: const EdgeInsets.only(top: 20),
          child: Column(children: [
            Text(
              (usp.user!.totalp * 0.02).toString() + "%",
              style: TextStyle(
                  fontSize: 32,
                  color: Color(0xff0068C1),
                  fontFamily: 'PTSansRegular'),
            ),
            SizedBox(
              height: 7 * h,
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
          height: 20 * h,
        ),
        //메인 배경 이미지
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              child: Image(
                width: 240.0 * w,
                image: AssetImage(
                  'images/circle.png',
                ),
              ),
            ),
            //),
            //북극곰 이미지
            Container(
              child: Image(
                width: 115.0 * w,
                image: AssetImage(
                  'images/mainImage.png',
                ),
              ),
            ),
            // ),
            Positioned(
              top: 43 * h,
              left: 1 * w,
              child: Container(
                width: 82.0 * w,
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
                      height: 3 * h,
                    ),
                    Text(
                      usp.user!.totalp.toString(), //"72",
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
          height: 30 * h,
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
            width: 300 * w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              //color: Color.fromARGB(255, 43, 145, 204),
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 10 * sh, 0, 10 * sh),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                        usp.user!.quizp.toString(), //"12",
                        style: TextStyle(
                            fontSize: 28,
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontFamily: 'PTSansRegular'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 24.5 * w,
                ),
                Container(
                  width: 1 * w,
                  height: 35 * h,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 24.5 * w,
                ),
                //뉴스&켐페인 점수
                Container(
                  //color: Colors.blue,
                  //height: 63 * (height / standardDeviceHeight),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "News / Campaign",
                        style: TextStyle(
                            fontSize: 10,
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontFamily: 'PTSansRegular'),
                      ),
                      Text(
                        (usp.user!.newsp + usp.user!.campaignp)
                            .toString(), //"27",
                        style: TextStyle(
                            fontSize: 28,
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontFamily: 'PTSansRegular'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 24.5 * w,
                ),
                Container(
                  width: 1 * w,
                  height: 35 * h,
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Mission",
                        style: TextStyle(
                            fontSize: 10,
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontFamily: 'PTSansRegular'),
                      ),
                      Text(
                        usp.user!.missionp.toString(), //"33",
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
      ],
    ),
  );
}
