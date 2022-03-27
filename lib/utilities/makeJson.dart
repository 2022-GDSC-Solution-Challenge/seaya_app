import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class makeJson {
  //get
  Future getJson(String token, String link) async {
    try {
      final response = await http.get(
        Uri.parse('http://34.64.37.231:8080/$link'),
        headers: {HttpHeaders.authorizationHeader: "$token"},
      );

      //응답 코드 별 분기문
      if (response.statusCode == 200) {
        print(response.body);
        final data = response.body;
        return data;
      } else {
        print(response.reasonPhrase);
        print(response.body);
        return response.statusCode;
      }
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  //post
  Future<int> postJson(String token, String link, String jsonst) async {
    var headers = {
      'Authorization': '${token}',
      'Content-Type': 'application/json'
    };
    var request =
        http.Request('POST', Uri.parse('http://34.64.37.231:8080/${link}'));
    //이거 체크 필요해용
    request.body = jsonst;
    request.headers.addAll(headers);
    //test용 print
    print(token);
    print(link);
    print(request.body);

    http.StreamedResponse response = await request.send();

    //응답 코드 별 분기문
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return 1;
    } else {
      print(response.reasonPhrase);
      return 0;
    }
  }
}
