import 'package:flutter/material.dart';
import 'package:jumpq/widgets/header.dart';

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

  Widget _buildUsername() {
    return TextFormField(
      keyboardType: TextInputType.text,
      readOnly: true,
      showCursor: true,
      cursorColor: Colors.deepOrangeAccent[700],
      decoration: InputDecoration(
        // labelText: 'USERNAME',
        contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        enabledBorder: OutlineInputBorder(
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
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        filled: true,
        fillColor: Colors.grey[300],
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
      keyboardType: TextInputType.emailAddress,
      readOnly: true,
      showCursor: true,
      cursorColor: Colors.deepOrangeAccent[700],
      decoration: InputDecoration(
        // labelText: 'EMAIL',
        contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        enabledBorder: OutlineInputBorder(
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
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        filled: true,
        fillColor: Colors.grey[300],
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
      keyboardType: TextInputType.phone,
      readOnly: true,
      showCursor: true,
      cursorColor: Colors.deepOrangeAccent[700],
      decoration: InputDecoration(
        // labelText: 'MOBILE',
        contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        enabledBorder: OutlineInputBorder(
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
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        filled: true,
        fillColor: Colors.grey[300],
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
      keyboardType: TextInputType.visiblePassword,
      readOnly: true,
      showCursor: true,
      cursorColor: Colors.deepOrangeAccent[700],
      decoration: InputDecoration(
        // labelText: 'PASSWORD',
        contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        enabledBorder: OutlineInputBorder(
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
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        filled: true,
        fillColor: Colors.grey[300],
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'A strong password is required';
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
      keyboardType: TextInputType.visiblePassword,
      readOnly: true,
      showCursor: true,
      cursorColor: Colors.deepOrangeAccent[700],
      decoration: InputDecoration(
        // labelText: 'CONFIRM PASSWORD',
        contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        filled: true,
        fillColor: Colors.grey[300],
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'You need to the same password as above';
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
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.account_circle,
                          size: 60.0,
                          color: Colors.orangeAccent[700],
                        ),
                        // backgroundImage: AssetImage('assets/logo.png'),
                        radius: 40.0,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('USERNAME'),
                            SizedBox(
                              height: 5.0,
                            ),
                            _buildUsername(),
                            Text('EMAIL'),
                            SizedBox(
                              height: 5.0,
                            ),
                            _buildEmail(),
                            Text('MOBILE'),
                            SizedBox(
                              height: 5.0,
                            ),
                            _buildMobile(),
                            Text('PASSWORD'),
                            SizedBox(
                              height: 5.0,
                            ),
                            _buildPassword(),
                            Text('CONFIRM PASSWORD'),
                            SizedBox(
                              height: 5.0,
                            ),
                            _buildConfirmPass(),
                            SizedBox(
                              height: 10.0,
                            ),
                            RaisedButton(
                              child: Text('SAVE'),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              color: Colors.orangeAccent[700],
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
