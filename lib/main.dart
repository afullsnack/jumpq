import 'package:flutter/material.dart';
import 'package:jumpq/screens/screens.dart';

void main() => runApp(MaterialApp(
//  home: Home(title: 'Home'),
      initialRoute: 'splash',
      routes: {
        'splash': (context) => Splash(),
        'register': (context) => Register(
              title: 'Register',
            ),
        'login': (context) => Login(
              title: 'Login',
            ),
        'home': (context) => Home(
              title: 'Home',
            ),
        'cart': (context) => Cart(
              title: 'Cart',
            ),
        'transaction': (context) => Transaction(
              title: 'Transaction',
            ),
        'profile': (context) => Profile(
              title: 'Profile',
            ),
        'shop': (context) => Shop(
              title: 'Shop',
            ),
        'pay_options': (context) => PayOptions(),
        // 'scan_code': (context) => QRViewExample(),
      },
    ));
