import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:seaya_app/utilities/Setdata.dart';
import 'package:seaya_app/models/userModel.dart';
import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier {
  mUser? user;

  fetchData() async {
    print('get user data');
    user = await setUserData();
    print(user);
    notifyListeners(); // data 가 수정되었다고 알려주기
  }
}
