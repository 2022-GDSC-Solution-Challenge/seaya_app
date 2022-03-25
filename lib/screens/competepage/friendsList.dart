import 'package:flutter/material.dart';
import 'package:seaya_app/models/friendModel.dart';
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
  late Future _getFriends;
  @override
  void initState() {
    super.initState();
    _getFriends = getReceivename();
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
          //검색 바
          searchFriends(context, sh, sd),
          SizedBox(
            height: 10 * (height / standardDeviceHeight),
          ),
          //겨루기 리스트
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

          Expanded(
            child: ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return competeFriends(context, sh, sd);
              },
            ),
          ),
          SizedBox(
            height: 30 * sh,
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
            height: 5 * (height / standardDeviceHeight),
          ),
          //친구 리스트
          Expanded(
            child: FutureBuilder(
              future: _getFriends,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (!snapshot.hasData) {
                  print("loading friends data");
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.data == null || snapshot.hasError) {
                  print('error from get friends receive');
                  return Text('No data exists');
                }
                print(snapshot.data.friends);
                print(snapshot.data.friends.length);
                return ListView.builder(
                  itemCount: snapshot.data.friends.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return competeReq(
                        context, sh, sd, snapshot.data.friends[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

//친구 찾기 검색 창
Widget searchFriends(BuildContext context, double sh, double sd) {
  return Container(
    height: 70 * sh,
    padding: const EdgeInsets.only(top: 20.0, bottom: 10),
    child: Row(children: [
              Expanded(
                flex: 7,
                child: 
    TextField(
      keyboardType: TextInputType.text,
      onChanged: (text) {
        //이부분 수정 필요
        print(text);
      },
      //controller: _nameTextEditController,
      decoration: InputDecoration(
          labelText: "Friends Search",
          fillColor: Color(0xff607463),
          focusColor: Color(0xff607463),
          hoverColor: Color(0xff607463),
          //prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))),
    ),
              ),
              Expanded(
                flex: 1,
                child: IconButton(
                  icon: const Icon(
                    Icons.search,
                    size: 20,
                    ),
                  onPressed: () {
                    
                  },
                ),
              ),
    ],
    ),
  );
}

//겨루기 진행창
Widget competeFriends(BuildContext context, double sh, double sd) {
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
              'Friend 1',
              style: TextStyle(
                fontSize: 10.0,
                color: Color(0xff2B2B2B),
                fontFamily: 'PTSansRegular',
              ),
            ),
            //친구 유저 포인트
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
              'Me',
              style: TextStyle(
                fontSize: 10.0,
                color: Color(0xff2B2B2B),
                fontFamily: 'PTSansRegular',
              ),
            ),
            //본인 포인트
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
        //겨루기 카운트 다운
        Container(
          height: 60.0 * sh,
          width: 80 * sd,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 202, 210, 224),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Column(children: [
            SizedBox(
              height: 20 * sh,
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
      ],
    ),
  );
}

//겨루기 신청창
Widget competeReq(BuildContext context, double sh, double sd, Friends friends) {
  final id = friends.id!;
  return Container(
      margin: EdgeInsets.fromLTRB(3, 3, 3, 3),
      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
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
          Container(
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
          SizedBox(width: 180),
          Container(
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
        ],
      ));
}
