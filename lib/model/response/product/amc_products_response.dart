


class AmcProductsResponse {
  bool? success;
  int? errorCode;
  List<AmcProductData>? amcproductData;
  String? message;

  AmcProductsResponse(
      {this.success, this.errorCode, this.amcproductData, this.message});

  AmcProductsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    errorCode = json['errorCode'];
    if (json['amcproductData'] != null) {
      amcproductData = <AmcProductData>[];
      json['amcproductData'].forEach((v) {
        amcproductData!.add(new AmcProductData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['errorCode'] = this.errorCode;
    if (this.amcproductData != null) {
      data['amcproductData'] =
          this.amcproductData!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class AmcProductData {
  String? id;
  String? productName;
  String? productModel;
  String? productBrand;
  String? year;

  AmcProductData(
      {this.id,
        this.productName,
        this.productModel,
        this.productBrand,
        this.year});

  AmcProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    productModel = json['product_model'];
    productBrand = json['product_brand'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_name'] = this.productName;
    data['product_model'] = this.productModel;
    data['product_brand'] = this.productBrand;
    data['year'] = this.year;
    return data;
  }
}
