import 'package:flutter/material.dart';
import 'package:seaya_app/widgets/menuwidget/Menu.dart';
import 'package:seaya_app/screens/loginpage/login.dart';
import 'package:seaya_app/screens/mainhomepage/Sea.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

// ignore: camel_case_types
class _QuizState extends State<Quiz> with SingleTickerProviderStateMixin {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Image(
              width: 365.0,
              image: AssetImage(
                'images/Quiz.png',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Take the quiz',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'PTSansRegular',
              ),
            ),
            SizedBox(
              height: 8,
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
              height: 30,
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
              height: 30,
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
              onPressed: null,
              child: const Text('Go!'),
            ),
          ],
        ),
      ),
    );
  }
}
