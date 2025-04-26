

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
  String? vendorId;
  String? cid;
  String? productName;
  String? createdAt;
  String? productImage;
  List<VariantDetails>? variantdetails;
  String? status;

  OverallGroceryProducts(
      {this.id,
        this.vendorId,
        this.cid,
        this.productName,
        this.createdAt,
        this.productImage,
        this.variantdetails,
        this.status});

  OverallGroceryProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vendorId = json['vendor_id'];
    cid = json['cid'];
    productName = json['product_name'];
    createdAt = json['created_at'];
    productImage = json['product_image'];
    if (json['variantdetails'] != null) {
      variantdetails = <VariantDetails>[];
      json['variantdetails'].forEach((v) {
        variantdetails!.add(new VariantDetails.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vendor_id'] = this.vendorId;
    data['cid'] = this.cid;
    data['product_name'] = this.productName;
    data['created_at'] = this.createdAt;
    data['product_image'] = this.productImage;
    if (this.variantdetails != null) {
      data['variantdetails'] =
          this.variantdetails!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class VariantDetails {
  String? id;
  String? pid;
  String? variantname;
  String? unit;
  String? unitvalue;
  String? price;
  String? discount;
  String? dom;
  String? status;

  VariantDetails(
      {this.id,
        this.pid,
        this.variantname,
        this.unit,
        this.unitvalue,
        this.price,
        this.discount,
        this.dom,
        this.status});

  VariantDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pid = json['pid'];
    variantname = json['variantname'];
    unit = json['unit'];
    unitvalue = json['unitvalue'];
    price = json['price'];
    discount = json['discount'];
    dom = json['dom'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pid'] = this.pid;
    data['variantname'] = this.variantname;
    data['unit'] = this.unit;
    data['unitvalue'] = this.unitvalue;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['dom'] = this.dom;
    data['status'] = this.status;
    return data;
  }
}
