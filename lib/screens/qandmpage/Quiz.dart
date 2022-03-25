import 'package:flutter/material.dart';
import 'package:seaya_app/widgets/menuwidget/Menu.dart';
import 'package:seaya_app/screens/loginpage/login.dart';
import 'package:seaya_app/screens/mainhomepage/Sea.dart';
import 'package:seaya_app/screens/qandmpage/quizList.dart';
import 'package:seaya_app/screens/qandmpage/quizEnd.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

// ignore: camel_case_types
class _QuizState extends State<Quiz> with SingleTickerProviderStateMixin {
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    print(height);
    print(width);

    final standardDeviceWidth = 390;
    final standardDeviceHeight = 844;



    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10 * (height / standardDeviceHeight)
              ),
              Image(
                width: 365.0 * (width / standardDeviceWidth),
                image: AssetImage(
                  'images/Quiz.png',
                ),
              ),
              SizedBox(
                height: 20 * (height / standardDeviceHeight)
              ),
              Text(
                'Take the quiz',
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'PTSansRegular',
                ),
              ),
              SizedBox(
                height: 8 * (height / standardDeviceHeight)
              ),
              Text(
                'This is a guide before taking the quiz.',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'PTSansRegular',
                ),
              ),
              Text(
                'Please read carefully and click the "Go" button.',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'PTSansRegular',
                ),
              ),
              SizedBox(
                height: 30 * (height / standardDeviceHeight)
              ),
              Column(
                children: [
                  Text(
                    '1. Take a quiz that comes out at random.',
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'PTSansRegular',
                    ),
                  ),
                  Text(
                    '2. Click the "Next" button.',
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'PTSansRegular',
                    ),
                  ),
                  Text(
                    '3. Challenge yourself towards a perfect score!',
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'PTSansRegular',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30 * (height / standardDeviceHeight)
              ),
              ElevatedButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.only(
                      left: 150,
                      right: 150,
                      top: 12,
                      bottom: 12,
                    )),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 219, 231, 240))),
                onPressed:  () {
                              setState(() {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => quizList(),
                                  ),
                                );
                              });
                            },
                child: const Text('Go!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
