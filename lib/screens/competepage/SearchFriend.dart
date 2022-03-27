import 'package:flutter/material.dart';
import 'package:seaya_app/models/finduserModel.dart';
import 'package:seaya_app/utilities/Setdata.dart';
import 'package:seaya_app/widgets/menuwidget/Menu.dart';
import 'package:seaya_app/screens/loginpage/login.dart';
import 'package:seaya_app/screens/mainhomepage/Sea.dart';

class SearchFriendBar extends StatefulWidget {
  const SearchFriendBar({Key? key}) : super(key: key);

  @override
  State<SearchFriendBar> createState() => _SearchFriendBarState();
}

class _SearchFriendBarState extends State<SearchFriendBar> {
  late Future _getFindUser;
  final _nameTextEditController = TextEditingController();
  String? textvalue;
  int? state;

  @override
  void initState() {
    super.initState();
    //_getFindUser = getUsername();
    //_getFindUser = getUsername(_nameTextEditController.text);
    textvalue = null;
    state = 0;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //_getFindUser = getUsername(_nameTextEditController.text);
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    final standardDeviceWidth = 390;
    final standardDeviceHeight = 844;
    final double sh = (height / standardDeviceHeight);
    final double sd = (width / standardDeviceWidth);

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  controller: _nameTextEditController,
                  keyboardType: TextInputType.text,
                  onSubmitted: (textvalue) {
                    _nameTextEditController.text = textvalue;
                    state = 1;
                    _getFindUser = getUsername(_nameTextEditController.text);
                  },
                  style: TextStyle(
                      color: Color(0xff607463),
                      fontSize: 15,
                      fontFamily: 'PTSansRegular'),
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
              SizedBox(
                height: 15 * (height / standardDeviceHeight),
              ),

              state == 0
                  ? Text(
                      'Find Your New Friend!',
                      textAlign: TextAlign.center,
                      //style: TextStyle(fontSize: 20),
                    )
                  : Container(
                      height: 300 * sh,
                      child: FutureBuilder(
                        future: _getFindUser,
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          if (!snapshot.hasData) {
                            print("loading  data");
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.data == null ||
                              snapshot.hasError) {
                            print('error from get data accept');
                            return Text('No data exists');
                          }
                          // print(textvalue);
                          // print(snapshot.data.result);
                          // print(snapshot.data.result.length);
                          
                          state = 1;
                          if (snapshot.data.result.length == 0)
                            return Center(
                                child: Text(
                                    'No results were found for your search.'));
                          return ListView.builder(
                            itemCount: snapshot.data.result.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return usertofriendRec(
                                  context, sh, sd, snapshot.data.result[index]);
                            },
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

// 검색된 유저 리스트

Widget usertofriendRec(
    BuildContext context, double sh, double sd, Result result) {
  final id = result.id!;
  final isFriend = result.isFriend!;


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
                result.name!, //friends name
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
                   (isFriend == 0)? reqFriend(id) : null;
                },
                
                child: 
                (isFriend == 0)
                 ?Text(
                  'request',
                  style: TextStyle(
                    color: Color(0xff2B2B2B),
                    fontFamily: 'PTSansRegular',
                  ),
                )
                :Text(
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
      ));
}
