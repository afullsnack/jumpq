import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jumpq/models/user.dart';
import 'package:jumpq/network/login_req.dart';
import 'package:jumpq/provider/login_provider.dart';
import 'package:jumpq/widgets/overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  Login({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? _username;
  String? _password;

  final GlobalKey<FormState> _formKeyLogin = GlobalKey<FormState>();

  void initState() {
    super.initState();
    // isUserLoggedIn();
  }

  Future isUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLoggedIn = prefs.getBool('isLoggedIn');
    final user = new Map<String, dynamic>();
    try {
      if (isLoggedIn != null && isLoggedIn) {
        user['username'] = prefs.getString('username');
        user['firstname'] = prefs.getString('firstname');
        user['lastname'] = prefs.getString('lastname');
        user['email'] = prefs.getString('email');
        user['phone'] = prefs.getString('phone');
        Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false,
            arguments: user);
      } else
        return;
    } catch (e) {
      throw Exception(e.toString());
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
            fillColor: Colors.blueGrey[100]?.withOpacity(.5),
          ),
          validator: (String? value) {
            if (value!.isEmpty) {
              return 'Username is required';
            }
            return null;
          },
          onSaved: (String? value) {
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
          obscureText: true,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 20.0),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30),
            ),
            filled: true,
            fillColor: Colors.blueGrey[100]?.withOpacity(.5),
          ),
          validator: (String? value) {
            if (value!.isEmpty) {
              return 'Password is required';
            }
            return null;
          },
          onSaved: (String? value) {
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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/splash_bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 120.0,
                height: 120.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/logo.png'),
                    fit: BoxFit.contain,
                    alignment: Alignment.topCenter,
                    scale: 4.0,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                '${widget.title}',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              Container(
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
                        child: Consumer(builder: (context, watch, child) {
                          // watch(loginProvider());
                          return RaisedButton(
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
                            onPressed: () async {
                              OverlayEntry entry = showOverlay(context);
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              if (!_formKeyLogin.currentState!.validate()) {
                                return;
                              }

                              _formKeyLogin.currentState?.save();

                              // final asyncValue = context.read(loginProvider({
                              //   'username': _username,
                              //   'password': _password,
                              // }));

                              // final user = asyncValue.whenData((value) {
                              //   print('Inside whenData function');
                              //   print(value);
                              // });

                              final User user = await login({
                                'username': _username,
                                'password': _password,
                              });

                              // set api_token in prefs
                              prefs.setString('api_token', user.apiToken);
                              entry.remove();

                              print('user $user');

                              print(_username);
                              print(_password);
                              Navigator.pushNamedAndRemoveUntil(
                                  context, 'home', (route) => false,
                                  arguments: user);
                            },
                          );
                        }),
                      ),
                      SizedBox(height: 20.0),
                      RichText(
                        text: TextSpan(
                          text: 'Can\'t login? ',
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: 'Forgot Password',
                              style: TextStyle(color: Colors.deepOrange),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account? ',
                            style: TextStyle(color: Colors.black),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, 'register');
                            },
                            child: Text('Register',
                                style: TextStyle(color: Colors.deepOrange)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
