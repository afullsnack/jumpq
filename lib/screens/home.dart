import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jumpq/models/user.dart';
import 'package:jumpq/network/cart_req.dart';
import 'package:jumpq/widgets/overlay.dart';
import 'package:jumpq/widgets/widgets.dart';

class Home extends StatelessWidget {
  Home({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    final User? user = ModalRoute.of(context)!.settings.arguments as User;
    print(user);

    return Scaffold(
//      backgroundColor: Colors.deepOrange[700],
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/splash_bg.jpg'),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Header(
              title: title!,
              actionIcon: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      margin: EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 25.0, left: 20.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                FloatingActionButton(
                                  elevation: 5,
                                  highlightElevation: 3,
                                  backgroundColor: Colors.deepOrange[700],
                                  mini: true,
                                  child: Icon(Icons.person),
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'profile',
                                        arguments: user);
                                  },
                                ),
                                SizedBox(
                                  width: 12.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '${user?.firstname} ${user?.lastname}',
                                      style: TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      "${user?.email}",
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      "${user?.phone}",
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 40.0,
                            color: Colors.grey[700],
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 18.0, bottom: 18.0),
                              child: FlatButton(
                                color: Colors.deepOrange[700],
                                padding: EdgeInsets.symmetric(
                                    vertical: 14, horizontal: 30),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                child: Text(
                                  'PROFILE',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  print('Move to profile');
                                  Navigator.pushNamed(context, 'profile',
                                      arguments: user);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 320,
                      child: Card(
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        margin: EdgeInsets.all(10.0),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Row(children: [
                            Expanded(
                              // height: double.infinity,
                              child: _activityBtn(
                                () async {
                                  var result = await _shopDialog(context);
                                  if (result == null || result == '') {
                                    print('An ID is required');
                                    return;
                                  } else {
                                    print(result);
                                    OverlayEntry entry = showOverlay(context);
                                    var data = await verifyBranchId(result);
                                    entry.remove();
                                    Navigator.pushNamed(context, 'cart',
                                        arguments: {
                                          "branch": data,
                                        });
                                  }
                                  // Navigator.pushNamed(context, 'shop');
                                },
                                'Shop Products',
                                Icons.store_outlined,
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              // height: double.infinity,
                              child: _activityBtn(
                                () {
                                  OverlayEntry entry = showOverlay(context);
                                  Navigator.pushNamed(context, 'transaction',
                                      arguments: entry);
                                },
                                'Transactions',
                                Icons.list,
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _activityBtn(Function action, String title, IconData icon) {
    return GestureDetector(
      onTap: () {
        print('$title: tapped');
        action();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.deepOrange,
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            icon,
            size: 42,
            color: Colors.white,
          ),
          SizedBox(height: 12),
          Text(
            '$title',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              letterSpacing: .5,
              color: Colors.white,
            ),
          ),
        ]),
      ),
    );
  }

  Future<dynamic> _shopDialog(context) {
    return showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        TextEditingController _textController = TextEditingController();
        return CupertinoAlertDialog(
          title: Text('Shop Code'),
          content: Column(children: [
            Text('Enter a shop code, or Scan'),
            SizedBox(height: 20),
            CupertinoTextField(
              controller: _textController,
            ),
          ]),
          actions: [
            CupertinoDialogAction(
              child: Text('Scan'),
              onPressed: () async {
                print('scan tapped');
                var result = await BarcodeScanner.scan();
                print(result.type);
                print(result.rawContent);
                print(result.format);
                print(result.formatNote);
                Navigator.of(context).pop(result.rawContent.toString());
              },
            ),
            CupertinoDialogAction(
              child: Text('Submit'),
              onPressed: () {
                Navigator.pop(context, _textController.text.toString());
              },
            ),
          ],
        );
      },
    );
  }
}
