import 'package:flutter/material.dart';
import 'package:seaya_app/widgets/menuwidget/Menu.dart';

class appBar extends StatefulWidget {
  const appBar({ Key? key }) : super(key: key);

  @override
  _appBarState createState() => _appBarState();
}

class _appBarState extends State<appBar> {
  void initState() {
    super.initState();
  }

//appbar 부분 위젯으로 묶어둠

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    print(height);
    print(width);

    final standardDeviceWidth = 390;
    final standardDeviceHeight = 844;

    return Center(
                child: SizedBox(
                  width: 354 * (width / standardDeviceWidth),
                  child: Row(
                    children: [
                       SizedBox(
                        width: 10 * (width / standardDeviceWidth),
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
                            Icons.menu,
                            size: 26,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Menu()),
                            );
                          }),
                    ],
                  ),
                ),
              
    );
  }
}