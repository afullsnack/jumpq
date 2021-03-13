import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _username;
  String _password;

  final GlobalKey<FormState> _formKeyLogin = GlobalKey<FormState>();

  void login(Map userData) async {
    var url = 'https://myjumpq.net/api/user/login';
    var response = await http.post(url, body: userData);

    if (response.statusCode == 300) {
      dynamic res = jsonDecode(response.body);
      print(res['errors']);
      return;
    }

    if (response.statusCode == 200) {
      Map<String, dynamic> res = jsonDecode(response.body);
      print('message: ${res['message']}');
      print('user: ${res['user']}');

      Navigator.pushReplacementNamed(context, 'home', arguments: res['user']);
    }
  }

  // build methods for all the TextFormField

  Widget _buildUserName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('USERNAME :'),
        SizedBox(height: 8.0),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            hintMaxLines: 25,
            contentPadding: EdgeInsets.only(left: 20.0),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30),
            ),
            filled: true,
            fillColor: Colors.blueGrey[100].withOpacity(.5),
          ),
          validator: (String value) {
            if (value.isEmpty) {
              return 'Username is required';
            }
            return null;
          },
          onSaved: (String value) {
            _username = value;
          },
        ),
      ],
    );
  }

  Widget _buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('PASSWORD :'),
        SizedBox(height: 8.0),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 20.0),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30),
            ),
            filled: true,
            fillColor: Colors.blueGrey[100].withOpacity(.5),
          ),
          validator: (String value) {
            if (value.isEmpty) {
              return 'Password is required';
            }
            return null;
          },
          onSaved: (String value) {
            _password = value;
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.grey[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20.0, top: 50.0, bottom: 20.0),
            child: Text(
              '${widget.title}',
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.deepOrange,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Form(
                key: _formKeyLogin,
                child: Column(
                  children: <Widget>[
                    _buildUserName(),
                    SizedBox(height: 15.0),
                    _buildPassword(),
                    SizedBox(height: 20.0),
                    SizedBox(
                      width: double.infinity,
                      height: 55.0,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        color: Colors.deepOrange,
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          if (!_formKeyLogin.currentState.validate()) {
                            return;
                          }

                          _formKeyLogin.currentState.save();

                          login({
                            'username': _username,
                            'password': _password,
                          });

                          print(_username);
                          print(_password);
                        },
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text('Can\'t login? Forgot Password'),
                    SizedBox(height: 24.0),
                    Text("Don't have an account? Register"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
