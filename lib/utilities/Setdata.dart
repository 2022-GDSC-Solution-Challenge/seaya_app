import 'dart:convert';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:seaya_app/models/campaignModel.dart';
import 'package:seaya_app/models/competitionModel.dart';
import 'package:seaya_app/models/newsModel.dart';
import 'package:seaya_app/models/quizModel.dart';
import 'package:seaya_app/utilities/makeJson.dart';
import 'package:http/http.dart' as http;
import 'package:seaya_app/models/userModel.dart';
import 'package:seaya_app/models/missionModel.dart';
import 'package:seaya_app/models/friendModel.dart';

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
  if (response == 430) return new mNews();
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

Future setQuiz() async {
  late mQuiz quiz;
  final _authInstance = FirebaseAuth.instance;
  final makeJson get = makeJson();
  String id = await _authInstance.currentUser!.getIdToken(true);
  String link = "quiz/start";

  final response = await get.getJson(id, link);
  if (response == 421) {
    return false;
  }
  final data = json.decode(response!);
  quiz = mQuiz.fromJson(data);
  return quiz;
}

Future<bool> addQuizScore(List<int> result) async {
  final _authInstance = FirebaseAuth.instance;
  final makeJson post = makeJson();
  try {
    String id = await _authInstance.currentUser!.getIdToken(true);
    String link = 'quiz/end';
    String json = '''{"quiz_result" : ${result}}''';

    final response = await post.postJson(id, link, json);
    return true;
  } on Exception catch (e) {
    print('error from update quiz score');
    print(e);
    return false;
  }
}

Future<bool> addNewsPoint(int newsId) async {
  final _authInstance = FirebaseAuth.instance;
  final makeJson post = makeJson();
  try {
    String id = await _authInstance.currentUser!.getIdToken(true);
    String link = 'news/${newsId}';
    String json = '''{}''';

    final response = await post.postJson(id, link, json);
    return true;
  } on Exception catch (e) {
    print('error from clear mission');
    print(e);
    return false;
  }
}

//친구 수락 하기 전 승인리스트 / 전체 친구 정보
Future<mFriend> getReceivename() async {
  late mFriend friends;
  final _authInstance = FirebaseAuth.instance;
  final makeJson get = makeJson();
  String id = await _authInstance.currentUser!.getIdToken(true);
  String link = "friend";

  final response = await get.getJson(id, link);
  final data = json.decode(response!);
  friends = mFriend.fromJson(data);
  return friends;
}

//친구 수락
Future<bool> acceptFriend(int userId) async {
  final _authInstance = FirebaseAuth.instance;
  final makeJson post = makeJson();
  try {
    String id = await _authInstance.currentUser!.getIdToken(true);
    String link = 'friend/${userId}/request';
    String json = '''{}''';

    final response = await post.postJson(id, link, json);
    return true;
  } on Exception catch (e) {
    print('error from post -accept friend-');
    print(e);
    return false;
  }
}
//겨루기 전체 리스트 / 겨루기 승인요청 및 겨루기 중인 리스트
Future<mCompetition> getCompetitionname() async {
  late mCompetition competitor;
  final _authInstance = FirebaseAuth.instance;
  final makeJson get = makeJson();
  String id = await _authInstance.currentUser!.getIdToken(true);
  String link = "cpt";

  final response = await get.getJson(id, link);
  final data = json.decode(response!);
  competitor = mCompetition.fromJson(data);
  return competitor;
}

//겨루기 신청
Future<int> competeFriend(int userId) async {
  final _authInstance = FirebaseAuth.instance;
  final makeJson post = makeJson();
  try {
    String id = await _authInstance.currentUser!.getIdToken(true);
    String link = 'cpt/${userId}/request';
    String json = '''{}''';

    final response = await post.postJson(id, link, json);
    return response;
  } on Exception catch (e) {
    print('error from post -compete request to friend-');
    print(e);
    return -1;
  }
}

//겨루기 승인
Future<bool> acceptCompete(int userId) async {
  final _authInstance = FirebaseAuth.instance;
  final makeJson post = makeJson();
  try {
    String id = await _authInstance.currentUser!.getIdToken(true);
    String link = 'cpt/${userId}/accept';
    String json = '''{}''';

    final response = await post.postJson(id, link, json);
    return true;
  } on Exception catch (e) {
    print('error from post -accept friend-');
    print(e);
    return false;
  }
}
