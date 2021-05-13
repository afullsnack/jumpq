import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:jumpq/models/cart_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<CartItem> parse(String responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  List<CartItem> cartItems =
      list.map((item) => CartItem.fromJson(item)).toList();
  return cartItems;
}

Future<List<CartItem>> fetch() async {
  final response = await http.get('url');
  if (response.statusCode == 200) {
    return compute(parse, response.body);
  } else {
    throw Exception('Can\'t get a response from the endpoint');
  }
}

Future<Object> verifyBranchId(String branchId) async {
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  var apiToken = "D31XmcPBVbSBIa9GmczLaeDx2r08gulQM1TkA5S1W0SO5gURf6B0717SlcoV";
  var url = 'https://myjumpq.net/api/user/branch/$branchId';
  var data;

  var response = await http.get(url, headers: {"api_token": apiToken});

  if (response.statusCode == 422) {
    dynamic res = jsonDecode(response.body);
    print(res);
    throw Exception(res);
  }

  if (response.statusCode == 200) {
    dynamic res = jsonDecode(response.body);

    // print(res["data"]);

    data = res["message"] == "Branch Exist"
        ? res["data"]["branch"]
        : res["message"];
  }

  return data;
}

Future<List> getCartData() async {
  var apiToken = "dPimeH5SaQmKWQsSfM4FsLwqSIrBNNzt5ruMztnDA3EidftoBGU9AlgRMa8R";

  var url = 'https://myjumpq.net/api/user/cart';
  var data;

  var response = await http.get(url, headers: {"api_token": apiToken});

  if (response.statusCode == 300) {
    dynamic res = jsonDecode(response.body);
    print(res);
    throw Exception(res);
  }

  if (response.statusCode == 200) {
    dynamic res = jsonDecode(response.body);

    // print(res);

    data = res as List;
  }

  return data;
}
