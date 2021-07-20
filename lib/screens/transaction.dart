import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jumpq/models/index.dart';
import 'package:jumpq/models/invoice/customer.dart';
import 'package:jumpq/models/invoice/invoice.dart';
import 'package:jumpq/models/invoice/vendor.dart';
import 'package:jumpq/network/transaction_req.dart';
import 'package:jumpq/services/pdf_api.dart';
import 'package:jumpq/services/pdf_invoice_api.dart';
import 'package:jumpq/widgets/overlay.dart';
import 'package:jumpq/widgets/widgets.dart';
import 'package:path_provider/path_provider.dart';

class TransactionScreen extends StatefulWidget {
  TransactionScreen({Key? key, this.title}) : super(key: key);

  final String? title;

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
    OverlayEntry? entry =
        ModalRoute.of(context)?.settings.arguments as OverlayEntry;
    if (transactions.isNotEmpty) entry.remove();
    return Scaffold(
//      backgroundColor: Colors.deepOrange[700],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Header(
            title: widget.title!,
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
                        onSelected: (_) async {
                          print(_ == "view_trans"
                              ? "View trans screen"
                              : "View Barcode screen");
                          // check which menu item is selected and run logic
                          if (_ == "view_trans") {
                            // check if the receipt with transactionID exists
                            final dir =
                                await getApplicationDocumentsDirectory();
                            final file = File(
                                '${dir.path}/receipt-${item.transactionId}.pdf');
                            bool fileDoesExist = await file.exists();
                            if (fileDoesExist) {
                              return PdfApi.openFile(file);
                            }

                            final invoice = Invoice(
                              info: InvoiceInfo(
                                currency: item.currency,
                                transactionId: item.transactionId,
                                date: item.transactionDate,
                                serviceCharge:
                                    double.parse(item.serviceCharge!),
                              ),
                              supplier: Supplier(
                                branch: item.branch,
                                address: item.address,
                                phone: item.phone,
                                receiptUrl: item.receiptUrl,
                              ),
                              customer: Customer(
                                name: item.buyerName,
                                phone: item.buyerPhone,
                              ),
                              items: item.purchases!
                                  .map(
                                    (i) => InvoiceItem(
                                      description: i["product"],
                                      quantity: int.parse(i["quantity"]),
                                      price: double.parse(i["price"]),
                                    ),
                                  )
                                  .toList(),
                            );
                            final pdfFile =
                                await PdfInvoiceApi.generate(invoice);

                            PdfApi.openFile(pdfFile);
                          }
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
