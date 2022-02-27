import 'package:flutter/material.dart';
import 'package:seaya_app/widgets/menuwidget/Menu.dart';
import 'package:seaya_app/screens/loginpage/login.dart';
import 'package:seaya_app/screens/mainhomepage/Sea.dart';
import 'package:seaya_app/widgets/menuwidget/appBar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

// ignore: camel_case_types
class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Widget> _widgetOptions = <Widget>[
    Sea(),
    Sea(),
    Sea(),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              //앱바 추가---------
              appBar(),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 41,
                width: 270,
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
                      text: 'Sea',
                    ),
                    Tab(
                      text: 'News',
                    ),
                    Tab(
                      text: 'Campaign',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    Center(
                      child: Text(
                        'Sea',
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'PTSansRegular',
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'News',
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'PTSansRegular',
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Campaign',
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'PTSansRegular',
                        ),
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
