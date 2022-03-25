import 'package:flutter/material.dart';
import 'package:seaya_app/widgets/menuwidget/Menu.dart';
import 'package:seaya_app/screens/loginpage/login.dart';
import 'package:seaya_app/screens/mainhomepage/Sea.dart';

class SearchFriendBar extends StatefulWidget {
  const SearchFriendBar({Key? key}) : super(key: key);

  @override
  State<SearchFriendBar> createState() => _SearchFriendBarState();
}

class _SearchFriendBarState extends State<SearchFriendBar> {
  @override
  void initState() {
    super.initState();
    //_getFriends = getReceivename();
  }

  @override
  void dispose() {
    super.dispose();
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              //appbar----------
              SizedBox(
                width: 354 * (width / standardDeviceWidth),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10.0 * (width / standardDeviceWidth),
                    ),
                    Image(
                      width: 53.0 * (width / standardDeviceWidth),
                      image: AssetImage(
                        'images/seaya_logo.png',
                      ),
                    ),
                    SizedBox(
                      width: 10.0 * (width / standardDeviceWidth),
                    ),
                    const Text("Seaya",
                        style: TextStyle(
                            color: Color(0xff02171a),
                            fontFamily: 'PTSansRegular',
                            letterSpacing: 2.5,
                            fontSize: 15.0),
                        textAlign: TextAlign.left),
                    SizedBox(
                      width: 180.0 * (width / standardDeviceWidth),
                    ),
                    IconButton(
                        icon: const Icon(
                          Icons.close,
                          size: 24,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: 30 * (height / standardDeviceHeight),
              ),

              Container(
                height: 70 * sh,
                padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                child: TextField(
                  keyboardType: TextInputType.text,
                  onChanged: (text) {
                    print(text);
                  },
                  //controller: _nameTextEditController,
                  decoration: InputDecoration(
                      labelText: "Name Search",
                      fillColor: Color(0xff607463),
                      focusColor: Color(0xff607463),
                      hoverColor: Color(0xff607463),
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget app
