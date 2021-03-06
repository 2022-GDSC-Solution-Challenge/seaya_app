import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:seaya_app/models/competitionModel.dart';
import 'package:seaya_app/models/friendModel.dart';
import 'package:seaya_app/providers/UserProvider.dart';
import 'package:seaya_app/utilities/Setdata.dart';
import 'package:seaya_app/widgets/menuwidget/Menu.dart';
import 'package:seaya_app/screens/loginpage/login.dart';
import 'package:seaya_app/screens/mainhomepage/Sea.dart';

class friendsList extends StatefulWidget {
  const friendsList({Key? key}) : super(key: key);

  @override
  _friendsListState createState() => _friendsListState();
}

// ignore: camel_case_types
class _friendsListState extends State<friendsList>
    with SingleTickerProviderStateMixin {
  late Future _getCompetereq;

  @override
  void initState() {
    super.initState();
    _getCompetereq = getCompetitionname();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    final standardDeviceWidth = 390;
    final standardDeviceHeight = 844;
    final double sh = (height / standardDeviceHeight);
    final double sd = (width / standardDeviceWidth);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          //공백
          SizedBox(
            height: 20 * sh,
          ),
          //겨루기 리스트 -> 친구랑 내 정보,
          Text(
            'Competition List',
            style: TextStyle(
              fontSize: 18.0,
              color: Color(0xff2B2B2B),
              fontFamily: 'PTSansRegular',
            ),
          ),
          SizedBox(
            height: 5 * (height / standardDeviceHeight),
          ),

          FutureBuilder(
            future: _getCompetereq,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              print(snapshot.hasData);
              if (!snapshot.hasData) {
                print("loading  data");
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.data == null || snapshot.hasError) {
                print('error from get data accept');
                return Text('No data exists');
              }
              print(snapshot.data!.acceptWaiting);
              print(snapshot.data!.acceptWaiting.length);
              print(snapshot.data!.competitors);
              print(snapshot.data!.competitors.length);
              print(snapshot.data!.requestWaiting.length);

              if (snapshot.data!.competitors.length == 0 &&
                  snapshot.data!.requestWaiting.length == 0 &&
                  snapshot.data!.acceptWaiting.length == 0) {
                return Center(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        'No competitors. \nAsk your friends to compete!',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                );
              }
              return Column(
                children: [
                  (snapshot.data!.competitors.length != 0)
                      ? ListView.builder(
                          itemCount: snapshot.data!.competitors.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return competeFriends(
                              context,
                              sh,
                              sd,
                              snapshot.data.competitors[index],
                            );
                          },
                        )
                      : Text(
                          'Competition was not conducted',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                  SizedBox(
                    height: 30 * sh,
                  ),
                  Text(
                    'Accept Competition',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Color(0xff2B2B2B),
                      fontFamily: 'PTSansRegular',
                    ),
                  ),
                  ListView.builder(
                    itemCount: snapshot.data.acceptWaiting.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return competeAccept(
                        context,
                        sh,
                        sd,
                        snapshot.data.acceptWaiting[index],
                        snapshot.data.competitors,
                      );
                    },
                  ),
                  SizedBox(
                    height: 30 * sh,
                  ),
                  Text(
                    'Request Competition',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Color(0xff2B2B2B),
                      fontFamily: 'PTSansRegular',
                    ),
                  ),
                  ListView.builder(
                    itemCount: snapshot.data.requestWaiting.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return competeRequest(
                          context, sh, sd, snapshot.data.requestWaiting[index]);
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

//겨루기 진행창
Widget competeFriends(
    BuildContext context, double sh, double sd, Competitors compete) {
  UserProvider _userProvider = Provider.of<UserProvider>(context, listen: true);
  final id = compete.id!;
  final int? mypoint;
  final int? yourpoint;
  var date;
  var datestr = compete.competition!.startAt;

  //오늘 시간
  DateTime today = DateTime.now();

  //끝나는 시간
  today = new DateTime(today.year, today.month, today.day);
  print(today);
  if (datestr == "0") {
    date = new DateTime(today.year, today.month, today.day + 1);
  } else if (datestr == null) {
    date = new DateTime(today.year, today.month, today.day + 1);
  } else {
    datestr = datestr.substring(0, 10);
    date = DateFormat('yyyy-MM-dd').parse(datestr);
  }
  print(date);
  var date2 = new DateTime(date.year, date.month, date.day + 7);
  print(date2);
  int difference = int.parse(date2.difference(today).inDays.toString());
  print(difference);

  if (id == compete.competition!.acceptId) {
    yourpoint = compete.competition!.auPoint;
    mypoint = compete.competition!.ruPoint;
  } else {
    yourpoint = compete.competition!.ruPoint;
    mypoint = compete.competition!.auPoint;
  }

  return Container(
    margin: EdgeInsets.fromLTRB(3, 5, 3, 5),
    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
    height: 75.0 * sh,
    width: 350 * sd,
    decoration: BoxDecoration(
        color: Color.fromARGB(255, 236, 239, 243),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(-1.0, 1.0),
              blurRadius: 0,
              spreadRadius: 0),
        ]),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 3, 0),
          //height: 60.0 * sh,
          width: 120 * sd,
          decoration: BoxDecoration(
            color: Color(0xffFAFAFA),
            borderRadius: BorderRadius.circular(7.0),
          ),
          child: Column(children: [
            SizedBox(
              height: 10 * sh,
            ),
            //친구 유저 이름
            Text(
              compete.name!,
              style: TextStyle(
                fontSize: 10.0,
                color: Color(0xff2B2B2B),
                fontFamily: 'PTSansRegular',
              ),
            ),
            //친구 유저 포인트
            Text(
              '${yourpoint}',
              style: TextStyle(
                fontSize: 18.0,
                color: Color(0xff2B2B2B),
                fontFamily: 'PTSansRegular',
              ),
            ),
          ]),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 3, 0),
          //height: 60.0 * sh,
          width: 120 * sd,
          decoration: BoxDecoration(
            color: Color(0xffFAFAFA),
            borderRadius: BorderRadius.circular(7.0),
          ),
          child: Column(children: [
            SizedBox(
              height: 10 * sh,
            ),
            //본인
            Text(
              _userProvider.user!.name,
              style: TextStyle(
                fontSize: 10.0,
                color: Color(0xff2B2B2B),
                fontFamily: 'PTSansRegular',
              ),
            ),
            //본인 포인트
            Text(
              '${mypoint}',
              style: TextStyle(
                fontSize: 18.0,
                color: Color(0xff2B2B2B),
                fontFamily: 'PTSansRegular',
              ),
            ),
          ]),
        ),
        //겨루기 카운트 다운
        Container(
          height: 60.0 * sh,
          width: 80 * sd,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 202, 210, 224),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 20 * sh,
              ),
              (difference <= 7)
                  ? Text(
                      'D-${difference}',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Color(0xff2B2B2B),
                        fontFamily: 'PTSansRegular',
                      ),
                    )
                  : Text(
                      'Not yet',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Color(0xff2B2B2B),
                        fontFamily: 'PTSansRegular',
                      ),
                    ),
            ],
          ),
        ),
      ],
    ),
  );
}

