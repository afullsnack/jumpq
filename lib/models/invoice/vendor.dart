import 'package:flutter/material.dart';

class Supplier {
  final String branch;
  final String address;
  final String phone;
  final String receiptUrl;

  const Supplier({
    @required this.branch,
    @required this.address,
    @required this.phone,
    @required this.receiptUrl,
  });
}
