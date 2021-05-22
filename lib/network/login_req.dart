import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:jumpq/models/user.dart';
// import 'package:shared_preferences/shared_preferences.dart';

User parse(dynamic responseBody) {
  var data = json.decode(responseBody);
  var user = User.fromJson(data["user"]);
  return user;
}

Future<User> login(Map userData) async {
  var url = 'https://myjumpq.net/api/user/login';
  var response = await http.post(url, body: userData);
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // Map<String, dynamic> user;

  if (response.statusCode == 300) {
    dynamic res = jsonDecode(response.body);
    print(res);
    throw Exception(res);
  }

  if (response.statusCode == 200) return compute(parse, response.body);
}
