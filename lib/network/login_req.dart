import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String, dynamic>> login(Map userData) async {
  var url = 'https://myjumpq.net/api/user/login';
  var response = await http.post(url, body: userData);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Map<String, dynamic> user;

  if (response.statusCode == 300) {
    dynamic res = jsonDecode(response.body);
    print(res['errors']);
    throw Exception(res['errors']);
  }

  if (response.statusCode == 200) {
    Map<String, dynamic> res = jsonDecode(response.body);
    // print('message: ${res['message']}');
    // print('user: ${res['user']}');

    prefs.setString('api_token', res['user']['api_token']);
    prefs.setString('username', res['user']['username']);
    prefs.setString('firstname', res['user']['firstname']);
    prefs.setString('lastname', res['user']['lastname']);
    prefs.setString('email', res['user']['email']);
    prefs.setString('phone', res['user']['phone']);
    prefs.setBool('isLoggedIn', true);

    user = res['user'];
  }
  return user;
}
