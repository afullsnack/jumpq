import 'package:flutter/material.dart';
import 'package:jumpq/models/index.dart';
import 'package:jumpq/network/cart_req.dart';
import 'package:jumpq/widgets/widgets.dart';

class Cart extends StatefulWidget {
  Cart({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<CartItem> cartItems = [];

  @override
  void initState() {
    // Get the initial data
    _getCartData();
    super.initState();
  }

  _getCartData() async {
    var data = await getCartData();
    print(data);
    print('Inside getCartData');
    data.map((item) => setState(() {
          cartItems.add(
            CartItem(
              name: item["product"],
              // color: 'Blue/White',
              price: item["price"],
              qty: item["quantity"],
              imgUrl: item["thumbnail"]["location"],
            ),
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    final branchData = ModalRoute.of(context).settings.arguments as Map;
    print(branchData);
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
          Expanded(
            flex: 6,
            child: Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: cartItems
                      .map((item) => CartItemView(
                            item: item,
                            removeCartItem: () {
                              setState(() {
                                cartItems.remove(item);
                              });
                            },
                          ))
                      .toList(),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
//                mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'TOTAL',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[700].withOpacity(.6),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '#37,550.00',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrange[500],
                                  fontSize: 21,
                                ),
                              ),
                            ],
                          ),
                          FlatButton(
                            color: Colors.deepOrange[500],
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 3.0, horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('CHECK OUT NOW'),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
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
