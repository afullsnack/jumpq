import 'dart:io';
// import 'package:flutter/material.dart';
import 'package:jumpq/models/invoice/invoice.dart';
import 'package:jumpq/models/invoice/customer.dart';
// import 'package:jumpq/models/invoice/vendor.dart';
import 'package:jumpq/services/pdf_api.dart';
import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

class PdfInvoiceApi {
  static Future<File> generate(Invoice? invoice) async {
    final pdf = Document();

    pdf.addPage(MultiPage(
      build: (context) => [
        buildHeader(invoice!),
        SizedBox(height: 3 * PdfPageFormat.cm),
        buildInvoice(invoice),
        Divider(),
        buildTotal(invoice),
      ],
    ));

    return PdfApi.saveDocument(
        name: 'receipt-${invoice?.info?.transactionId}.pdf', pdf: pdf);
  }

// Build vendor info
  static Widget buildHeader(Invoice? invoice) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 1 * PdfPageFormat.cm),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Branch: ${invoice!.supplier?.branch}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: 1 * PdfPageFormat.mm),
              Text(invoice.supplier!.address!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: 1 * PdfPageFormat.mm),
              Text(invoice.supplier!.phone!,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 1 * PdfPageFormat.mm),
              Text(invoice.supplier!.receiptUrl!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: 1 * PdfPageFormat.mm),
            ],
          ),
          SizedBox(height: 1 * PdfPageFormat.cm),
          Text('Transaction Reference',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: PdfColor.fromHex('#000'))),
          SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildCustomer(invoice.customer!),
              buildInvoiceInfo(invoice.info!),
            ],
          ),
        ],
      );

  static Widget buildCustomer(Customer customer) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Customer Name: ${customer.name}',
              style: TextStyle(fontWeight: FontWeight.normal)),
          Text('Phone Number: ${customer.phone}',
              style: TextStyle(fontWeight: FontWeight.normal)),
        ],
      );

  static Widget buildInvoiceInfo(InvoiceInfo info) => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('Transaction Id: ${info.transactionId}',
              style: TextStyle(fontWeight: FontWeight.normal)),
          Text('Date: ${info.date}',
              style: TextStyle(fontWeight: FontWeight.normal)),
        ],
      );

  static Widget buildInvoice(Invoice invoice) {
    final headers = ['S/N', 'Item Description', 'Qty', 'Price', 'Total'];
    final data = invoice.items!.map((item) {
      final total = item.price! * item.quantity!;

      return [
        (invoice.items!.indexOf(item) + 1),
        item.description,
        '${item.quantity}',
        '${item.price}',
        '\$ ${total.toStringAsFixed(1)}',
      ];
    }).toList();

    return Table.fromTextArray(
      headers: headers,
      data: data,
      border: null,
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: BoxDecoration(
        color: PdfColors.grey300,
        border: TableBorder(
          left: BorderSide(width: 1),
          right: BorderSide(width: 1),
          top: BorderSide(width: 1),
          bottom: BorderSide(width: 1),
          verticalInside: BorderSide(width: 1),
        ),
      ),
      cellHeight: 30,
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.center,
        2: Alignment.center,
        3: Alignment.center,
        4: Alignment.center,
      },
    );
  }

  // Build item subtotal
  static Widget buildTotal(Invoice invoice) {
    final subTotal = invoice.items!
        .map((item) => item.price! * item.quantity!)
        .reduce((item1, item2) => item1 + item2);
    final serviceCharge = invoice.info?.serviceCharge;
    final total = subTotal + serviceCharge!;
    // final currency = invoice.info.currency;

    return Container(
      alignment: Alignment.centerRight,
      child: Row(
        children: [
          Spacer(flex: 6),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                buildText(
                  title: 'Sub total',
                  value: 'N ${subTotal.toStringAsFixed(1)}',
                  unite: true,
                ),
                buildText(
                  title: 'Service Charge',
                  value: 'N ${serviceCharge.toStringAsFixed(1)}',
                  unite: true,
                ),
                Divider(),
                buildText(
                  title: 'Total',
                  titleStyle: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  value: 'N ${total.toStringAsFixed(1)}',
                  unite: true,
                  bgColor: PdfColor.fromHex('#f29315'),
                ),
                SizedBox(height: 2 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
                SizedBox(height: 0.5 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static buildText({
    String? title,
    String? value,
    double width = double.infinity,
    TextStyle? titleStyle,
    bool? unite = false,
    PdfColor? bgColor,
  }) {
    final style = titleStyle ?? TextStyle(fontWeight: FontWeight.bold);

    return Container(
      width: width,
      child: Row(
        children: [
          Expanded(child: Text(title!, style: style)),
          Text(value!, style: unite! ? style : null),
        ],
      ),
    );
  }
}
