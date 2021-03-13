import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:jumpq/models/index.dart';

class TransactionItemView extends StatelessWidget {
  TransactionItemView({this.item, this.removeItem});

  final TransactionItem item;
  final Function removeItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey[300],
      ),
      child: Padding(
        padding: EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Product Code: #${item.productCode}'),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text('StoreID: ${item.storeId}'),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    '${item.name}',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.orangeAccent[700],
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text('${item.color}'),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    child: Icon(Icons.close),
                    onTap: removeItem,
                  ),
                  SizedBox(
                    height: 14.0,
                  ),
                  Text(
                    '18:14, 25/08',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    '${item.status}'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    '#${item.price}.00',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
