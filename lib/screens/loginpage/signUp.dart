import 'package:flutter/material.dart';
import 'package:seaya_app/screens/loginpage/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:seaya_app/screens/mainhomepage/Sea.dart';
import 'package:seaya_app/widgets/menuwidget/sign_textform.dart';
import 'package:seaya_app/widgets/menuwidget/signup_button.dart';
import 'package:seaya_app/widgets/naviwidget/Navigation.dart';
import 'package:seaya_app/utilities/Authservice.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  SignUpState createState() => SignUpState();
}

//버튼 가운데 정렬 필요
class SignUpState extends State<SignUp> {
  //final _authInstance = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();
  String? _userEmail;
  String? _userPassword;
  bool? _pwCheck;
  String? _userName;
  String? _userPhone;
  final Authservice _auth = Authservice();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 120.0,
                ),
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
                      Text("SIGN UP",
                          style: TextStyle(
                              color: Color(0xff02171a),
                              fontFamily: 'PTSansRegular',
                              fontSize: 15.0),
                          textAlign: TextAlign.left),
                    ],
                  ),
                ),
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          CustomTextField(
                            ValueKey('email'),
                            TextInputType.emailAddress,
                            (value) {
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
                          SizedBox(height: 20),
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
                          SizedBox(height: 20),
                          CustomTextField(
                            ValueKey('pwcheck'),
                            TextInputType.visiblePassword,
                            (value) {
                              return (value.isEmpty || value != _userPassword)
                                  ? '비밀번호가 일치하지 않습니다.'
                                  : null;
                            },
                            (value) {
                              _pwCheck = true;
                            },
                            'Password - check',
                            context,
                          ),
                          SizedBox(height: 20),
                          CustomTextField(
                            ValueKey('name'),
                            TextInputType.name,
                            (value) {
                              return (value.length < 2) ? '이름을 입력해주세요' : null;
                            },
                            (value) {
                              _userName = value!;
                            },
                            'Name',
                            context,
                          ),
                          SizedBox(height: 20),
                          CustomTextField(
                            ValueKey('phone'),
                            TextInputType.phone,
                            (value) {
                              return (value.length < 10)
                                  ? '번호를 입력해주세요'
                                  : null;
                            },
                            (value) {
                              _userPhone = value!;
                            },
                            'Phone',
                            context,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150.0,
                      height: 50.0,
                      child: customElevatedButton(
                        () async {
                          if (_formkey.currentState!.validate()) {
                            await _auth.signUp(context, _userEmail!,
                                _userPassword!, _userName!);
                          }
                        },
                        'Sign up',
                        context,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      width: 150.0,
                      height: 50.0,
                      child: customElevatedButton(
                        () {
                          setState(() {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const LogIn(),
                              ),
                            );
                          });
                        },
                        'Cancel',
                        context,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
