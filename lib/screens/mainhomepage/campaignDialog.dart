import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seaya_app/models/campaignModel.dart';
import 'package:seaya_app/models/missionModel.dart';
import 'package:seaya_app/utilities/Setdata.dart';
import 'package:seaya_app/utilities/makeJson.dart';
import 'package:url_launcher/url_launcher.dart';

class campaignDialog extends StatefulWidget {
  final Campaign campaign;
  const campaignDialog({Key? key, required this.campaign}) : super(key: key);

  @override
  _campaignDialogState createState() => _campaignDialogState();
}

// ignore: camel_case_types
class _campaignDialogState extends State<campaignDialog> {
  @override
  void initState() {
    super.initState();
  }

  // with SingleTickerProviderStateMixin {
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.campaign.title!, //'Title',
              style: TextStyle(
                color: Color.fromARGB(133, 0, 35, 100),
                fontSize: 22,
                fontFamily: 'PTSansBold',
              ),
              overflow: TextOverflow.clip,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
        content: Wrap(
          children: [
            Column(
              children: [
                Card(
                  elevation: 3.0,
                  shadowColor: Colors.grey.withOpacity(0.8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      height: 350,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular((10))),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(
                          widget.campaign.info!, //'Contents',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'PTSansRegular',
                          ),
                        ),
                      )),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.only(
                          left: 70,
                          right: 70,
                          top: 10,
                          bottom: 10,
                        )),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 201, 218, 231))),
                    onPressed: () async {
                      //클릭하면해당사이트로
                      await launch(
                        widget.campaign.url!,
                        forceWebView: false,
                        forceSafariVC: false,
                      );
                      await addCampaignPoint(widget.campaign.id!);
                    },
                    child: const Text(
                      'Go to site',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                        fontFamily: 'PTSansRegular',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
