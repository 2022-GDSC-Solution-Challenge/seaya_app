import 'package:flutter/material.dart';
import 'package:seaya_app/widgets/menuwidget/Menu.dart';
import 'package:seaya_app/widgets/menuwidget/appBar.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              appBar(),
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
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Image(
                            width: 365.0,
                            image: AssetImage(
                              'images/Quiz.png',
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Take the quiz',
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'PTSansRegular',
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'This is a guide before taking the quiz.',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'PTSansRegular',
                            ),
                          ),
                          Text(
                            'Please read carefully and click the "Go" button.',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'PTSansRegular',
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Column(
                            children: [
                              Text(
                                '1. Take a quiz that comes out at random.',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'PTSansRegular',
                                ),
                              ),
                              Text(
                                '2. Click the "Next" button.',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'PTSansRegular',
                                ),
                              ),
                              Text(
                                '3. Challenge yourself towards a perfect score!',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'PTSansRegular',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    const EdgeInsets.only(
                                  left: 150,
                                  right: 150,
                                  top: 12,
                                  bottom: 12,
                                )),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromARGB(255, 219, 231, 240))),
                            onPressed: null,
                            child: const Text('Go!'),
                          ),
                        ],
                      ),
                    ),
                    //미션 탭
                    Center(
                      child: Text(
                        'Mission',
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