//친구 겨루기 승인
Widget competeAccept(BuildContext context, double sh, double sd,
    Competitors competitor, List<Competitors> competitors) {
  final id = competitor.id!;
  var state1 = false;
  final state2 = competitor.competition!.state;
  List<Competitors> competelist = competitors;

  for (int i = 0; i < competelist.length; i++) {
    if (id == competelist[i].id) {
      state1 = true;
      break;
    }
  }

  return Container(
    margin: EdgeInsets.fromLTRB(3 * sd, 3 * sh, 3 * sd, 3 * sh),
    padding: EdgeInsets.fromLTRB(5 * sd, 5 * sh, 5 * sd, 5 * sh),
    height: 50.0 * sh,
    width: 350 * sd,
    decoration: BoxDecoration(
        color: Color.fromARGB(255, 236, 239, 243),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(-1.0, 1.0),
              blurRadius: 0,
              spreadRadius: 0),
        ]),
    child: Row(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            padding: EdgeInsets.only(left: 20 * sd),
            child: Text(
              competitor.name!,
              style: TextStyle(
                fontSize: 18.0,
                color: Color(0xff2B2B2B),
                fontFamily: 'PTSansRegular',
              ),
            ),
          ),
        ),
        //SizedBox(width: 180 * sd),
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.fromLTRB(3 * sd, 3 * sh, 20 * sd, 3 * sh),
            width: 40 * sd,
            height: 40 * sh,
            child: ElevatedButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.only(),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 202, 210, 224),
                  )),
              onPressed: () {
                (state2 == false) ? acceptCompete(id) : null;
              },
              child: (state2 == false)
                  ? Icon(Icons.check)
                  : Text(
                      'already',
                      style: TextStyle(
                        color: Color(0xff2B2B2B),
                        fontFamily: 'PTSansRegular',
                      ),
                    ),
            ),
          ),
        ),
      ],
    ),
  );
}

//내가 겨루기 신청한 리스트(아직 대기중)
Widget competeRequest(
    BuildContext context, double sh, double sd, Competitors competitor) {
  final id = competitor.id!;
  return Container(
    margin: EdgeInsets.fromLTRB(3 * sd, 3 * sh, 3 * sd, 3 * sh),
    padding: EdgeInsets.fromLTRB(5 * sd, 5 * sh, 5 * sd, 5 * sh),
    height: 50.0 * sh,
    width: 350 * sd,
    decoration: BoxDecoration(
        color: Color.fromARGB(255, 236, 239, 243),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(-1.0, 1.0),
              blurRadius: 0,
              spreadRadius: 0),
        ]),
    child: Row(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            padding: EdgeInsets.only(left: 20 * sd),
            child: Text(
              competitor.name!,
              style: TextStyle(
                fontSize: 18.0,
                color: Color(0xff2B2B2B),
                fontFamily: 'PTSansRegular',
              ),
            ),
          ),
        ),
        //SizedBox(width: 180 * sd),
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.fromLTRB(3 * sd, 3 * sh, 20 * sd, 3 * sh),
            width: 40 * sd,
            height: 40 * sh,
            child: ElevatedButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.only(),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 202, 210, 224),
                  )),
              onPressed: () {
                null;
              },
              child: const Text(
                'waiting..',
                style: TextStyle(
                  color: Color(0xff2B2B2B),
                  fontFamily: 'PTSansRegular',
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
