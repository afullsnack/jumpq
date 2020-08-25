import 'package:flutter/material.dart';
import 'package:jumpq/widgets/header.dart';

class Profile extends StatelessWidget {

  Profile({ Key key, this.title }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.deepOrange[700],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Header(
            title: title,
            actionIcon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(38.0),
              child: Text(
                'Profile Screen',
                style: TextStyle(
                  fontSize: 28.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}