import 'dart:convert';

import 'package:news_app/utilites/api_utilites.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationAPI {
  Future<bool> login(String email, String password) async {
    String url = baseApiURL + apiGetToken;
    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded"
    };
    Map<String, String> body = {"email": email, "password": password};
    var response = await http.post(url , headers: headers, body: body);

    if(response.statusCode == 200){
      var jsonData = jsonDecode(response.body);
      var data = jsonData['data'];
      var token = data['token'];
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString("token", token);
      print(token);
      return true;
    }
    return false;
  }
}
