import 'package:flutter/material.dart';
import 'package:jumpq/models/index.dart';
import 'package:jumpq/network/cart_req.dart';
import 'package:jumpq/widgets/overlay.dart';
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

  void _getCartData() async {
    var data = await fetchCart();
    // print(data);
    // print('Inside getCartData');
    setState(() {
      cartItems = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as Map;
    final branch = args['branch'];
    print(branch);
    OverlayEntry entry = args['entry'];

    if (cartItems.isNotEmpty) entry.remove();
    final total = cartItems.isNotEmpty
        ? cartItems
            .map((item) => double.parse(item.price) * int.parse(item.quantity))
        : '0.0';
    final currency = cartItems.isNotEmpty ? cartItems[0].currency : 'N';
    // print(branchData);
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
            flex: 1,
            child: Card(
              elevation: 6,
              margin: EdgeInsets.all(10),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Total Amount',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(.56),
                      ),
                    ),
                    Text(
                      '$currency$total',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(.56),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: ListView(
              shrinkWrap: false,
              padding: EdgeInsets.all(0),
              scrollDirection: Axis.vertical,
              children: cartItems
                  .map((item) => CartItemView(
                        item: item,
                        removeCartItem: () async {
                          bool isDeleted = await deleteCartItem(item.id);
                          isDeleted
                              ? setState(() {
                                  cartItems.remove(item);
                                })
                              : throw Exception(
                                  'An error occured while trying to delete item');
                        },
                      ))
                  .toList(),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('CHECKOUT'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.qr_code_sharp),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 20)),
                      backgroundColor: MaterialStateProperty.all(
                        Colors.deepOrangeAccent[400],
                      ),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(120))),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
