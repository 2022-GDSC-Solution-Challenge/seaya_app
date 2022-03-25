import 'dart:convert';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:seaya_app/utilities/makeJson.dart';
import 'package:http/http.dart' as http;
import 'package:seaya_app/models/userModel.dart';

//정보 가져오는 함수들 모아놓는 자리에용

//유저회원가입시db생성
createUserData(token, String userName) {
  final makeJson post = makeJson();
  String id = token;
  String link = "auth/join";
  String json = '''
{
  "name": "$userName"
}
''';

  post.postJson(id, link, json);
}

//로그인시db테스트
Future<int?> loginUserData(token, String uid) async {
  final makeJson post = makeJson();
  String id = token;
  String link = "auth/login";
  String json = '''
{
}
''';

  final state = await post.postJson(id, link, json);
  print(state);
  return state;
}

//유저정보세팅
Future<mUser> setUserData() async {
  late mUser user;
  final _authInstance = FirebaseAuth.instance;
  final makeJson get = makeJson();
  String id = await _authInstance.currentUser!.getIdToken(true);
  String link = "user/data";

//await써주니 future 형태가 본 모습으로 바뀜 (물음표는 느낌표로 방어해주기)
  final response = await get.getJson(id, link);
  print(response);
  final data = json.decode(response!);

  print(data);
  user = mUser.fromJson(data);
  return user;
}
