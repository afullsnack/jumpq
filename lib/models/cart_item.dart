class CartItem {
  String name;
  String color;
  String price;
  int qty;

  CartItem({
    this.name,
    this.color,
    this.price,
    this.qty,
  });

//  some functions to compute total qty and price will be defined

  CartItem.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.color = json['color'];
    this.price = json['price'];
    this.qty = json['qty'];
  }

  Map toJson() {
    final data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['color'] = this.color;
    data['price'] = this.price;
    data['qty'] = this.qty;

    return data;
  }
}
