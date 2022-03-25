import 'dart:async';

import 'package:flutter/material.dart';
import 'package:seaya_app/utilities/Setdata.dart';
import 'package:seaya_app/models/campaignModel.dart';
import 'package:seaya_app/widgets/menuwidget/Menu.dart';
import 'package:seaya_app/screens/loginpage/login.dart';
import 'package:seaya_app/screens/mainhomepage/Home.dart';

class CampaignPage extends StatefulWidget {
  const CampaignPage({Key? key}) : super(key: key);

  @override
  _CampaignState createState() => _CampaignState();
}

// ignore: camel_case_types
class _CampaignState extends State<CampaignPage>
    with SingleTickerProviderStateMixin {
  late Future _getCampaign;
  @override
  void initState() {
    super.initState();
    _getCampaign = setCampaignData();
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
      body: Column(
        children: [
          SizedBox(
            height: 10 * (height / standardDeviceHeight),
          ),
          Expanded(
            child: FutureBuilder(
                future: _getCampaign,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (!snapshot.hasData) {
                    print("loading news data");
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.data == null || snapshot.hasError) {
                    print('error from get news');
                    return Text('loading news fail');
                  }
                  return GridView.builder(
                    itemCount: snapshot.data.campaign.length,
                    primary: false,
                    padding: const EdgeInsets.only(top: 10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          //클릭하면해당사이트로
                          print('${snapshot.data.campaign[index].id} clicked');
                        },
                        child: camCard(
                            context, sh, sd, snapshot.data.campaign[index]),
                      );
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}

Widget camCard(BuildContext context, double sh, double sd, Campaign campgn) {
  return Card(
    elevation: 8.0,
    shadowColor: Colors.grey.withOpacity(0.4),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: const DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('images/bubbles.png'),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 241, 241, 241),
            borderRadius: BorderRadius.circular(10.0),
          ),
          margin: const EdgeInsets.only(
            top: 125,
          ),
          padding: const EdgeInsets.only(top: 10, left: 20),
          child: Text(
            campgn.title!, //"Title",
            style: TextStyle(
                fontSize: 16,
                color: const Color(0xff575757),
                fontFamily: 'PTSansRegular'),
          ),
        )),
  );
}
