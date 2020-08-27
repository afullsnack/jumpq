import 'package:flutter/material.dart';

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

  // build methods for all the TextFormField
  Widget _buildFirstName() {
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
          return 'First name is required';
        }
        return '';
      },
      onSaved: (String value) {
        _firstname = value;
      },
    );
  }

  Widget _buildLastName() {
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
          return 'Last name is required';
        }
        return '';
      },
      onSaved: (String value) {
        _lastname = value;
      },
    );
  }

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

  Widget _buildEmail() {
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
          return 'Email is required';
        }
        return '';
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildMobile() {
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
          return 'Mobile is required';
        }
        return '';
      },
      onSaved: (String value) {
        _mobile = value;
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

  Widget _buildConfirmPass() {
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.grey[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
            key: _formKeyRegister,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _buildFirstName(),
                    _buildLastName(),
                  ],
                ),
                SizedBox(height: 10.0),
                _buildUserName(),
                SizedBox(height: 10.0),
                _buildEmail(),
                SizedBox(height: 10.0),
                _buildMobile(),
                SizedBox(height: 10.0),
                _buildPassword(),
                SizedBox(height: 10.0),
                _buildConfirmPass(),
                SizedBox(height: 15.0),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: Colors.deepOrangeAccent[700],
                  child: Text(
                    'Register',
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 60.0),
                  onPressed: () {
                    // if (!_formKeyRegister.currentState.validate()) {
                    //   return;
                    // }
                    Navigator.pushReplacementNamed(context, 'login');

                    _formKeyRegister.currentState.save();

                    print(_firstname);
                    print(_lastname);
                    print(_username);
                    print(_email);
                    print(_mobile);
                    print(_password);
                    print(_confirmPass);
                  },
                ),
                SizedBox(height: 10.0),
                Text('By signing up you agree to our terms and conditions'),
                SizedBox(height: 24.0),
                Text('Already have an account? Login'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
