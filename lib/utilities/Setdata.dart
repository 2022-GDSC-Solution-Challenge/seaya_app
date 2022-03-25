import 'dart:convert';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:seaya_app/models/campaignModel.dart';
import 'package:seaya_app/models/newsModel.dart';
import 'package:seaya_app/utilities/makeJson.dart';
import 'package:http/http.dart' as http;
import 'package:seaya_app/models/userModel.dart';
import 'package:seaya_app/models/missionModel.dart';

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

Future<mNews> setNewsData() async {
  late mNews news;
  final _authInstance = FirebaseAuth.instance;
  final makeJson get = makeJson();
  String id = await _authInstance.currentUser!.getIdToken(true);
  String link = "news";

  final response = await get.getJson(id, link);
  final data = json.decode(response!);
  news = mNews.fromJson(data);
  return news;
}

Future getSummNews(int newsId) async {
  final _authInstance = FirebaseAuth.instance;
  final makeJson get = makeJson();
  String id = await _authInstance.currentUser!.getIdToken(true);
  String link = "news/${newsId}";

  final response = await get.getJson(id, link);
  final data = json.decode(response!);
  return data;
}

Future<mCampaign> setCampaignData() async {
  late mCampaign campaign;
  final _authInstance = FirebaseAuth.instance;
  final makeJson get = makeJson();
  String id = await _authInstance.currentUser!.getIdToken(true);
  String link = "campaign";

  final response = await get.getJson(id, link);
  final data = json.decode(response!);
  campaign = mCampaign.fromJson(data);
  return campaign;
}

Future<mMission> setMission() async {
  late mMission missions;
  final _authInstance = FirebaseAuth.instance;
  final makeJson get = makeJson();
  String id = await _authInstance.currentUser!.getIdToken(true);
  String link = "mission";

  final response = await get.getJson(id, link);
  final data = json.decode(response!);
  missions = mMission.fromJson(data);
  return missions;
}

Future<bool> clearMission(int missionId) async {
  final _authInstance = FirebaseAuth.instance;
  final makeJson post = makeJson();
  try {
    String id = await _authInstance.currentUser!.getIdToken(true);
    String link = 'mission/${missionId}/clear';
    String json = '''{}''';

    final response = await post.postJson(id, link, json);
    return true;
  } on Exception catch (e) {
    print('error from clear mission');
    print(e);
    return false;
  }
}

Future<bool> cancleMission(int missionId) async {
  final _authInstance = FirebaseAuth.instance;
  final makeJson post = makeJson();
  try {
    String id = await _authInstance.currentUser!.getIdToken(true);
    String link = 'mission/${missionId}/cancle';
    String json = '''{}''';

    final response = await post.postJson(id, link, json);
    return true;
  } on Exception catch (e) {
    print('error from clear mission');
    print(e);
    return false;
  }
}
