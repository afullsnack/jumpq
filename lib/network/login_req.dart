import 'dart:convert';
// import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:jumpq/models/user.dart';
// import 'package:shared_preferences/shared_preferences.dart';

User parse(dynamic responseBody) {
  var data = json.decode(responseBody);
  User user = User.fromJson(data["user"]);
  return user;
}

Future login(Map<String, dynamic> userData) async {
  try {
    var url = Uri.parse('https://myjumpq.net/api/user/login');
    var response = await http.post(url, body: userData);
    // Response response = await Dio().post(
    //   url,
    //   data: userData,
    //   options: Options(headers: {
    //     'Content-Type': 'application/json',
    //     'Accept': 'application/json',
    //   }),
    // );
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // Map<String, dynamic> user;

    if (response.statusCode == 300) {
      dynamic res = jsonDecode(response.body);
      print(res);
      throw Exception(res);
    }

    if (response.statusCode == 200) return compute(parse, response.body);
  } catch (err) {
    print(err);
    throw err;
  }
}
