import 'package:flutter/material.dart';
import 'package:seaya_app/widgets/menuwidget/Menu.dart';
import 'package:seaya_app/screens/loginpage/login.dart';
import 'package:seaya_app/widgets/menuwidget/appBar.dart';

class Competition extends StatefulWidget {
  const Competition({Key? key}) : super(key: key);

  @override
  _CompetitionState createState() => _CompetitionState();
}

// ignore: camel_case_types
class _CompetitionState extends State<Competition>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              SizedBox(
                width: 354,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10.0,
                    ),
                    const Image(
                      width: 53.0,
                      image: AssetImage(
                        'images/seaya_logo.png',
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    const Text("Seaya",
                        style: TextStyle(
                            color: Color(0xff02171a),
                            fontFamily: 'PTSansRegular',
                            letterSpacing: 2.5,
                            fontSize: 15.0),
                        textAlign: TextAlign.left),
                    const SizedBox(
                      width: 180.0,
                    ),
                    IconButton(
                        icon: const Icon(
                          Icons.menu,
                          size: 26,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Menu()),
                          );
                        }),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 41,
                width: 200,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(52, 156, 192, 211),
                        spreadRadius: 0,
                        blurRadius: 5),
                  ],
                  color: Color.fromARGB(255, 219, 231, 240),
                  borderRadius: BorderRadius.circular(
                    30.0,
                  ),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    border: Border.all(
                        color: Color.fromARGB(255, 219, 231, 240), width: 4),
                    borderRadius: BorderRadius.circular(
                      30.0,
                    ),
                    color: Colors.white,
                  ),
                  labelStyle: const TextStyle(
                    fontSize: 13.0,
                    fontFamily: 'PTSansRegular',
                  ), //For Selected tab
                  unselectedLabelStyle: const TextStyle(
                    fontSize: 13.0,
                    fontFamily: 'PTSansRegular',
                  ), //For Un-selected Tabs
                  labelColor: Colors.black,
                  unselectedLabelColor: const Color(0xff575757),
                  tabs: const [
                    Tab(
                      text: 'Friends',
                    ),
                    Tab(
                      text: 'Add',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    //친구리스트, 겨루기 리스트 탭
                    Center(
                      child: Column(
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
                                  labelText: "Friends Search",
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
                                      Positioned(
                                          top: 10,
                                          left: 10,
                                          child: Material(
                                            child: Container(
                                              height: 60.0,
                                              width: width * 0.3,
                                              decoration: BoxDecoration(
                                                color: Color(0xffFAFAFA),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Column(children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  'Friend 1',
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
                                                    fontFamily: 'PTSansRegular',
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
                                                color: Color.fromARGB(
                                                    255, 202, 210, 224),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: Column(children: [
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  'D-day',
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
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
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
                                                    fontFamily: 'PTSansRegular',
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
                                      Positioned(
                                          top: 10,
                                          left: 10,
                                          child: Material(
                                            child: Container(
                                              height: 60.0,
                                              width: width * 0.3,
                                              decoration: BoxDecoration(
                                                color: Color(0xffFAFAFA),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Column(children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  'Friend 2',
                                                  style: TextStyle(
                                                    fontSize: 10.0,
                                                    color: Color(0xff2B2B2B),
                                                    fontFamily: 'PTSansRegular',
                                                  ),
                                                ),
                                                Text(
                                                  '620 points',
                                                  style: TextStyle(
                                                    fontSize: 18.0,
                                                    color: Color(0xff2B2B2B),
                                                    fontFamily: 'PTSansRegular',
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
                                                color: Color.fromARGB(
                                                    255, 202, 210, 224),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: Column(children: [
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  'D-day',
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
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
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
                                                  '900 points',
                                                  style: TextStyle(
                                                    fontSize: 18.0,
                                                    color: Color(0xff2B2B2B),
                                                    fontFamily: 'PTSansRegular',
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
                                      Positioned(
                                          top: 10,
                                          left: 10,
                                          child: Material(
                                            child: Container(
                                              height: 60.0,
                                              width: width * 0.3,
                                              decoration: BoxDecoration(
                                                color: Color(0xffFAFAFA),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Column(children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  'Friend 3',
                                                  style: TextStyle(
                                                    fontSize: 10.0,
                                                    color: Color(0xff2B2B2B),
                                                    fontFamily: 'PTSansRegular',
                                                  ),
                                                ),
                                                Text(
                                                  '200 points',
                                                  style: TextStyle(
                                                    fontSize: 18.0,
                                                    color: Color(0xff2B2B2B),
                                                    fontFamily: 'PTSansRegular',
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
                                                color: Color.fromARGB(
                                                    255, 202, 210, 224),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: Column(children: [
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  'D-day',
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
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
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
                                                  '470 points',
                                                  style: TextStyle(
                                                    fontSize: 18.0,
                                                    color: Color(0xff2B2B2B),
                                                    fontFamily: 'PTSansRegular',
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
                          //친구 리스트
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
                                            left: 290.0, top: 10),
                                        width: 50,
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
                                          child: const Text('start'),
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
                                            left: 290.0, top: 10),
                                        width: 50,
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
                                          child: const Text('start'),
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
                                            left: 290.0, top: 10),
                                        width: 50,
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
                                          child: const Text('start'),
                                        ),
                                      ),
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
                      child: Column(
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}