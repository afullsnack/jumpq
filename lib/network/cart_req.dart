import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:jumpq/models/cart_item.dart';

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
