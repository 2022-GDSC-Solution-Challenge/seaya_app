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
    return Center(
                child: SizedBox(
                  width: 354,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      const Image(
                        width: 53.0,
                        image: AssetImage(
                          'images/seaya_logo.png',
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      const Text("Seaya",
                          style: TextStyle(
                              color: Color(0xff02171a),
                              fontFamily: 'PTSansRegular',
                              letterSpacing: 2.5,
                              fontSize: 15.0),
                          textAlign: TextAlign.left),
                      const SizedBox(
                        width: 180.0,
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