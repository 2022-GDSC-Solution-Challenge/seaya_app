import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seaya_app/models/newsModel.dart';
import 'package:seaya_app/screens/mainhomepage/newsDialog.dart';
import 'package:seaya_app/utilities/Setdata.dart';
import 'package:seaya_app/utilities/makeJson.dart';
import 'package:seaya_app/widgets/menuwidget/Menu.dart';
import 'package:seaya_app/screens/loginpage/login.dart';
import 'package:seaya_app/screens/mainhomepage/Home.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

// ignore: camel_case_types
class _NewsState extends State<NewsPage> with SingleTickerProviderStateMixin {
  late Future _getNews;
  @override
  void initState() {
    super.initState();
    _getNews = setNewsData();
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
            height: 5,
          ),
          Expanded(
            child: FutureBuilder(
              future: _getNews,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (!snapshot.hasData) {
                  print("loading news data");
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.data == null || snapshot.hasError) {
                  print('error from get news');
                  return Text('loading news fail');
                }
                print(snapshot.data.news);
                return ListView.builder(
                    itemCount: snapshot.data.news.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      print(snapshot.data.news[index].isRead);
                      if (index % 2 == 0) {
                        return newsone(
                            context, sh, sd, snapshot.data.news[index]);
                      } else
                        return newstwo(
                            context, sh, sd, snapshot.data.news[index]);
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget newsone(BuildContext context, double sh, double sd, News news) {
  return GestureDetector(
      onTap: () {
        //뉴스 요약본 get
        showDialog(
            context: context, builder: (context) => newsDialog(news: news));
        print('${news.id!} clicked');
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10, top: 25),
        height: 130 * sh,
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 0),
        child: Container(
            decoration: BoxDecoration(
                color: news.isRead!
                    ? Color.fromARGB(255, 73, 79, 95)
                    : Color.fromARGB(255, 67, 101, 175),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(65.0),
                  topRight: Radius.circular(10),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: news.isRead!
                      ? [
                          Color.fromARGB(255, 115, 132, 167),
                          Color.fromARGB(255, 110, 120, 138),
                        ]
                      : [
                          Color.fromARGB(255, 85, 150, 194),
                          Color.fromARGB(255, 43, 145, 204),
                        ],
                ),
                boxShadow: [
                  BoxShadow(
                      color:
                          Color.fromARGB(255, 124, 130, 180).withOpacity(0.3),
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
                      news.date!, //"Date",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'PTSansRegular',
                      ),
                    ),
                    SizedBox(
                      width: 10 * sd,
                    ),
                    Container(
                      width: 1.5 * sd,
                      height: 11 * sh,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 11.5 * sd,
                    ),
                    Text(
                      // "Publisher",
                      news.publisher!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'PTSansRegular',
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, top: 5, right: 20),
                  child: Column(children: [
                    Text(
                      news.title!, //"Title ...",
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
      ));
}

Widget newstwo(BuildContext context, double sh, double sd, News news) {
  return GestureDetector(
    onTap: () async {
      showDialog(
          context: context, builder: (context) => newsDialog(news: news));
      print('${news.id!} clicked');
    },
    child: Container(
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      height: 130 * sh,
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 0),
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
                colors: news.isRead!
                    ? [
                        Color.fromARGB(255, 115, 132, 167),
                        Color.fromARGB(255, 110, 120, 138),
                      ]
                    : [
                        Color.fromARGB(255, 87, 124, 206),
                        Color.fromARGB(255, 90, 133, 190),
                      ],
              ),
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 124, 130, 180).withOpacity(0.3),
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
                    news.date!, //"Date",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'PTSansRegular',
                    ),
                  ),
                  SizedBox(
                    width: 10 * sd,
                  ),
                  Container(
                    width: 1.5 * sd,
                    height: 11 * sh,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 11.5 * sd,
                  ),
                  Text(
                    // "Publisher",
                    news.publisher!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'PTSansRegular',
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, top: 5, right: 20),
                child: Column(children: [
                  Text(
                    news.title!, //"Title ...",
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
  );
}
