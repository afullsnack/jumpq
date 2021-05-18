import 'package:flutter/material.dart';
import 'package:jumpq/models/index.dart';
import 'package:jumpq/network/transaction_req.dart';
import 'package:jumpq/widgets/widgets.dart';

class TransactionScreen extends StatefulWidget {
  TransactionScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  List<Transaction> transactions = [];

  void _getTransactions() async {
    var data = await fetchTransactions();

    setState(() {
      transactions = data;
    });
  }

  @override
  void initState() {
    _getTransactions();
    super.initState();
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
          Expanded(
            flex: 6,
            child: Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: transactions
                      .map((item) => TransactionView(
                            item: item,
                            removeItem: () {
                              setState(() {
                                transactions.remove(item);
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
