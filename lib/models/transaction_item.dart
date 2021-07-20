// {
//         "id": 5,
//         "transaction_id": "GYAXK4JH",
//         "buyer_name": "Nnamdi Enekwa",
//         "buyer_phone": "09095213761",
//         "staff": "Paid through the App",
//         "transaction_date": "2020-08-30 @ 04:25:16",
//         "status": "0",
//         "currency": "₦",
//         "purchases": [
//             {
//                 "product": "Infinix Zero",
//                 "price": "50.00",
//                 "quantity": "1",
//                 "barcode": [
//                     "X002C4UXJB"
//                 ],
//                 "rfids": []
//             },
//             {
//                 "product": "Tecno Camon Pro",
//                 "price": "30.00",
//                 "quantity": "1",
//                 "barcode": [
//                     "AW-1045"
//                 ],
//                 "rfids": []
//             }
//         ],
//         "service_charge": "0.88",
//         "sub_total": "80.00",
//         "payment": "pos",
//         "total": "80.88",
//         "receipt_url": "https://myjumpq.net/staff/receipt/GYAXK4JH",
//         "branch": "Infinix Phone Company",
//         "address": "12c Edison Graham Street, Laos, Estonia.",
//         "phone": "08113488643"
//     }

class Transaction {
  int? id;
  String? transactionId;
  String? buyerName;
  String? buyerPhone;
  String? staff;
  String? transactionDate;
  String? status;
  String? currency;
  List<dynamic>? purchases;
  String? serviceCharge;
  String? subTotal;
  String? payment;
  String? total;
  String? receiptUrl;
  String? branch;
  String? address;
  String? phone;

  Transaction({
    this.id,
    this.transactionId,
    this.buyerName,
    this.buyerPhone,
    this.staff,
    this.transactionDate,
    this.status,
    this.currency,
    this.purchases,
    this.serviceCharge,
    this.subTotal,
    this.payment,
    this.total,
    this.receiptUrl,
    this.branch,
    this.address,
    this.phone,
  });

  Transaction.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.transactionId = json['transaction_id'];
    this.buyerName = json['buyer_name'];
    this.buyerPhone = json['buyer_phone'];
    this.staff = json['staff'];
    this.transactionDate = json['transaction_date'];
    this.status = json['status'];
    this.currency = json['currency'];
    this.purchases = json['purchases'];
    this.serviceCharge = json['service_charge'];
    this.subTotal = json['sub_total'];
    this.payment = json['payment'];
    this.total = json['payment'];
    this.receiptUrl = json['receipt_url'];
    this.branch = json['branch'];
    this.address = json['address'];
    this.phone = json['phone'];
  }

  Map toJson() {
    final data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}
