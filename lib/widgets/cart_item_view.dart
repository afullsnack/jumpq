import 'package:flutter/material.dart';
import 'package:jumpq/models/index.dart';

class CartItemView extends StatelessWidget {
  final CartItem item;
  final Function removeCartItem;
  CartItemView({this.item, this.removeCartItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 6,
      child: Row(
        children: [
          Image(
            width: 110,
            height: 110,
            fit: BoxFit.contain,
            image: NetworkImage(item.imgUrl),
          ),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.product,
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                item.quantity.toString(),
                style: TextStyle(
                  color: Colors.black.withOpacity(.5),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                item.id.toString(),
                style: TextStyle(
                  color: Colors.black.withOpacity(.5),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '${item.currency} ${item.price}',
                style: TextStyle(
                  color: Colors.greenAccent[700],
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          SizedBox(width: 95),
          GestureDetector(
            onTap: () {
              removeCartItem();
            },
            child: Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}
