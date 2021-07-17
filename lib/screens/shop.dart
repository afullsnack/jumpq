import 'package:flutter/material.dart';
import 'package:jumpq/widgets/widgets.dart';
import 'package:barcode_scan2/barcode_scan2.dart';

class Shop extends StatefulWidget {
  Shop({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void scan() async {
    var result = await BarcodeScanner.scan();
    print(result.type);
    print(result.rawContent);
    print(result.format);
    print(result.formatNote);
  }

  @override
  Widget build(BuildContext context) {
    // final branchData = ModalRoute.of(context).settings.arguments as Map;
    // print(branchData);
    return Scaffold(
      //backgroundColor: Colors.grey[300],
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
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      print('Scan entry tapped!');
                      scan();
                      // Navigator.pushNamed(context, 'scan_code');
                    },
                    child: Container(
                      height: 190.0,
                      width: 190.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 9,
                              spreadRadius: -3,
                              offset: Offset(5, 5),
                              color: Colors.grey,
                            ),
                            BoxShadow(
                              blurRadius: 9,
                              spreadRadius: -4,
                              offset: Offset(-7, -7),
                              color: Colors.grey[200],
                            ),
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Tap to scan the barcode',
                    style: TextStyle(
                      fontSize: 19.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 100.0,
                  ),
                  FlatButton(
                    color: Colors.deepOrange[500],
                    textColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 45.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 60.0),
                      child: Text('Add to cart'),
                    ),
                    onPressed: () {
                      print("Add to cart pressed");
                    },
                  ),
                  SizedBox(
                    height: 3.0,
                  ),
                  FlatButton(
                    color: Colors.deepOrange[500],
                    textColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 45.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 65.0),
                      child: Text('View cart'),
                    ),
                    onPressed: () {
                      print("View cart pressed");
                    },
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
