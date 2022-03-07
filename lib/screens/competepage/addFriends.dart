import 'package:flutter/material.dart';
import 'package:seaya_app/widgets/menuwidget/Menu.dart';
import 'package:seaya_app/screens/loginpage/login.dart';
import 'package:seaya_app/screens/mainhomepage/Sea.dart';

class addFriends extends StatefulWidget {
  const addFriends({Key? key}) : super(key: key);

  @override
  _addFriendsState createState() => _addFriendsState();
}

// ignore: camel_case_types
class _addFriendsState extends State<addFriends>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                //검색 바
                Container(
                  height: 65,
                  padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                  child: TextField(
                    onChanged: (text) {
                      print(text);
                    },
                    //controller: _nameTextEditController,
                    decoration: InputDecoration(
                        labelText: "Friends Search",
                        fillColor: Color(0xff607463),
                        focusColor: Color(0xff607463),
                        hoverColor: Color(0xff607463),
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Competition List',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Color(0xff2B2B2B),
                    fontFamily: 'PTSansRegular',
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                //겨루기 리스트
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(0.0),
                    children: [
                      Container(
                        height: 80,
                        child: Stack(
                          children: [
                            Positioned(
                                top: 5,
                                child: Material(
                                  child: Container(
                                    height: 70.0,
                                    width: width * 0.91,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 236, 239, 243),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              offset: const Offset(-1.0, 1.0),
                                              blurRadius: 0,
                                              spreadRadius: 0),
                                        ]),
                                  ),
                                )),
                            Positioned(
                                top: 10,
                                left: 10,
                                child: Material(
                                  child: Container(
                                    height: 60.0,
                                    width: width * 0.3,
                                    decoration: BoxDecoration(
                                      color: Color(0xffFAFAFA),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Column(children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Friends',
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          color: Color(0xff2B2B2B),
                                          fontFamily: 'PTSansRegular',
                                        ),
                                      ),
                                      Text(
                                        '850 points',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          color: Color(0xff2B2B2B),
                                          fontFamily: 'PTSansBold',
                                        ),
                                      ),
                                    ]),
                                  ),
                                )),
                            Positioned(
                                top: 10,
                                left: 265,
                                child: Material(
                                  child: Container(
                                    height: 60.0,
                                    width: width * 0.2,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 202, 210, 224),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Column(children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'Date',
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Color(0xff2B2B2B),
                                          fontFamily: 'PTSansRegular',
                                        ),
                                      ),
                                    ]),
                                  ),
                                )),
                            Positioned(
                                top: 10,
                                left: 135,
                                child: Material(
                                  child: Container(
                                    height: 60.0,
                                    width: width * 0.3,
                                    decoration: BoxDecoration(
                                      color: Color(0xffFAFAFA),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Column(children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Me',
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          color: Color(0xff2B2B2B),
                                          fontFamily: 'PTSansRegular',
                                        ),
                                      ),
                                      Text(
                                        '1,100 points',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          color: Color(0xff2B2B2B),
                                          fontFamily: 'PTSansBold',
                                        ),
                                      ),
                                    ]),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      Container(
                        height: 80,
                        child: Stack(
                          children: [
                            Positioned(
                                top: 5,
                                child: Material(
                                  child: Container(
                                    height: 70.0,
                                    width: width * 0.91,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 236, 239, 243),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              offset: const Offset(-1.0, 1.0),
                                              blurRadius: 0,
                                              spreadRadius: 0),
                                        ]),
                                  ),
                                )),
                            Positioned(
                                top: 10,
                                left: 10,
                                child: Material(
                                  child: Container(
                                    height: 60.0,
                                    width: width * 0.3,
                                    decoration: BoxDecoration(
                                      color: Color(0xffFAFAFA),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Column(children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Friends',
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          color: Color(0xff2B2B2B),
                                          fontFamily: 'PTSansRegular',
                                        ),
                                      ),
                                      Text(
                                        '850 points',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          color: Color(0xff2B2B2B),
                                          fontFamily: 'PTSansBold',
                                        ),
                                      ),
                                    ]),
                                  ),
                                )),
                            Positioned(
                                top: 10,
                                left: 265,
                                child: Material(
                                  child: Container(
                                    height: 60.0,
                                    width: width * 0.2,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 202, 210, 224),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Column(children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'Date',
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Color(0xff2B2B2B),
                                          fontFamily: 'PTSansRegular',
                                        ),
                                      ),
                                    ]),
                                  ),
                                )),
                            Positioned(
                                top: 10,
                                left: 135,
                                child: Material(
                                  child: Container(
                                    height: 60.0,
                                    width: width * 0.3,
                                    decoration: BoxDecoration(
                                      color: Color(0xffFAFAFA),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Column(children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Me',
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          color: Color(0xff2B2B2B),
                                          fontFamily: 'PTSansRegular',
                                        ),
                                      ),
                                      Text(
                                        '1,100 points',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          color: Color(0xff2B2B2B),
                                          fontFamily: 'PTSansBold',
                                        ),
                                      ),
                                    ]),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      Container(
                        height: 80,
                        child: Stack(
                          children: [
                            Positioned(
                                top: 5,
                                child: Material(
                                  child: Container(
                                    height: 70.0,
                                    width: width * 0.91,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 236, 239, 243),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              offset: const Offset(-1.0, 1.0),
                                              blurRadius: 0,
                                              spreadRadius: 0),
                                        ]),
                                  ),
                                )),
                            Positioned(
                                top: 10,
                                left: 10,
                                child: Material(
                                  child: Container(
                                    height: 60.0,
                                    width: width * 0.3,
                                    decoration: BoxDecoration(
                                      color: Color(0xffFAFAFA),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Column(children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Friends',
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          color: Color(0xff2B2B2B),
                                          fontFamily: 'PTSansRegular',
                                        ),
                                      ),
                                      Text(
                                        '850 points',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          color: Color(0xff2B2B2B),
                                          fontFamily: 'PTSansBold',
                                        ),
                                      ),
                                    ]),
                                  ),
                                )),
                            Positioned(
                                top: 10,
                                left: 265,
                                child: Material(
                                  child: Container(
                                    height: 60.0,
                                    width: width * 0.2,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 202, 210, 224),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Column(children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'Date',
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Color(0xff2B2B2B),
                                          fontFamily: 'PTSansRegular',
                                        ),
                                      ),
                                    ]),
                                  ),
                                )),
                            Positioned(
                                top: 10,
                                left: 135,
                                child: Material(
                                  child: Container(
                                    height: 60.0,
                                    width: width * 0.3,
                                    decoration: BoxDecoration(
                                      color: Color(0xffFAFAFA),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Column(children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Me',
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          color: Color(0xff2B2B2B),
                                          fontFamily: 'PTSansRegular',
                                        ),
                                      ),
                                      Text(
                                        '1,100 points',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          color: Color(0xff2B2B2B),
                                          fontFamily: 'PTSansBold',
                                        ),
                                      ),
                                    ]),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Friends List',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Color(0xff2B2B2B),
                    fontFamily: 'PTSansRegular',
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                //친국 리스트
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(0.0),
                    children: [
                      Container(
                        height: 50,
                        child: Stack(
                          children: [
                            Positioned(
                                top: 5,
                                child: Material(
                                  child: Container(
                                    padding:
                                        const EdgeInsets.only(top: 7, left: 20),
                                    child: Text(
                                      'Friend 1',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Color(0xff2B2B2B),
                                        fontFamily: 'PTSansRegular',
                                      ),
                                    ),
                                    height: 40.0,
                                    width: width * 0.91,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 236, 239, 243),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              offset: const Offset(-1.0, 1.0),
                                              blurRadius: 0,
                                              spreadRadius: 0),
                                        ]),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        child: Stack(
                          children: [
                            Positioned(
                                top: 5,
                                child: Material(
                                  child: Container(
                                    padding:
                                        const EdgeInsets.only(top: 7, left: 20),
                                    child: Text(
                                      'Friend 2',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Color(0xff2B2B2B),
                                        fontFamily: 'PTSansRegular',
                                      ),
                                    ),
                                    height: 40.0,
                                    width: width * 0.91,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 236, 239, 243),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              offset: const Offset(-1.0, 1.0),
                                              blurRadius: 0,
                                              spreadRadius: 0),
                                        ]),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        child: Stack(
                          children: [
                            Positioned(
                                top: 5,
                                child: Material(
                                  child: Container(
                                    padding:
                                        const EdgeInsets.only(top: 7, left: 20),
                                    child: Text(
                                      'Friend 3',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Color(0xff2B2B2B),
                                        fontFamily: 'PTSansRegular',
                                      ),
                                    ),
                                    height: 40.0,
                                    width: width * 0.91,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 236, 239, 243),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              offset: const Offset(-1.0, 1.0),
                                              blurRadius: 0,
                                              spreadRadius: 0),
                                        ]),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //친구추가, 승인 탭
          Center(
            child: Text(
              'Friends Add',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'PTSansRegular',
              ),
            ),
          ),
        ],
      ),
    );
  }
}