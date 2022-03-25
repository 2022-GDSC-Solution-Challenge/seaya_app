import 'package:flutter/material.dart';
import 'package:seaya_app/models/newsModel.dart';
import 'package:seaya_app/utilities/Setdata.dart';
// import 'package:seaya/screens/Routes/Menu.dart';
// import 'package:seaya/screens/Routes/login.dart';
// import 'package:seaya/screens/Tabs/Sea.dart';

class newsDialog extends StatefulWidget {
  final News news;
  const newsDialog({Key? key, required this.news}) : super(key: key);

  @override
  _newsDialogState createState() => _newsDialogState();
}

// ignore: camel_case_types
class _newsDialogState extends State<newsDialog> {
  late Future _getContent;
  String? url;
  @override
  void initState() {
    super.initState();
    _getContent = getSummNews(widget.news.id!);
  }

  // with SingleTickerProviderStateMixin {
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.news.title!, //'Title',
              style: TextStyle(
                color: Color.fromARGB(133, 0, 35, 100),
                fontSize: 22,
                fontFamily: 'PTSansBold',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  widget.news.date!, //"Date",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                    fontFamily: 'PTSansRegular',
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 1.5,
                  height: 9,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 11.5,
                ),
                Text(
                  "Publisher", //widget.news.publisher
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                    fontFamily: 'PTSansRegular',
                  ),
                ),
              ],
            ),
          ],
        ),
        content: Container(
          child: Column(
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
                  child: FutureBuilder(
                      future: _getContent,
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (!snapshot.hasData) {
                          print("loading news data");
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.data == null || snapshot.hasError) {
                          print('error from get news');
                          return Text('loading news fail');
                        }

                        url = snapshot.data['url'];
                        return Text(
                          snapshot.data['summarized_text'], //'Contents',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'PTSansRegular',
                          ),
                        );
                      }),
                ),
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
                  onPressed: () {
                    //누르면 뉴스 홈페이지로 이동
                  },
                  child: const Text(
                    'News Site',
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
        ));
    // return Scaffold(
    //     backgroundColor: Colors.white,
    //     body: Stack(
    //       children: [
    //         SafeArea(
    //           child: Center(
    //             child: Expanded(
    //               child: ListView(
    //                 children: [
    //                   GestureDetector(
    //                     onTap: () {
    //                       openDialog();
    //                     },
    //                     child: Container(
    //                       margin: const EdgeInsets.only(bottom: 10, top: 25),
    //                       height: 130,
    //                       padding: const EdgeInsets.only(
    //                           left: 16, right: 16, bottom: 0),
    //                       child: Container(
    //                           decoration: BoxDecoration(
    //                               color: Color.fromARGB(255, 67, 101, 175),
    //                               borderRadius: const BorderRadius.only(
    //                                 bottomLeft: Radius.circular(65.0),
    //                                 topRight: Radius.circular(10),
    //                               ),
    //                               gradient: LinearGradient(
    //                                 begin: Alignment.topRight,
    //                                 end: Alignment.bottomLeft,
    //                                 colors: [
    //                                   Color.fromARGB(255, 85, 150, 194),
    //                                   Color.fromARGB(255, 43, 145, 204),
    //                                 ],
    //                               ),
    //                               boxShadow: [
    //                                 BoxShadow(
    //                                     color:
    //                                         Color.fromARGB(255, 124, 130, 180)
    //                                             .withOpacity(0.3),
    //                                     offset: Offset(-8.0, 8.0),
    //                                     blurRadius: 8.0,
    //                                     spreadRadius: 4.0)
    //                               ]),
    //                           padding: const EdgeInsets.only(
    //                             left: 25,
    //                             top: 20.0,
    //                             bottom: 0,
    //                           ),
    //                           child: Column(
    //                             crossAxisAlignment: CrossAxisAlignment.start,
    //                             children: [
    //                               Row(
    //                                 children: [
    //                                   Text(
    //                                     "Date",
    //                                     style: TextStyle(
    //                                       color: Colors.white,
    //                                       fontSize: 12,
    //                                       fontFamily: 'PTSansRegular',
    //                                     ),
    //                                   ),
    //                                   SizedBox(
    //                                     width: 10,
    //                                   ),
    //                                   Container(
    //                                     width: 1.5,
    //                                     height: 11,
    //                                     color: Colors.white,
    //                                   ),
    //                                   SizedBox(
    //                                     width: 11.5,
    //                                   ),
    //                                   Text(
    //                                     "Publisher",
    //                                     style: TextStyle(
    //                                       color: Colors.white,
    //                                       fontSize: 12,
    //                                       fontFamily: 'PTSansRegular',
    //                                     ),
    //                                   ),
    //                                 ],
    //                               ),
    //                               Container(
    //                                 padding: const EdgeInsets.only(
    //                                     left: 10, top: 5, right: 20),
    //                                 child: Column(children: [
    //                                   Text(
    //                                     "Title ...",
    //                                     style: TextStyle(
    //                                       color: Colors.white,
    //                                       fontSize: 22,
    //                                       fontFamily: 'PTSansRegular',
    //                                     ),
    //                                   )
    //                                 ]),
    //                               ),
    //                               Container(
    //                                 padding: const EdgeInsets.only(
    //                                   left: 272,
    //                                   top: 3,
    //                                   right: 18,
    //                                   bottom: 5,
    //                                 ),
    //                               )
    //                             ],
    //                           )),
    //                     ),
    //                   ),
    //                   GestureDetector(
    //                     onTap: () {
    //                       openDialog();
    //                     },
    //                     child: Container(
    //                       margin: const EdgeInsets.only(bottom: 10, top: 10),
    //                       height: 130,
    //                       padding: const EdgeInsets.only(
    //                           left: 16, right: 16, bottom: 0),
    //                       child: Container(
    //                           decoration: BoxDecoration(
    //                               color: Color.fromARGB(255, 86, 106, 150),
    //                               borderRadius: const BorderRadius.only(
    //                                 bottomLeft: Radius.circular(10.0),
    //                                 topRight: Radius.circular(65.0),
    //                               ),
    //                               gradient: LinearGradient(
    //                                 begin: Alignment.topRight,
    //                                 end: Alignment.bottomLeft,
    //                                 colors: [
    //                                   Color.fromARGB(255, 87, 124, 206),
    //                                   Color.fromARGB(255, 90, 133, 190),
    //                                 ],
    //                               ),
    //                               boxShadow: [
    //                                 BoxShadow(
    //                                     color:
    //                                         Color.fromARGB(255, 124, 130, 180)
    //                                             .withOpacity(0.3),
    //                                     offset: Offset(-8.0, 8.0),
    //                                     blurRadius: 8.0,
    //                                     spreadRadius: 4.0)
    //                               ]),
    //                           padding: const EdgeInsets.only(
    //                             left: 25,
    //                             top: 20.0,
    //                             bottom: 0,
    //                           ),
    //                           child: Column(
    //                             crossAxisAlignment: CrossAxisAlignment.start,
    //                             children: [
    //                               Row(
    //                                 children: [
    //                                   Text(
    //                                     "Date",
    //                                     style: TextStyle(
    //                                       color: Colors.white,
    //                                       fontSize: 12,
    //                                       fontFamily: 'PTSansRegular',
    //                                     ),
    //                                   ),
    //                                   SizedBox(
    //                                     width: 10,
    //                                   ),
    //                                   Container(
    //                                     width: 1.5,
    //                                     height: 11,
    //                                     color: Colors.white,
    //                                   ),
    //                                   SizedBox(
    //                                     width: 11.5,
    //                                   ),
    //                                   Text(
    //                                     "Publisher",
    //                                     style: TextStyle(
    //                                       color: Colors.white,
    //                                       fontSize: 12,
    //                                       fontFamily: 'PTSansRegular',
    //                                     ),
    //                                   ),
    //                                 ],
    //                               ),
    //                               Container(
    //                                 padding: const EdgeInsets.only(
    //                                     left: 10, top: 5, right: 20),
    //                                 child: Column(children: [
    //                                   Text(
    //                                     "Title ...",
    //                                     style: TextStyle(
    //                                       color: Colors.white,
    //                                       fontSize: 22,
    //                                       fontFamily: 'PTSansRegular',
    //                                     ),
    //                                   )
    //                                 ]),
    //                               )
    //                             ],
    //                           )),
    //                     ),
    //                   ),
    //                   GestureDetector(
    //                     onTap: () {
    //                       openDialog();
    //                     },
    //                     child: Container(
    //                       margin: const EdgeInsets.only(bottom: 10, top: 10),
    //                       height: 130,
    //                       padding: const EdgeInsets.only(
    //                           left: 16, right: 16, bottom: 0),
    //                       child: Container(
    //                           decoration: BoxDecoration(
    //                               color: Color.fromARGB(255, 67, 101, 175),
    //                               borderRadius: const BorderRadius.only(
    //                                 bottomLeft: Radius.circular(65.0),
    //                                 topRight: Radius.circular(10),
    //                               ),
    //                               gradient: LinearGradient(
    //                                 begin: Alignment.topRight,
    //                                 end: Alignment.bottomLeft,
    //                                 colors: [
    //                                   Color.fromARGB(255, 85, 150, 194),
    //                                   Color.fromARGB(255, 43, 145, 204),
    //                                 ],
    //                               ),
    //                               boxShadow: [
    //                                 BoxShadow(
    //                                     color:
    //                                         Color.fromARGB(255, 124, 130, 180)
    //                                             .withOpacity(0.3),
    //                                     offset: Offset(-8.0, 8.0),
    //                                     blurRadius: 8.0,
    //                                     spreadRadius: 4.0)
    //                               ]),
    //                           padding: const EdgeInsets.only(
    //                             left: 25,
    //                             top: 20.0,
    //                             bottom: 0,
    //                           ),
    //                           child: Column(
    //                             crossAxisAlignment: CrossAxisAlignment.start,
    //                             children: [
    //                               Row(
    //                                 children: [
    //                                   Text(
    //                                     "Date",
    //                                     style: TextStyle(
    //                                       color: Colors.white,
    //                                       fontSize: 12,
    //                                       fontFamily: 'PTSansRegular',
    //                                     ),
    //                                   ),
    //                                   SizedBox(
    //                                     width: 10,
    //                                   ),
    //                                   Container(
    //                                     width: 1.5,
    //                                     height: 11,
    //                                     color: Colors.white,
    //                                   ),
    //                                   SizedBox(
    //                                     width: 11.5,
    //                                   ),
    //                                   Text(
    //                                     "Publisher",
    //                                     style: TextStyle(
    //                                       color: Colors.white,
    //                                       fontSize: 12,
    //                                       fontFamily: 'PTSansRegular',
    //                                     ),
    //                                   ),
    //                                 ],
    //                               ),
    //                               Container(
    //                                 padding: const EdgeInsets.only(
    //                                     left: 10, top: 5, right: 20),
    //                                 child: Column(children: [
    //                                   Text(
    //                                     "Title ...",
    //                                     style: TextStyle(
    //                                       color: Colors.white,
    //                                       fontSize: 22,
    //                                       fontFamily: 'PTSansRegular',
    //                                     ),
    //                                   )
    //                                 ]),
    //                               ),
    //                               Container(
    //                                 padding: const EdgeInsets.only(
    //                                   left: 272,
    //                                   top: 3,
    //                                   right: 18,
    //                                   bottom: 5,
    //                                 ),
    //                               )
    //                             ],
    //                           )),
    //                     ),
    //                   ),
    //                   GestureDetector(
    //                     onTap: () {
    //                       openDialog();
    //                     },
    //                     child: Container(
    //                       margin: const EdgeInsets.only(bottom: 10, top: 10),
    //                       height: 130,
    //                       padding: const EdgeInsets.only(
    //                           left: 16, right: 16, bottom: 0),
    //                       child: Container(
    //                           decoration: BoxDecoration(
    //                               color: Color.fromARGB(255, 86, 106, 150),
    //                               borderRadius: const BorderRadius.only(
    //                                 bottomLeft: Radius.circular(10.0),
    //                                 topRight: Radius.circular(65.0),
    //                               ),
    //                               gradient: LinearGradient(
    //                                 begin: Alignment.topRight,
    //                                 end: Alignment.bottomLeft,
    //                                 colors: [
    //                                   Color.fromARGB(255, 87, 124, 206),
    //                                   Color.fromARGB(255, 90, 133, 190),
    //                                 ],
    //                               ),
    //                               boxShadow: [
    //                                 BoxShadow(
    //                                     color:
    //                                         Color.fromARGB(255, 124, 130, 180)
    //                                             .withOpacity(0.3),
    //                                     offset: Offset(-8.0, 8.0),
    //                                     blurRadius: 8.0,
    //                                     spreadRadius: 4.0)
    //                               ]),
    //                           padding: const EdgeInsets.only(
    //                             left: 25,
    //                             top: 20.0,
    //                             bottom: 0,
    //                           ),
    //                           child: Column(
    //                             crossAxisAlignment: CrossAxisAlignment.start,
    //                             children: [
    //                               Row(
    //                                 children: [
    //                                   Text(
    //                                     "Date",
    //                                     style: TextStyle(
    //                                       color: Colors.white,
    //                                       fontSize: 12,
    //                                       fontFamily: 'PTSansRegular',
    //                                     ),
    //                                   ),
    //                                   SizedBox(
    //                                     width: 10,
    //                                   ),
    //                                   Container(
    //                                     width: 1.5,
    //                                     height: 11,
    //                                     color: Colors.white,
    //                                   ),
    //                                   SizedBox(
    //                                     width: 11.5,
    //                                   ),
    //                                   Text(
    //                                     "Publisher",
    //                                     style: TextStyle(
    //                                       color: Colors.white,
    //                                       fontSize: 12,
    //                                       fontFamily: 'PTSansRegular',
    //                                     ),
    //                                   ),
    //                                 ],
    //                               ),
    //                               Container(
    //                                 padding: const EdgeInsets.only(
    //                                     left: 10, top: 5, right: 20),
    //                                 child: Column(children: [
    //                                   Text(
    //                                     "Title ...",
    //                                     style: TextStyle(
    //                                       color: Colors.white,
    //                                       fontSize: 22,
    //                                       fontFamily: 'PTSansRegular',
    //                                     ),
    //                                   )
    //                                 ]),
    //                               )
    //                             ],
    //                           )),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         )
    //       ],
    //     ));
  }
}
