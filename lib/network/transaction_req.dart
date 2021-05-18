import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:jumpq/models/transaction_item.dart';

List<Transaction> parse(dynamic responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  List<Transaction> transactions =
      list.map((item) => Transaction.fromJson(item)).toList();
  return transactions;
}

// Fetch the cart data with the users api_token getten from a logged in user
Future<List<Transaction>> fetchTransactions() async {
  var apiToken = "UTVU9QPFIXNhXwma2Q0Gq0E1VB7SULaho7ZAlrq9vjshbjwWen6PvnfR7ZJg";

  var url = 'https://myjumpq.net/api/user/transactions';
  // var data;

  final response = await http.get(url, headers: {"api_token": apiToken});

  if (response.statusCode == 200) {
    return compute(parse, response.body);
  } else {
    throw Exception(response.body);
  }
}
