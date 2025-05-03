

class CartModel {
  String? productId;
  String? productName;
  String? unit;
  String? unitValue;
  String? price;
  String? discount;

  CartModel(
      {this.productId,
        this.productName,
        this.unit,
        this.unitValue,
        this.price,
        this.discount});

  CartModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    unit = json['unit'];
    unitValue = json['unit_value'];
    price = json['price'];
    discount = json['discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['unit'] = this.unit;
    data['unit_value'] = this.unitValue;
    data['price'] = this.price;
    data['discount'] = this.discount;
    return data;
  }
}
