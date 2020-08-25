import 'package:flutter/material.dart';
import 'package:jumpq/widgets/header.dart';

class Profile extends StatelessWidget {
  Profile({Key key, this.title}) : super(key: key);

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
              padding: const EdgeInsets.all(10.0),
              child: Card(
                elevation: 6,
                color: Colors.white,
                shadowColor: Colors.grey,
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage: AssetImage('assets/logo.png'),
                    ),
                    Form(
                        autovalidate: true,
                        child: Column(
                          children: <Widget>[],
                        ))
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
