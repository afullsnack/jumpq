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
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'Transaction ID: #${item.transactionId}',
              style: TextStyle(
                color: Colors.orangeAccent[700],
                fontSize: 19,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '${item.transactionDate}',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              item.status == '0' ? 'Succesful' : 'Pending',
              style: TextStyle(
                fontSize: 18.5,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(.6),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              '${item.currency}${item.subTotal}',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.greenAccent[700],
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
