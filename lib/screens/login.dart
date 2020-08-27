import 'package:flutter/material.dart';

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

  // build methods for all the TextFormField

  Widget _buildUserName() {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[300],
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
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
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[300],
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
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
          Text(
            '${widget.title}',
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.deepOrangeAccent[700],
            ),
          ),
          SizedBox(height: 20.0),
          Form(
            key: _formKeyLogin,
            child: Column(
              children: <Widget>[
                _buildUserName(),
                SizedBox(height: 10.0),
                _buildPassword(),
                SizedBox(height: 15.0),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: Colors.deepOrangeAccent[700],
                  child: Text(
                    'Login',
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 60.0),
                  onPressed: () {
                    // if (!_formKeyLogin.currentState.validate()) {
                    //   return;
                    // }

                    Navigator.pushReplacementNamed(context, 'home');

                    _formKeyLogin.currentState.save();

                    print(_username);
                    print(_password);
                  },
                ),
                SizedBox(height: 10.0),
                Text('Can\'t login? Forgot password'),
                SizedBox(height: 24.0),
                Text("Don't have an account? Login"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
