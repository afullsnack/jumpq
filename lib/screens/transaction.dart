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
              child: ListView(
                padding: EdgeInsets.all(0.0),
                scrollDirection: Axis.vertical,
                children: transactions
                    .map((item) => PopupMenuButton(
                        itemBuilder: (_) => <PopupMenuItem<String>>[
                              new PopupMenuItem<String>(
                                  child: new Text('View Transaction'),
                                  value: 'view_trans'),
                              new PopupMenuItem<String>(
                                  child: new Text('View Transaction Barcode'),
                                  value: 'view_barcode'),
                            ],
                        onSelected: (_) {
                          print(_ == "view_trans"
                              ? "View trans screen"
                              : "View Barcode screen");
                        },
                        child: TransactionView(
                          item: item,
                          removeItem: () {
                            setState(() {
                              transactions.remove(item);
                            });
                          },
                        )))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
