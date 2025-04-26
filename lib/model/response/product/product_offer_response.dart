


class ProductOfferResponse {
  bool? success;
  int? errorCode;
  List<ProductOffersData>? productoffersData;
  String? message;

  ProductOfferResponse(
      {this.success, this.errorCode, this.productoffersData, this.message});

  ProductOfferResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    errorCode = json['errorCode'];
    if (json['productoffersData'] != null) {
      productoffersData = <ProductOffersData>[];
      json['productoffersData'].forEach((v) {
        productoffersData!.add(new ProductOffersData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['errorCode'] = this.errorCode;
    if (this.productoffersData != null) {
      data['productoffersData'] =
          this.productoffersData!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class ProductOffersData {
  String? id;
  String? vendorId;
  String? productId;
  String? price;
  String? offerPrice;
  String? description;

  ProductOffersData(
      {this.id,
        this.vendorId,
        this.productId,
        this.price,
        this.offerPrice,
        this.description});

  ProductOffersData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vendorId = json['vendor_id'];
    productId = json['product_id'];
    price = json['price'];
    offerPrice = json['offer_price'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vendor_id'] = this.vendorId;
    data['product_id'] = this.productId;
    data['price'] = this.price;
    data['offer_price'] = this.offerPrice;
    data['description'] = this.description;
    return data;
  }
}
