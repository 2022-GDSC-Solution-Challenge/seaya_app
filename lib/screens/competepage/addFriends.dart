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
                          //검색 바
                          Container(
                            height: 65,
                            padding:
                                const EdgeInsets.only(top: 20.0, bottom: 10),
                            child: TextField(
                              onChanged: (text) {
                                print(text);
                              },
                              //controller: _nameTextEditController,
                              decoration: InputDecoration(
                                  labelText: "ID Search",
                                  fillColor: Color(0xff607463),
                                  focusColor: Color(0xff607463),
                                  hoverColor: Color(0xff607463),
                                  prefixIcon: Icon(Icons.search),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)))),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Add List',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Color(0xff2B2B2B),
                              fontFamily: 'PTSansRegular',
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          //친구 리스트
                          Container(
                            child: Expanded(
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
                                                padding: const EdgeInsets.only(
                                                    top: 7, left: 20),
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
                                                    color: Color.fromARGB(
                                                        255, 236, 239, 243),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
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
                                          margin: const EdgeInsets.only(
                                              left: 305.0, top: 10),
                                          width: 35,
                                          height: 30,
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                                padding: MaterialStateProperty
                                                    .all<EdgeInsets>(
                                                  const EdgeInsets.only(),
                                                ),
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(
                                                  Color.fromARGB(
                                                      255, 202, 210, 224),
                                                )),
                                            onPressed: null,
                                            child: const Text('+'),
                                          ),
                                        ),
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
                                                padding: const EdgeInsets.only(
                                                    top: 7, left: 20),
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
                                                    color: Color.fromARGB(
                                                        255, 236, 239, 243),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
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
                                          margin: const EdgeInsets.only(
                                              left: 305.0, top: 10),
                                          width: 35,
                                          height: 30,
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                                padding: MaterialStateProperty
                                                    .all<EdgeInsets>(
                                                  const EdgeInsets.only(),
                                                ),
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(
                                                  Color.fromARGB(
                                                      255, 202, 210, 224),
                                                )),
                                            onPressed: null,
                                            child: const Text('+'),
                                          ),
                                        ),
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
                                                padding: const EdgeInsets.only(
                                                    top: 7, left: 20),
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
                                                    color: Color.fromARGB(
                                                        255, 236, 239, 243),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
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
                                          margin: const EdgeInsets.only(
                                              left: 305.0, top: 10),
                                          width: 35,
                                          height: 30,
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                                padding: MaterialStateProperty
                                                    .all<EdgeInsets>(
                                                  const EdgeInsets.only(),
                                                ),
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(
                                                  Color.fromARGB(
                                                      255, 202, 210, 224),
                                                )),
                                            onPressed: null,
                                            child: const Text('+'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Text(
                            'ReceiveList',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Color(0xff2B2B2B),
                              fontFamily: 'PTSansRegular',
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: Expanded(
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
                                                padding: const EdgeInsets.only(
                                                    top: 7, left: 20),
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
                                                    color: Color.fromARGB(
                                                        255, 236, 239, 243),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
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
                                                padding: const EdgeInsets.only(
                                                    top: 7, left: 20),
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
                                                    color: Color.fromARGB(
                                                        255, 236, 239, 243),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
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
                                                padding: const EdgeInsets.only(
                                                    top: 7, left: 20),
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
                                                    color: Color.fromARGB(
                                                        255, 236, 239, 243),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
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
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
    );
  }
}