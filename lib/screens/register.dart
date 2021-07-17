import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  Register({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _firstname;
  String _lastname;
  String _username;
  String _email;
  String _mobile;
  String _password;
  String _confirmPass;

  final GlobalKey<FormState> _formKeyRegister = GlobalKey<FormState>();

  void register(Map userData) async {
    Uri url = 'https://myjumpq.net/api/user/register' as Uri;
    var response = await http.post(url, body: userData);

    if (response.statusCode == 300) {
      dynamic res = jsonDecode(response.body);
      print(res['errors']);
      return;
    }

    if (response.statusCode == 200) {
      dynamic res = jsonDecode(response.body);
      print('message: ${res['message']}');
      // print('user: ${res['user']}');

      Navigator.pushReplacementNamed(context, 'home');
    }
  }

  // build methods for all the TextFormField
  Widget _buildFirstName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('FIRST NAME :'),
        SizedBox(height: 8.0),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 14.0),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30),
            ),
            filled: true,
            fillColor: Colors.blueGrey[100].withOpacity(.5),
          ),
          validator: (String value) {
            if (value.isEmpty) {
              return 'First name is required';
            }
            return null;
          },
          onSaved: (String value) {
            _firstname = value;
          },
        ),
      ],
    );
  }

  Widget _buildLastName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('LAST NAME :'),
        SizedBox(height: 8.0),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 14.0),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30),
            ),
            filled: true,
            fillColor: Colors.blueGrey[100].withOpacity(.5),
          ),
          validator: (String value) {
            if (value.isEmpty) {
              return 'Last name is required';
            }
            return null;
          },
          onSaved: (String value) {
            _lastname = value;
          },
        ),
      ],
    );
  }

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

  Widget _buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('EMAIL :'),
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
              return 'Email is required';
            }
            return null;
          },
          onSaved: (String value) {
            _email = value;
          },
        ),
      ],
    );
  }

  Widget _buildMobile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('MOBILE :'),
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
              return 'Mobile is required';
            }
            return null;
          },
          onSaved: (String value) {
            _mobile = value;
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

  Widget _buildConfirmPass() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('CONFIRM PASSWORD :'),
        SizedBox(height: 8.0),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          cursorColor: Colors.black12,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 20.0),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(40),
            ),
            filled: true,
            fillColor: Colors.blueGrey[100].withOpacity(.5),
          ),
          validator: (String value) {
            if (value.isEmpty) {
              return 'You need to re-enter your password';
            }
            if (value != _password) {
              return 'Please input the same password as above';
            }
            return null;
          },
          onSaved: (String value) {
            _confirmPass = value;
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                key: _formKeyRegister,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: _buildFirstName(),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          flex: 1,
                          child: _buildLastName(),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.0),
                    _buildUserName(),
                    SizedBox(height: 15.0),
                    _buildEmail(),
                    SizedBox(height: 15.0),
                    _buildMobile(),
                    SizedBox(height: 15.0),
                    _buildPassword(),
                    SizedBox(height: 15.0),
                    _buildConfirmPass(),
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
                          'Register',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          if (!_formKeyRegister.currentState.validate()) {
                            return;
                          }

                          _formKeyRegister.currentState.save();

                          register({
                            'firstname': _firstname,
                            'lastname': _lastname,
                            'username': _username,
                            'email': _email,
                            'phone': _mobile,
                            'password': _password,
                            'password_confirmation': _confirmPass
                          });

                          print(_firstname);
                          print(_lastname);
                          print(_username);
                          print(_email);
                          print(_mobile);
                          print(_password);
                          print(_confirmPass);
                        },
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text('By signing up you agree to our terms and conditions'),
                    SizedBox(height: 24.0),
                    Text('Already have an account? Login'),
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
