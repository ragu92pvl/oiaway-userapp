


class GroceryVendorProductResponse {
  bool? success;
  List<Vendors>? vendors;
  int? errorCode;
  String? message;

  GroceryVendorProductResponse(
      {this.success, this.vendors, this.errorCode, this.message});

  GroceryVendorProductResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['vendors'] != null) {
      vendors = <Vendors>[];
      json['vendors'].forEach((v) {
        vendors!.add(new Vendors.fromJson(v));
      });
    }
    errorCode = json['errorCode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.vendors != null) {
      data['vendors'] = this.vendors!.map((v) => v.toJson()).toList();
    }
    data['errorCode'] = this.errorCode;
    data['message'] = this.message;
    return data;
  }
}

class Vendors {
  String? vendorId;
  double total = 0.0;
  List<Products>? products;

  Vendors({this.vendorId, this.products});

  Vendors.fromJson(Map<String, dynamic> json) {
    vendorId = json['vendor_id'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vendor_id'] = this.vendorId;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? id;
  String? pid;
  String? variantname;
  String? unit;
  int count =0;
  String? unitvalue;
  String? price;
  String? discount;

  Products(
      {this.id,
        this.pid,
        this.variantname,
        this.unit,
        this.unitvalue,
        this.price,
        this.discount});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pid = json['pid'];
    variantname = json['variantname'];
    unit = json['unit'];
    unitvalue = json['unitvalue'];
    price = json['price'];
    discount = json['discount'];
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
    return data;
  }
}
