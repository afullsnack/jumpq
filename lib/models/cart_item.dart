class CartItem {
  int id;
  int productId;
  String product;
  int quantity;
  String currency;
  String price;
  String imgUrl;

  CartItem({
    this.id,
    this.productId,
    this.product,
    this.quantity,
    this.currency,
    this.price,
    this.imgUrl,
  });

//  some functions to compute total qty and price will be defined

// {
//         "id": 133,
//         "product_id": 28,
//         "product": "PREPARE FOR WAR",
//         "quantity": "1",
//         "currency": "₦",
//         "price": "201.00",
//         "thumbnail": {
//             "location": "https://myjumpq.net/product_image/thumbnail.jpg"
//         }
//     }

  CartItem.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.productId = json["produc_id"];
    this.product = json["product"];
    this.quantity = json["quantity"];
    this.currency = json["currency"];
    this.price = json["price"];
    this.imgUrl = json["thumbnail"]["location"];
  }

  Map toJson() {
    final data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["product_id"] = this.productId;
    data["product"] = this.product;
    data["quantity"] = this.quantity;
    data["currency"] = this.currency;
    data["price"] = this.price;
    data["thumbnail"]["location"] = this.imgUrl;

    return data;
  }
}
