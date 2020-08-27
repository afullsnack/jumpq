import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jumpq/widgets/widgets.dart';

class Home extends StatelessWidget {
  Home({Key key, this.title}) : super(key: key);

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
              Icons.exit_to_app,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: <Widget>[
//                  SizedBox(height: 20.0,),
                  Expanded(
                    flex: 1,
                    child: Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      margin: EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                FloatingActionButton(
                                  elevation: 5,
                                  highlightElevation: 3,
                                  backgroundColor: Colors.deepOrange[700],
                                  mini: true,
                                  child: Icon(Icons.person),
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'profile');
                                  },
                                ),
                                SizedBox(
                                  width: 12.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('John Doe'),
                                    Text('johndoe@gmil.com'),
                                    Text('+234 9081146028'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 3.0,
                            color: Colors.grey[700],
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 5.0),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 4,
                                itemBuilder: (context, i) {
                                  return Container(
                                    width:
                                        (MediaQuery.of(context).size.width / 3),
                                    margin: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 3),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Image(
                                          image: AssetImage('assets/logo.png'),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                'Product',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                              Text(
                                                '#10,000',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.deepOrange[700],
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Divider(
                            height: 3.0,
                            color: Colors.grey[700],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 10.0),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: FlatButton(
                                color: Colors.deepOrange[700],
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Text(
                                  'PAY NOW',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  print('Pay now pressed');
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      margin: EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 20.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Activities',
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            height: 5,
                            thickness: 2,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 3.0, horizontal: 8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: FlatButton(
                                        padding: EdgeInsets.all(15.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        onPressed: () {
//                                    print('Shop Button pressed!');
                                          Navigator.pushNamed(context, 'shop');
                                        },
                                        color: Colors.deepOrange[700],
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(
                                              Icons.account_balance,
                                              color: Colors.white,
                                              size: 43.0,
                                            ),
                                            SizedBox(
                                              height: 14.0,
                                            ),
                                            Text(
                                              'Shop for products',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: FlatButton(
                                        padding: EdgeInsets.all(15.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        onPressed: () {
//                                    print('Cart Button pressed!');
                                          Navigator.pushNamed(context, 'cart');
                                        },
                                        color: Colors.deepOrange[700],
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(
                                              Icons.shopping_cart,
                                              color: Colors.white,
                                              size: 43.0,
                                            ),
                                            SizedBox(
                                              height: 14.0,
                                            ),
                                            Text(
                                              'Cart',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: FlatButton(
                                        padding: EdgeInsets.all(15.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        onPressed: () {
//                                    print('Transaction Histroy Button pressed!');
                                          Navigator.pushNamed(
                                              context, 'transaction');
                                        },
                                        color: Colors.deepOrange[700],
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(
                                              Icons.format_list_bulleted,
                                              color: Colors.white,
                                              size: 43.0,
                                            ),
                                            SizedBox(
                                              height: 14.0,
                                            ),
                                            Text(
                                              'Transaction History',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
