class AllCategoryResponse {
  bool? success;
  int? errorCode;
  List<ProductCategoryData>? productCategoryData;
  List<ServiceCategoryData>? serviceCategoryData;
  String? message;

  AllCategoryResponse(
      {this.success,
        this.errorCode,
        this.productCategoryData,
        this.serviceCategoryData,
        this.message});

  AllCategoryResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    errorCode = json['errorCode'];
    if (json['productCategoryData'] != null) {
      productCategoryData = <ProductCategoryData>[];
      json['productCategoryData'].forEach((v) {
        productCategoryData!.add(new ProductCategoryData.fromJson(v));
      });
    }
    if (json['serviceCategoryData'] != null) {
      serviceCategoryData = <ServiceCategoryData>[];
      json['serviceCategoryData'].forEach((v) {
        serviceCategoryData!.add(new ServiceCategoryData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['errorCode'] = this.errorCode;
    if (this.productCategoryData != null) {
      data['productCategoryData'] =
          this.productCategoryData!.map((v) => v.toJson()).toList();
    }
    if (this.serviceCategoryData != null) {
      data['serviceCategoryData'] =
          this.serviceCategoryData!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class ProductCategoryData {
  String? id;
  String? catSubtitle;
  String? catName;
  String? catImage;
  String? catStatus;
  String? catVideo;
  String? cityId;

  ProductCategoryData(
      {this.id,
        this.catSubtitle,
        this.catName,
        this.catImage,
        this.catStatus,
        this.catVideo,
        this.cityId});

  ProductCategoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    catSubtitle = json['catSubtitle'];
    catName = json['catName'];
    catImage = json['catImage'];
    catStatus = json['catStatus'];
    catVideo = json['catVideo'];
    cityId = json['cityId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['catSubtitle'] = this.catSubtitle;
    data['catName'] = this.catName;
    data['catImage'] = this.catImage;
    data['catStatus'] = this.catStatus;
    data['catVideo'] = this.catVideo;
    data['cityId'] = this.cityId;
    return data;
  }
}

class ServiceCategoryData {
  String? id;
  String? serviceSubtitle;
  String? serviceName;
  String? serviceStatus;
  String? serviceImg;
  String? serviceVideo;
  String? cityId;

  ServiceCategoryData(
      {this.id,
        this.serviceSubtitle,
        this.serviceName,
        this.serviceStatus,
        this.serviceImg,
        this.serviceVideo,
        this.cityId});

  ServiceCategoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceSubtitle = json['serviceSubtitle'];
    serviceName = json['serviceName'];
    serviceStatus = json['serviceStatus'];
    serviceImg = json['serviceImg'];
    serviceVideo = json['serviceVideo'];
    cityId = json['cityId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['serviceSubtitle'] = this.serviceSubtitle;
    data['serviceName'] = this.serviceName;
    data['serviceStatus'] = this.serviceStatus;
    data['serviceImg'] = this.serviceImg;
    data['serviceVideo'] = this.serviceVideo;
    data['cityId'] = this.cityId;
    return data;
  }
}
