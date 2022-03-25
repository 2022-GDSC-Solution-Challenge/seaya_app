import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seaya_app/providers/UserProvider.dart';
import 'package:seaya_app/widgets/naviwidget/Navigation.dart';
import 'package:seaya_app/screens/loginpage/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:seaya_app/widgets/menuwidget/sign_textform.dart';
import 'package:seaya_app/widgets/menuwidget/signup_button.dart';
import 'package:seaya_app/utilities/Authservice.dart';
import 'package:http/http.dart' as http;

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  LogInState createState() => LogInState();
}

//이미지 배치 구글, 페북 수정하기!!
class LogInState extends State<LogIn> {
  //final _authInstance = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();
  String? _userEmail;
  String? _userPassword;
  final Authservice _auth = Authservice();
  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _tryValidation(context, _userEmail, _userPassword) async {
    final isValid = _formkey.currentState!.validate();
    if (isValid) {
      _formkey.currentState!.save();
      await _auth.signIn(context, _userEmail, _userPassword);
    }
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 120.0,
              ),

              //sub로고, 로그인 title
              SizedBox(
                width: 354,
                child: Row(
                  children: const [
                    SizedBox(
                      width: 12.0,
                    ),
                    Image(
                      width: 54.0,
                      image: AssetImage(
                        'images/seaya_logo.png',
                      ),
                    ),
                    SizedBox(
                      width: 13.0,
                    ),
                    Text("LOG IN",
                        style: TextStyle(
                            color: Color(0xff02171a),
                            fontFamily: 'PTSansRegular"',
                            fontSize: 15.0),
                        textAlign: TextAlign.left),
                  ],
                ),
              ),

              //로그인 폼
              Form(
                  key: _formkey,
                  child: Theme(
                      data: ThemeData(
                          primaryColor: const Color(0xffa9c8cb),
                          inputDecorationTheme: const InputDecorationTheme(
                              labelStyle: TextStyle(
                                  color: Color(0xff333333), fontSize: 10.0))),
                      child: Container(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          children: <Widget>[
                            //이메일
                            CustomTextField(
                              ValueKey('email'),
                              TextInputType.emailAddress,
                              (value) {
                                print('email val');
                                return (value.isEmpty || !value.contains('@'))
                                    ? ('올바른 이메일 주소를 입력해주세요')
                                    : null;
                              },
                              (value) {
                                _userEmail = value!;
                              },
                              'E-mail',
                              context,
                            ),
                            //비밀번호
                            CustomTextField(
                              ValueKey('pw'),
                              TextInputType.visiblePassword,
                              (value) {
                                return (value.isEmpty || value.length < 7)
                                    ? '올바른 비밀번호를 입력해주세요'
                                    : null;
                              },
                              (value) {
                                _userPassword = value!;
                              },
                              'Password',
                              context,
                            ),
                            const SizedBox(
                              height: 50.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //Login 버튼
                                Container(
                                  width: 150.0,
                                  height: 50.0,
                                  child: customElevatedButton(
                                    () async {
                                      print('signin buttom pressed');
                                      _tryValidation(
                                          context, _userEmail, _userPassword);
                                    },
                                    'Login',
                                    context,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                //Sign up 버튼
                                Container(
                                  width: 150.0,
                                  height: 50.0,
                                  child: customElevatedButton(
                                    () async {
                                      setState(() {
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const SignUp(),
                                          ),
                                        );
                                      });
                                    },
                                    'Sign up',
                                    context,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(
                              height: 80.0,
                            ),
                            Column(children: [
                              //구글로 로그인
                              Stack(
                                children: [
                                  Container(
                                    width: 310.0,
                                    height: 40.0,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: const Color(0xffffffff),
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                            color: Color.fromARGB(
                                                134, 236, 236, 236),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(7),
                                        ),
                                      ),
                                      child: const Text(
                                        '         Sign in with Google',
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Color(0xff2B2B2B),
                                          fontFamily: 'PTSansRegular',
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          /*
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => BasicPage(),
                                    ),
                                  );
                                  */
                                        });
                                      },
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 77.0),
                                    padding: const EdgeInsets.all(16.0),
                                    child: const Image(
                                      width: 16.0,
                                      image: AssetImage(
                                        'images/google_icon.png',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              //페이스북으로 로그인
                              Stack(
                                children: [
                                  Container(
                                    width: 310.0,
                                    height: 40.0,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: const Color(0xff3B5898),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                        ),
                                      ),
                                      child: const Text(
                                        '          Log in with Facebook',
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Color(0xffffffff),
                                          fontFamily: 'PTSansRegular',
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          /*
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => BasicPage(),
                                    ),
                                  );
                                  */
                                        });
                                      },
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 75.0),
                                    padding: const EdgeInsets.all(14.0),
                                    child: const Image(
                                      width: 19.0,
                                      image: AssetImage(
                                        'images/Facebook_icon.png',
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ]),
                          ],
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
