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

    final standardDeviceWidth = 390;
    final standardDeviceHeight = 844;
    final double sh = (height / standardDeviceHeight);
    final double sd = (width / standardDeviceWidth);

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset : false,
      body: Column(
        children: [
          //검색 바
          searchFriends(context, sh, sd),
          SizedBox(
            height: 10 * (height / standardDeviceHeight),
          ),
          //겨루기 수락
          Text(
            'Accept Competition',
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
                return competeAccept(context, sh, sd);
              },
            ),
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
          SizedBox(
            height: 5 * (height / standardDeviceHeight),
          ),
          //친구 리스트
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return friendRec(context, sh, sd);
              },
            ),
          ),
        ],
      ),
    );
  }
}
//id 찾기 검색 창
Widget searchFriends(BuildContext context, double sh, double sd) {
  return Container(
    height: 70 * sh,
    padding: const EdgeInsets.only(top: 20.0, bottom: 10),
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
              borderRadius: BorderRadius.all(Radius.circular(10)))),
    ),
  );
}

//친구 겨루기 승인
Widget competeAccept(BuildContext context, double sh, double sd) {
  return Container(
    margin: EdgeInsets.fromLTRB(3, 3, 3, 3),
    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      height: 50.0 * sh,
      width : 350 * sd,
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
            padding:  EdgeInsets.only(left: 20 * sd),
            child: Text(
              'Friend 1',
              style: TextStyle(
                fontSize: 18.0,
                color: Color(0xff2B2B2B),
                fontFamily: 'PTSansRegular',
              ),
            ),
          ),
          SizedBox(width: 200 * sd),
          Container(
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
              onPressed: null,
              child: Icon(Icons.check),
            ),
          ),
        ],
      ));
}

//친구 신청 승인
Widget friendRec(BuildContext context, double sh, double sd) {
  return Container(
    margin: EdgeInsets.fromLTRB(3, 3, 3, 3),
    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      height: 50.0 * sh,
      width : 350 * sd,
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
            padding:  EdgeInsets.only(left: 20 * sd),
            child: Text(
              'Friend 1',
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
              onPressed: null,
              child: const Text('accept'),
            ),
          ),
        ],
      ));
}



