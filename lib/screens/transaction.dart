import 'package:flutter/material.dart';
import 'package:jumpq/widgets/widgets.dart';
import 'package:jumpq/services/services.dart';

class Transaction extends StatefulWidget {
  Transaction({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TransactionState createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  List<TransactionItem> transactionItems = [
    TransactionItem(
        name: 'Sneakers jogging',
        color: 'Blue/White',
        price: '4,500',
        // qty: 1,
        productCode: '001123',
        storeId: '0001',
        status: 'completed'),
    TransactionItem(
        name: 'Fashion sneakers',
        color: 'Blue/Grey',
        price: '3,500',
        // qty: 1,
        productCode: '001432',
        storeId: '0001',
        status: 'completed'),
    TransactionItem(
        name: 'Fashion jacket',
        color: 'Dark Grey',
        price: '10,000',
        // qty: 1,
        productCode: '002092',
        storeId: '0001',
        status: 'completed'),
    TransactionItem(
        name: 'Fashion sneakers',
        color: 'Pink/Grey',
        price: '4,550',
        // qty: 1,
        productCode: '001332',
        storeId: '0001',
        status: 'completed'),
    TransactionItem(
        name: 'Fashion jacket',
        color: 'Dark Grey',
        price: '10,000',
        // qty: 1,
        productCode: '001212',
        storeId: '0001',
        status: 'completed'),
    TransactionItem(
        name: 'Fashion sneakers',
        color: 'Blue/Grey',
        price: '3,500',
        // qty: 1,
        productCode: '001122',
        storeId: '0001',
        status: 'completed'),
  ];

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
          Expanded(
            flex: 6,
            child: Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: transactionItems
                      .map((item) => TransactionItemView(
                            item: item,
                            removeItem: () {
                              setState(() {
                                transactionItems.remove(item);
                              });
                            },
                          ))
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
