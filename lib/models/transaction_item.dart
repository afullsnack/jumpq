class TransactionItem {
  String productCode;
  String storeId;
  String status;
  String name;
  String color;
  String price;

  TransactionItem({
    this.productCode,
    this.storeId,
    this.status,
    this.name,
    this.color,
    this.price,
  });

  TransactionItem.fromJson(Map<String, dynamic> json) {
    this.productCode = json['productCode'];
    this.storeId = json['storeId'];
    this.status = json['status'];
    this.name = json['name'];
    this.color = json['color'];
    this.price = json['price'];
  }

  Map toJson() {
    final data = new Map<String, dynamic>();
    data['productCode'] = this.productCode;
    data['storeId'] = this.storeId;
    data['status'] = this.status;
    data['name'] = this.name;
    data['color'] = this.color;
    data['price'] = this.price;
    return data;
  }
}
