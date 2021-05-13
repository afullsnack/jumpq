class CartItem {
  String name;
  // String color;
  String price;
  int qty;
  String imgUrl;

  CartItem({
    this.name,
    // this.color,
    this.price,
    this.qty,
    this.imgUrl,
  });

//  some functions to compute total qty and price will be defined

  CartItem.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    // this.color = json['color'];
    this.price = json['price'];
    this.qty = json['qty'];
    this.imgUrl = json['imgUrl'];
  }

  Map toJson() {
    final data = new Map<String, dynamic>();
    data['name'] = this.name;
    // data['color'] = this.color;
    data['price'] = this.price;
    data['qty'] = this.qty;
    data['imgUrl'] = this.imgUrl;

    return data;
  }
}
