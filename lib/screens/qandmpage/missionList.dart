import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seaya_app/models/missionModel.dart';
import 'package:seaya_app/providers/UserProvider.dart';
import 'package:seaya_app/screens/mainhomepage/missionDialog.dart';

import 'package:seaya_app/screens/qandmpage/Quiz.dart';
import 'package:seaya_app/utilities/Setdata.dart';
import 'package:seaya_app/widgets/menuwidget/appBar.dart';

class missionList extends StatefulWidget {
  const missionList({Key? key}) : super(key: key);

  @override
  _missionListState createState() => _missionListState();
}

class _missionListState extends State<missionList> {
  final standardDeviceWidth = 390;
  final standardDeviceHeight = 844;
  late Future _getMission;
  @override
  void initState() {
    super.initState();
    _getMission = setMission();
  }

  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
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
                    child: Column(
                      children: [
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
                          child: FutureBuilder(
                            future: _getMission,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (!snapshot.hasData) {
                                print("loading news data");
                                return Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.data == null ||
                                  snapshot.hasError) {
                                print('error from get missions');
                                return Text('loading mission fail');
                              }

                              return ListView.builder(
                                itemCount: snapshot.data.missions.length,
                                padding: const EdgeInsets.all(0.0),
                                itemBuilder: (BuildContext context, int index) {
                                  print(snapshot.data.missions[index].isClear);
                                  return missionTile(width, height,
                                      snapshot.data.missions[index]);
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector missionTile(double width, double height, Missions mission) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => missionDialog(mission: mission));
      },
      child: Container(
        margin: EdgeInsets.only(top: 7),
        padding: EdgeInsets.fromLTRB(15, 18, 15, 18),
        // padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '(${mission.point}p)',
              style: TextStyle(
                color: Colors.black,
                fontSize: 10,
                fontFamily: 'PTSansRegular',
              ),
            ),
            SizedBox(width: 5),
            Expanded(
              child: Text(
                '${mission.title}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'PTSansRegular',
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            SizedBox(width: 3),
            Container(
              width: 20 * (width / standardDeviceWidth),
              height: 10 * (height / standardDeviceHeight),
              child: Transform.scale(
                scale: 1.2,
                child: Checkbox(
                  activeColor: Color.fromARGB(255, 61, 134, 194),
                  shape: CircleBorder(),
                  value: mission.isClear,
                  splashRadius: 30,
                  onChanged: (bool? check) {
                    print(check);
                    setState(
                      () {
                        mission.isClear = check;

                        if (check!) {
                          clearMission(mission.id!).then((value) {
                            mission.isClear = value ? true : false;
                          });
                        } else {
                          cancleMission(mission.id!).then(
                            (value) {
                              mission.isClear = value ? false : true;
                            },
                          );
                        }
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
