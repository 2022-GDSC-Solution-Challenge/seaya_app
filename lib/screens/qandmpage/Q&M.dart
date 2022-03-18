import 'package:flutter/material.dart';
import 'package:seaya_app/widgets/menuwidget/Menu.dart';
import 'package:seaya_app/widgets/menuwidget/appBar.dart';
import 'package:seaya_app/screens/qandmpage/Quiz.dart';
import 'package:seaya_app/screens/qandmpage/missionList.dart';

class QuizMission extends StatefulWidget {
  const QuizMission({Key? key}) : super(key: key);

  @override
  _QuizMissionState createState() => _QuizMissionState();
}

// ignore: camel_case_types
class _QuizMissionState extends State<QuizMission>
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

    
    final standardDeviceWidth = 390;
    final standardDeviceHeight = 844;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              appBar(),
             
               SizedBox(
                height: 15 * (height / standardDeviceHeight),
              ),
              Container(
                height: 41 * (height / standardDeviceHeight),
                width: 200 * (width / standardDeviceWidth),
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
                      text: 'Quiz',
                    ),
                    Tab(
                      text: 'Mission',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    //퀴즈 탭
                    Center(
                      child: Quiz(),
                    ),
                    //미션 탭
                    Center(
                        child: missionList(),
                      
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
