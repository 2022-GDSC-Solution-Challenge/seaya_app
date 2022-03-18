import 'package:flutter/material.dart';

import 'package:seaya_app/screens/qandmpage/Quiz.dart';
import 'package:seaya_app/widgets/menuwidget/appBar.dart';

class missionList extends StatefulWidget {
  const missionList({Key? key}) : super(key: key);

  @override
  _missionListState createState() => _missionListState();
}

class _missionListState extends State<missionList>
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
                              text: "Today Mission",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontFamily: 'PTSansRegular',
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: Color.fromARGB(255, 65, 65, 65),
                          ),
                          SizedBox(
                            height: 10 * (height / standardDeviceHeight),
                          ),
                          Container(
                            padding: EdgeInsets.all(17),
                            width: 350 * (width / standardDeviceWidth),
                            height: 450 * (height / standardDeviceHeight),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 231, 240, 245),
                                borderRadius: BorderRadius.circular((15))),
                            child: Column(children: [
                              Text(
                                "Check completed missions",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: 'PTSansRegular',
                                ),
                              ),
                              SizedBox(height: 12 * (height / standardDeviceHeight)),
                              Expanded(
                                child: ListView(
                                  padding: const EdgeInsets.all(0.0),
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 7),
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border:
                                            Border.all(color: Colors.black26),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "1. Test",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontFamily: 'PTSansRegular',
                                              ),
                                            ),
                                            Container(
                                              width: 20 * (width / standardDeviceWidth),
                                              height: 10 * (height / standardDeviceHeight),
                                              child: Transform.scale(
                                                scale: 1.2,
                                                child: Checkbox(
                                                    activeColor: Color.fromARGB(
                                                        255, 61, 134, 194),
                                                    shape: CircleBorder(),
                                                    tristate: false,
                                                    value: true,
                                                    splashRadius: 30,
                                                    onChanged: (Null) {}),
                                              ),
                                            ),
                                          ]),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 7),
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border:
                                            Border.all(color: Colors.black26),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "2. Test",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontFamily: 'PTSansRegular',
                                              ),
                                            ),
                                            Container(
                                               width: 20 * (width / standardDeviceWidth),
                                              height: 10 * (height / standardDeviceHeight),
                                              child: Transform.scale(
                                                scale: 1.2,
                                                child: Checkbox(
                                                    activeColor: Color.fromARGB(
                                                        255, 61, 134, 194),
                                                    shape: CircleBorder(),
                                                    tristate: false,
                                                    value: false,
                                                    splashRadius: 30,
                                                    onChanged: (Null) {}),
                                              ),
                                            ),
                                          ]),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 7),
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border:
                                            Border.all(color: Colors.black26),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "3. Test",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontFamily: 'PTSansRegular',
                                              ),
                                            ),
                                            Container(
                                               width: 20 * (width / standardDeviceWidth),
                                              height: 10 * (height / standardDeviceHeight),
                                              child: Transform.scale(
                                                scale: 1.2,
                                                child: Checkbox(
                                                    activeColor: Color.fromARGB(
                                                        255, 61, 134, 194),
                                                    shape: CircleBorder(),
                                                    tristate: false,
                                                    value: true,
                                                    splashRadius: 30,
                                                    onChanged: (Null) {}),
                                              ),
                                            ),
                                          ]),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 7),
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border:
                                            Border.all(color: Colors.black26),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "4. Test",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontFamily: 'PTSansRegular',
                                              ),
                                            ),
                                            Container(
                                              width: 20 * (width / standardDeviceWidth),
                                              height: 10 * (height / standardDeviceHeight),
                                              child: Transform.scale(
                                                scale: 1.2,
                                                child: Checkbox(
                                                    activeColor: Color.fromARGB(
                                                        255, 61, 134, 194),
                                                    shape: CircleBorder(),
                                                    tristate: false,
                                                    value: false,
                                                    splashRadius: 30,
                                                    onChanged: (Null) {}),
                                              ),
                                            ),
                                          ]),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 7),
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border:
                                            Border.all(color: Colors.black26),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "5. Test",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontFamily: 'PTSansRegular',
                                              ),
                                            ),
                                            Container(
                                              width: 20 * (width / standardDeviceWidth),
                                              height: 10 * (height / standardDeviceHeight),
                                              child: Transform.scale(
                                                scale: 1.2,
                                                child: Checkbox(
                                                    activeColor: Color.fromARGB(
                                                        255, 61, 134, 194),
                                                    shape: CircleBorder(),
                                                    tristate: false,
                                                    value: true,
                                                    splashRadius: 30,
                                                    onChanged: (Null) {}),
                                              ),
                                            ),
                                          ]),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 7),
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border:
                                            Border.all(color: Colors.black26),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "6. Test",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontFamily: 'PTSansRegular',
                                              ),
                                            ),
                                            Container(
                                              width: 20 * (width / standardDeviceWidth),
                                              height: 10 * (height / standardDeviceHeight),
                                              child: Transform.scale(
                                                scale: 1.2,
                                                child: Checkbox(
                                                    activeColor: Color.fromARGB(
                                                        255, 61, 134, 194),
                                                    shape: CircleBorder(),
                                                    tristate: false,
                                                    value: false,
                                                    splashRadius: 30,
                                                    onChanged: (Null) {}),
                                              ),
                                            ),
                                          ]),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 0),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      padding:
                                          MaterialStateProperty.all<EdgeInsets>(
                                              const EdgeInsets.only(
                                        left: 100,
                                        right: 100,
                                        top: 10,
                                        bottom: 10,
                                      )),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color.fromARGB(
                                                  255, 201, 218, 231))),
                                  onPressed: () {},
                                  child: const Text(
                                    'Submit',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 14,
                                      fontFamily: 'PTSansRegular',
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          )
                        ])))
          ],
        ));
  }
}
