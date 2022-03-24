import 'package:flutter/material.dart';
import 'package:seaya_app/widgets/menuwidget/Menu.dart';
import 'package:seaya_app/screens/loginpage/login.dart';
import 'package:seaya_app/screens/mainhomepage/Home.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

// ignore: camel_case_types
class _NewsState extends State<News> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    
    final standardDeviceWidth = 390;
    final standardDeviceHeight = 844;
    final double sh = (height / standardDeviceHeight);
    final double sd = (width / standardDeviceWidth);

    // colors: [
    //                           Color.fromARGB(255, 85, 150, 194),
    //                           Color.fromARGB(255, 43, 145, 204),
    //                         ],

    // colors: [
    //                           Color.fromARGB(255, 87, 124, 206),
    //                           Color.fromARGB(255, 90, 133, 190),
    //                         ],

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
           SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10, top: 25),
                  height: 130 * (height / standardDeviceHeight),
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 0),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 67, 101, 175),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(65.0),
                            topRight: Radius.circular(10),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color.fromARGB(255, 85, 150, 194),
                              Color.fromARGB(255, 43, 145, 204),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(255, 124, 130, 180)
                                    .withOpacity(0.3),
                                offset: Offset(-8.0, 8.0),
                                blurRadius: 8.0,
                                spreadRadius: 4.0)
                          ]),
                      padding: const EdgeInsets.only(
                        left: 25,
                        top: 20.0,
                        bottom: 0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Date",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'PTSansRegular',
                                ),
                              ),
                              SizedBox(
                                width: 10 * (width / standardDeviceWidth),
                              ),
                              Container(
                                width: 1.5 * (width / standardDeviceWidth),
                                height: 11 * (height / standardDeviceHeight),
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 11.5 * (width / standardDeviceWidth),
                              ),
                              Text(
                                "Publisher",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'PTSansRegular',
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 10, top: 5, right: 20),
                            child: Column(children: [
                              Text(
                                "Title ...",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontFamily: 'PTSansRegular',
                                ),
                              )
                            ]),
                          )
                        ],
                      )),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10, top: 10),
                  height: 130 * (height / standardDeviceHeight),
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 0),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 86, 106, 150),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            topRight: Radius.circular(65.0),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color.fromARGB(255, 87, 124, 206),
                              Color.fromARGB(255, 90, 133, 190),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(255, 124, 130, 180)
                                    .withOpacity(0.3),
                                offset: Offset(-8.0, 8.0),
                                blurRadius: 8.0,
                                spreadRadius: 4.0)
                          ]),
                      padding: const EdgeInsets.only(
                        left: 25,
                        top: 20.0,
                        bottom: 0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Date",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'PTSansRegular',
                                ),
                              ),
                              SizedBox(
                                width: 10 * (width / standardDeviceWidth),
                              ),
                              Container(
                                width: 1.5 * (width / standardDeviceWidth),
                                height: 11 * (height / standardDeviceHeight),
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 11.5  * (width / standardDeviceWidth),
                              ),
                              Text(
                                "Publisher",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'PTSansRegular',
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 10, top: 5, right: 20),
                            child: Column(children: [
                              Text(
                                "Title ...",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontFamily: 'PTSansRegular',
                                ),
                              )
                            ]),
                          )
                        ],
                      )),
                ),
                
                      
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// Widget newsList(BuildContext context,double sh,double sd){
//   return Container(
//                   margin: const EdgeInsets.only(bottom: 10, top: 25),
//                   height: 130 * sh,
//                   padding:
//                       const EdgeInsets.only(left: 16, right: 16, bottom: 0),
//                   child: Container(
//                       decoration: BoxDecoration(
//                           color: Color.fromARGB(255, 67, 101, 175),
//                           borderRadius: const BorderRadius.only(
//                             bottomLeft: Radius.circular(65.0),
//                             topRight: Radius.circular(10),
//                           ),
//                           gradient: LinearGradient(
//                             begin: Alignment.topRight,
//                             end: Alignment.bottomLeft,
//                             colors: [
//                               Color.fromARGB(255, 85, 150, 194),
//                               Color.fromARGB(255, 43, 145, 204),
//                             ],
//                           ),
//                           boxShadow: [
//                             BoxShadow(
//                                 color: Color.fromARGB(255, 124, 130, 180)
//                                     .withOpacity(0.3),
//                                 offset: Offset(-8.0, 8.0),
//                                 blurRadius: 8.0,
//                                 spreadRadius: 4.0)
//                           ]),
//                       padding: const EdgeInsets.only(
//                         left: 25,
//                         top: 20.0,
//                         bottom: 0,
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Text(
//                                 "Date",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 12,
//                                   fontFamily: 'PTSansRegular',
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 10 * sd,
//                               ),
//                               Container(
//                                 width: 1.5 * sd,
//                                 height: 11 * sh,
//                                 color: Colors.white,
//                               ),
//                               SizedBox(
//                                 width: 11.5 * sd,
//                               ),
//                               Text(
//                                 "Publisher",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 12,
//                                   fontFamily: 'PTSansRegular',
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Container(
//                             padding: const EdgeInsets.only(
//                                 left: 10, top: 5, right: 20),
//                             child: Column(children: [
//                               Text(
//                                 "Title ...",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 22,
//                                   fontFamily: 'PTSansRegular',
//                                 ),
//                               )
//                             ]),
//                           )
//                         ],
//                       )),
//                 );

// }
