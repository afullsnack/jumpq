import 'dart:convert';
// import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:jumpq/models/cart_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<CartItem> parse(dynamic responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  List<CartItem> cartItems =
      list.map((item) => CartItem.fromJson(item)).toList();
  return cartItems;
}

// Fetch the cart data with the users api_token getten from a logged in user
Future<List<CartItem>> fetchCart() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? apiToken = prefs.getString('api_token');

  var url = Uri.parse('https://myjumpq.net/api/user/cart');
  // var data;

  final response = await http.get(url, headers: {"api_token": apiToken!});
  // var response = await Dio().get(
  //   url,
  //   options: Options(headers: {"api_token": apiToken}),
  // );

  if (response.statusCode == 200) {
    return compute(parse, response.body);
  } else {
    throw Exception(response.body);
  }
}

// Delete the item from cart by passing the itemID
Future deleteCartItem(int itemId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? apiToken = prefs.getString('api_token');
  var url = Uri.parse("https://myjumpq.net/api/user/remove_from_cart/$itemId");

  final response = await http.get(url, headers: {"api_token": apiToken!});
  // var response = await Dio().get(
  //   url,
  //   options: Options(headers: {"api_token": apiToken}),
  // );

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

// Veriffy branch while entering cart screen
Future<Object> verifyBranchId(String branchId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? apiToken = prefs.getString('api_token');
  var url = Uri.parse('https://myjumpq.net/api/user/branch/$branchId');
  var data;

  var response = await http.get(url, headers: {"api_token": apiToken!});
  // var response = await Dio().get(
  //   url,
  //   options: Options(headers: {"api_token": apiToken}),
  // );

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
