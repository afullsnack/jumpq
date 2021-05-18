import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:jumpq/models/index.dart';

class TransactionView extends StatelessWidget {
  TransactionView({this.item, this.removeItem});

  final Transaction item;
  final Function removeItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            'Transaction ID: #${item.transactionId}',
            style: TextStyle(
              color: Colors.orangeAccent[700],
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text('${item.transactionDate}'),
          SizedBox(
            height: 30.0,
          ),
          Text(
            item.status == '0' ? 'Succesful' : 'Pending',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            '${item.subTotal}',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.greenAccent[700],
            ),
          ),
        ],
      ),
    );
  }
}
