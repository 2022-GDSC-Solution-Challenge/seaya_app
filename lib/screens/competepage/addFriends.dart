import 'package:flutter/material.dart';
import 'package:seaya_app/models/competitionModel.dart';
import 'package:seaya_app/screens/competepage/SearchFriend.dart';
import 'package:seaya_app/widgets/menuwidget/Menu.dart';
import 'package:seaya_app/screens/loginpage/login.dart';
import 'package:seaya_app/screens/mainhomepage/Sea.dart';

import '../../models/friendModel.dart';
import '../../utilities/Setdata.dart';

class addFriends extends StatefulWidget {
  const addFriends({Key? key}) : super(key: key);

  @override
  _addFriendsState createState() => _addFriendsState();
}

// ignore: camel_case_types
class _addFriendsState extends State<addFriends>
    with SingleTickerProviderStateMixin {
  // Future? _future;
  late Future _getFriend;

  // Future<dynamic> sendData() async {
  //   final _getFriend = await getReceivename();
  //   final _getCompetereq = await getCompetitionname();
  //   return [_getFriend, _getCompetereq];
  // }

  @override
  void initState() {
    super.initState();
    _getFriend = getReceivename();
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
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          //검색 바
          searchFriends(context, sh, sd),
          SizedBox(
            height: 10 * (height / standardDeviceHeight),
          ),
          //겨루기 수락
          Text(
            'Friends List',
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
            future: _getFriend,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (!snapshot.hasData) {
                print("loading  data");
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.data == null || snapshot.hasError) {
                print('error from get data accept');
                return Text('No data exists');
              }
              print(snapshot.data.acceptWaiting);
              print(snapshot.data.acceptWaiting.length);
              print(snapshot.data.friends);
              print(snapshot.data.friends.length);

              if (snapshot.data.acceptWaiting.length == 0) {
                return Center(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        'Your friends list is empty. \nMake a friend request!',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                );
              }
              return Column(children: [
                ListView.builder(
                  itemCount: snapshot.data.friends.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return competeReq(
                        context, sh, sd, snapshot.data.friends[index]);
                  },
                ),
                SizedBox(
                  height: 30 * sh,
                ),
                Text(
                  'Receive List',
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
                    return friendRec(
                        context, sh, sd, snapshot.data.acceptWaiting[index]);
                  },
                ),
              ]);
            },
          ),
        ],
      ),
    );
  }
}

//친구 이름 찾기 검색 창
Widget searchFriends(BuildContext context, double sh, double sd) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SearchFriendBar()),
      );
    },
    child: Container(
      margin: EdgeInsets.only(top: 20 * sh, bottom: 10 * sh),
      padding: EdgeInsets.fromLTRB(10 * sd, 4 * sh, 10 * sd, 4 * sh),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color.fromARGB(255, 132, 136, 132)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.search,
            color: Color.fromARGB(255, 120, 129, 121),
          ),
          Text(
            'Name Search',
            style: TextStyle(
              color: Color(0xff607463),
              fontSize: 15,
              fontFamily: 'PTSansRegular',
            ),
          ),
        ],
      ),
    ),
  );
}

//겨루기 신청창 및 친구 리스트
Widget competeReq(BuildContext context, double sh, double sd, Friends friends) {
  final id = friends.id!;
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
            flex: 3,
            child: Container(
              padding: EdgeInsets.only(left: 20 * sd),
              child: Text(
                friends.name!,
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
              //padding: EdgeInsets.fromLTRB(10*sd, 3*sh, 10*sd, 3*sh),
              width: 70 * sd,
              height: 40 * sh,
              child: ElevatedButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.only(left: 5, right: 5),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 202, 210, 224),
                    )),
                onPressed: () async {
                  final state = await competeFriend(id);
                  if (state == 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Already requested')),
                    );
                  }
                },
                child: const Text(
                  'start',
                  style: TextStyle(
                    color: Color(0xff2B2B2B),
                    fontFamily: 'PTSansRegular',
                  ),
                ),
              ),
            ),
          ),
        ],
      ));
}

//친구 신청 승인
Widget friendRec(BuildContext context, double sh, double sd, Friends friends) {
  final id = friends.id!;

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
            flex: 3,
            child: Container(
              padding: EdgeInsets.only(left: 20 * sd),
              child: Text(
                friends.name!, //friends name
                style: TextStyle(
                  fontSize: 18.0,
                  color: Color(0xff2B2B2B),
                  fontFamily: 'PTSansRegular',
                ),
              ),
            ),
          ),
          // SizedBox(width: 180),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.fromLTRB(3 * sd, 3 * sh, 20 * sd, 3 * sh),
              width: 70 * sd,
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
                  acceptCompete(id);
                },
                child: const Text(
                  'accept',
                  style: TextStyle(
                    color: Color(0xff2B2B2B),
                    fontFamily: 'PTSansRegular',
                  ),
                ),
              ),
            ),
          ),
        ],
      ));
}
