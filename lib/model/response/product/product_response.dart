class ProductResponse {
  bool? success;
  int? errorCode;
  List<ProductData>? productData;
  String? message;

  ProductResponse(
      {this.success, this.errorCode, this.productData, this.message});

  ProductResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    errorCode = json['errorCode'];
    if (json['productData'] != null) {
      productData = <ProductData>[];
      json['productData'].forEach((v) {
        productData!.add(new ProductData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['errorCode'] = this.errorCode;
    if (this.productData != null) {
      data['productData'] = this.productData!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class ProductData {
  String? id;
  String? cid;
  String? sid;
  String? productName;
  String? productImage;
  String? productDesc;
  String? productSpec;
  List<ProductGallery>? productGallery;
  String? productHighlights;
  String? rating;
  String? createdAt;
  String? status;
  bool? isEnquiry;

  ProductData(
      {this.id,
        this.cid,
        this.sid,
        this.productName,
        this.productImage,
        this.productDesc,
        this.productSpec,
        this.productGallery,
        this.productHighlights,
        this.rating,
        this.createdAt,
        this.status,
      this.isEnquiry});

  ProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cid = json['cid'];
    sid = json['sid'];
    productName = json['product_name'];
    productImage = json['product_image'];
    productDesc = json['product_desc'];
    productSpec = json['product_spec'];
    if (json['product_gallery'] != null) {
      productGallery = <ProductGallery>[];
      json['product_gallery'].forEach((v) {
        productGallery!.add(new ProductGallery.fromJson(v));
      });
    }
    productHighlights = json['product_highlights'];
    rating = json['rating'];
    createdAt = json['created_at'];
    status = json['status'];
    isEnquiry = json['isEnquiry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cid'] = this.cid;
    data['sid'] = this.sid;
    data['product_name'] = this.productName;
    data['product_image'] = this.productImage;
    data['product_desc'] = this.productDesc;
    data['product_spec'] = this.productSpec;
    if (this.productGallery != null) {
      data['product_gallery'] =
          this.productGallery!.map((v) => v.toJson()).toList();
    }
    data['product_highlights'] = this.productHighlights;
    data['rating'] = this.rating;
    data['created_at'] = this.createdAt;
    data['status'] = this.status;
    data['isEnquiry'] = this.isEnquiry;
    return data;
  }
}

class ProductGallery {
  String? productGallaryId;
  String? productId;
  String? fileName;
  String? status;
  String? dom;

  ProductGallery(
      {this.productGallaryId,
        this.productId,
        this.fileName,
        this.status,
        this.dom});

  ProductGallery.fromJson(Map<String, dynamic> json) {
    productGallaryId = json['product_gallary_id'];
    productId = json['product_id'];
    fileName = json['file_name'];
    status = json['status'];
    dom = json['dom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_gallary_id'] = this.productGallaryId;
    data['product_id'] = this.productId;
    data['file_name'] = this.fileName;
    data['status'] = this.status;
    data['dom'] = this.dom;
    return data;
  }
}
