class ProductModel {
  int id;
  int storeBranchId;
  dynamic categoryId;
  String productType;
  String name;
  String description;
  String costPrice;
  String unitPrice;
  int quantity;
  dynamic reorderLevel;
  String createdAt;
  String updatedAt;
  dynamic uniqueId;
  String categoryName;
  dynamic category;

  ProductModel.fromJson(Map<String, dynamic> json)
      : this.id = json["id"],
        this.storeBranchId = json["store_branch_id"],
        this.categoryId = json["category_id"],
        this.productType = json["product_type"],
        this.name = json["name"],
        this.description = json["description"],
        this.costPrice = json["cost_price"],
        this.unitPrice = json["unit_price"],
        this.quantity = json["quantity"],
        this.reorderLevel = json["reorder_level"],
        this.createdAt = json["created_at"],
        this.updatedAt = json["updated_at"],
        this.uniqueId = json["uniqueId"],
        this.categoryName = json["category_name"],
        this.category = json["category"];

  Map toJson() {
    final data = new Map<String, dynamic>();

    data["id"] = this.id;
    data["store_branch_id"] = this.storeBranchId;
    data["category_id"] = this.categoryId;
    data["product_type"] = this.productType;
    data["name"] = this.name;
    data["description"] = this.description;
    data["cost_price"] = this.costPrice;
    data["unit_price"] = this.unitPrice;
    data["quantity"] = this.quantity;
    data["reorder_level"] = this.reorderLevel;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    data["uniqueId"] = this.uniqueId;
    data["category_name"] = this.categoryName;
    data["category"] = this.category;

    return data;
  }
}
