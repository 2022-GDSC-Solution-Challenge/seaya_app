import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:seaya_app/models/quizModel.dart';
//import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:seaya_app/screens/qandmpage/Quiz.dart';
import 'package:seaya_app/screens/qandmpage/quizEnd.dart';

class quizList extends StatefulWidget {
  final List<mquiz> quizzes;
  const quizList({Key? key, required this.quizzes}) : super(key: key);

  @override
  _quizListState createState() => _quizListState();
}

class _quizListState extends State<quizList> {
  SwiperController _controller = SwiperController();
  int _currentIndex = 0;
  List<int> _ans = [-1, -1, -1, -1, -1]; //문제의 최대 개수는 5개
  List<bool> _ansCheck = [false, false, false, false]; //정답은 최대 4개

  Widget build(BuildContext context) {
    // for (int i = 0; i < widget.quizzes.length; i++) {
    //   _ans.add(-1);
    //   _ansCheck.add(false);
    // }
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    final standardDeviceWidth = 390;
    final standardDeviceHeight = 844;
    final double sh = (height / standardDeviceHeight);
    final double sd = (width / standardDeviceWidth);

    return Scaffold(
        backgroundColor: Colors.white, body: quizpiece(context, sh, sd));
  }

  Widget quizpiece(BuildContext context, double sh, double sd) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(30 * sd, 80 * sh, 30 * sd, 50 * sh),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //퀴즈 이름
            Text.rich(
              TextSpan(
                text: "QUIZ ${_currentIndex + 1}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontFamily: 'PTSansRegular',
                ),
                children: [
                  TextSpan(
                    text: "/${widget.quizzes.length}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'PTSansRegular',
                    ),
                  )
                ],
              ),
            ),
            Divider(
              thickness: 1,
              color: Color.fromARGB(255, 65, 65, 65),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(17),
                width: 350 * sd,
                height: 370,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 231, 240, 245),
                    borderRadius: BorderRadius.circular((25))),
                child: Swiper(
                  controller: _controller,
                  physics: NeverScrollableScrollPhysics(),
                  loop: false,
                  itemCount: widget.quizzes.length,
                  itemBuilder: (BuildContext context, int index) {
                    print(widget.quizzes.length);
                    print(index);
                    return quiz_card(sh, sd, context, widget.quizzes[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column quiz_card(double sh, double sd, BuildContext context, mquiz quiz) {
    return Column(
      children: [
        //quiz content
        SingleChildScrollView(
          child: Text(
            quiz.question!,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'PTSansRegular',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 70 * sh),
        Column(
          children: _buildCandidates(sd, sh, context, quiz),
        ),
        SizedBox(height: 10),
        //다음, 결과보기 버튼 (크기조정 필요)
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 10, bottom: 0),
          child: ElevatedButton(
            style: ButtonStyle(
                padding:
                    MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.only(
                  left: 90,
                  right: 90,
                  top: 10,
                  bottom: 10,
                )),
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 201, 218, 231))),
            child: Text(
              _currentIndex == widget.quizzes.length - 1
                  ? 'show result'
                  : 'next quiz',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
                fontFamily: 'PTSansRegular',
              ),
            ),
            onPressed: _ans[_currentIndex] == -1
                ? null
                : () {
                    if (_currentIndex == widget.quizzes.length - 1) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => quizEnd(
                            quizzes: widget.quizzes,
                            userAns: _ans,
                          ),
                        ),
                      );
                    } else {
                      setState(() {
                        _ansCheck = [false, false, false, false];
                        _currentIndex += 1;
                        _controller.next();
                      });
                    }
                  },
          ),
        ),
      ],
    );
  }

  List<Widget> _buildCandidates(
      double sd, double sh, BuildContext context, mquiz quiz) {
    List<Widget> _children = [];
    for (int i = 0; i < quiz.answers!.length; i++) {
      _children.add(
        CandWidget(
          sd: sd,
          sh: sh,
          superContext: context,
          ans: quiz.answers![i],
          index: i,
          answerCheck: _ansCheck[i],
          tap: () {
            setState(
              () {
                for (int j = 0; j < quiz.answers!.length; j++) {
                  if (j == i) {
                    _ansCheck[j] = true;
                    _ans[_currentIndex] = j;
                  } else {
                    _ansCheck[j] = false;
                  }
                }
              },
            );
          },
        ),
      );
      _children.add(SizedBox(height: 10 * sh));
    }
    return _children;
  }
}

class CandWidget extends StatefulWidget {
  double sd;
  double sh;
  BuildContext superContext;
  Answers ans;
  int index;
  bool answerCheck;
  VoidCallback tap;

  CandWidget(
      {required this.sd,
      required this.sh,
      required this.superContext,
      required this.ans,
      required this.index,
      required this.answerCheck,
      required this.tap});
  _CandWidgetState createState() => _CandWidgetState();
}

class _CandWidgetState extends State<CandWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(
            20 * widget.sd, 17 * widget.sh, 20 * widget.sd, 17 * widget.sh),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Color.fromARGB(255, 185, 203, 218)),
          color: widget.answerCheck ? Colors.blue : Colors.white,
        ),
        child: InkWell(
          child: Text(
            widget.ans.content!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: widget.answerCheck ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
      onTap: () {
        setState(() {
          widget.tap();
          widget.answerCheck = !widget.answerCheck;
        });
      },
    );
  }
}
