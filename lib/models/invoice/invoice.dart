import 'package:flutter/material.dart';
import 'package:jumpq/models/invoice/customer.dart';
import 'package:jumpq/models/invoice/vendor.dart';

class Invoice {
  final InvoiceInfo info;
  final Supplier supplier;
  final Customer customer;
  final List<InvoiceItem> items;

  const Invoice({
    @required this.info,
    @required this.supplier,
    @required this.customer,
    @required this.items,
  });
}

class InvoiceInfo {
  final String transactionId;
  final String date;
  final String currency;
  final double serviceCharge;

  const InvoiceInfo({
    @required this.transactionId,
    @required this.date,
    @required this.currency,
    @required this.serviceCharge,
  });
}

class InvoiceItem {
  final String description;
  final int quantity;
  final double price;

  const InvoiceItem({
    @required this.description,
    @required this.quantity,
    @required this.price,
  });
}
