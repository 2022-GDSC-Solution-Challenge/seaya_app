import 'package:flutter/material.dart';
import 'package:seaya_app/models/missionModel.dart';
import 'package:seaya_app/utilities/Setdata.dart';

class missionDialog extends StatefulWidget {
  final Missions mission;
  const missionDialog({Key? key, required this.mission}) : super(key: key);

  @override
  _missionDialogState createState() => _missionDialogState();
}

// ignore: camel_case_types
class _missionDialogState extends State<missionDialog> {
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
            SingleChildScrollView(
              child: Text(
                widget.mission.title!, //'Title',
                style: TextStyle(
                  color: Color.fromARGB(133, 0, 35, 100),
                  fontSize: 22,
                  fontFamily: 'PTSansBold',
                ),
              ),
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
                          widget.mission.info!, //'Contents',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'PTSansRegular',
                          ),
                        ),
                      )),
                ),
              ],
            ),
          ],
        ));
  }
}
