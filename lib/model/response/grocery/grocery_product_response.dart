class GroceryProductResponse {
  bool? success;
  int? errorCode;
  List<OverallGroceryProducts>? overallgroceryproducts;
  String? message;

  GroceryProductResponse(
      {this.success,
        this.errorCode,
        this.overallgroceryproducts,
        this.message});

  GroceryProductResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    errorCode = json['errorCode'];
    if (json['overallgroceryproducts'] != null) {
      overallgroceryproducts = <OverallGroceryProducts>[];
      json['overallgroceryproducts'].forEach((v) {
        overallgroceryproducts!.add(new OverallGroceryProducts.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['errorCode'] = this.errorCode;
    if (this.overallgroceryproducts != null) {
      data['overallgroceryproducts'] =
          this.overallgroceryproducts!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class OverallGroceryProducts {
  String? id;
  String? name;
  String? vendorId;
  String? cid;
  String? productId;
  String? createdAt;
  int count =0;
  String? productImage;

  OverallGroceryProducts(
      {this.id,
        this.name,
        this.vendorId,
        this.cid,
        this.productId,
        this.createdAt,
        this.productImage});

  OverallGroceryProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    vendorId = json['vendor_id'];
    cid = json['cid'];
    productId = json['product_id'];
    createdAt = json['created_at'];
    productImage = json['product_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['vendor_id'] = this.vendorId;
    data['cid'] = this.cid;
    data['product_id'] = this.productId;
    data['created_at'] = this.createdAt;
    data['product_image'] = this.productImage;
    return data;
  }
}
