import 'package:flutter/material.dart';
import 'package:jumpq/models/user.dart';
import 'package:jumpq/widgets/widgets.dart';

class Profile extends StatefulWidget {
  Profile({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _username;
  String _email;
  String _mobile;
  String _password;
  String _confirmPass;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildUsername(username) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('USERNAME :'),
        SizedBox(height: 8.0),
        TextFormField(
          initialValue: '$username',
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
            return '';
          },
          onSaved: (String value) {
            _username = value;
          },
        ),
      ],
    );
  }

  Widget _buildEmail(email) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('EMAIL :'),
        SizedBox(height: 8.0),
        TextFormField(
          initialValue: '$email',
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
            return '';
          },
          onSaved: (String value) {
            _email = value;
          },
        ),
      ],
    );
  }

  Widget _buildMobile(phone) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('MOBILE :'),
        SizedBox(height: 8.0),
        TextFormField(
          initialValue: '$phone',
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
            return '';
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
            return '';
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
            return '';
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
    final User userdata = ModalRoute.of(context).settings.arguments;
    print(userdata);
    return Scaffold(
//      backgroundColor: Colors.deepOrange[700],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Header(
            title: widget.title,
            actionIcon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                elevation: 6,
                color: Colors.white,
                shadowColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 70.0,
                        backgroundColor: Colors.deepOrange,
                        child: Icon(
                          Icons.person,
                          size: 60.0,
                          color: Colors.white,
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 10.0),
                            _buildUsername(userdata.username),
                            SizedBox(height: 10.0),
                            _buildEmail(userdata.email),
                            SizedBox(height: 10.0),
                            _buildMobile(userdata.phone),
                            SizedBox(height: 10.0),
                            _buildPassword(),
                            SizedBox(height: 10.0),
                            _buildConfirmPass(),
                            SizedBox(height: 20.0),
                            SizedBox(
                              width: double.infinity,
                              height: 55.0,
                              child: RaisedButton(
                                child: Text(
                                  'SAVE',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                color: Colors.deepOrange,
                                textColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 75.0,
                                  vertical: 10.0,
                                ),
                                onPressed: () {
                                  if (!_formKey.currentState.validate()) {
                                    return;
                                  }

                                  _formKey.currentState.save();

                                  print(_username);
                                  print(_email);
                                  print(_mobile);
                                  print(_password);
                                  print(_confirmPass);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
