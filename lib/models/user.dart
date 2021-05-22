import 'package:flutter/material.dart';

class User {
  String username;
  String firstname;
  String lastname;
  String email;
  String phone;
  String apiToken;

  User({
    @required this.username,
    @required this.firstname,
    @required this.lastname,
    @required this.email,
    @required this.phone,
    @required this.apiToken,
  });

  User.fromJson(Map<String, dynamic> json) {
    this.username = json["username"];
    this.firstname = json["firstname"];
    this.lastname = json["lastname"];
    this.email = json["email"];
    this.phone = json["phone"];
    this.apiToken = json["api_token"];
  }
}
