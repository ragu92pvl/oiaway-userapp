class HomeDataResponse {
  bool? success;
  int? errorCode;
  List<BannerData>? bannerData;
  List<CategoryData>? categoryData;
  List<EnquiryData>? enquiryData = null;
  String? message;

  HomeDataResponse(
      {this.success,
        this.errorCode,
        this.bannerData,
        this.categoryData,
        this.enquiryData,
        this.message});

  HomeDataResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    errorCode = json['errorCode'];
    if (json['bannerData'] != null) {
      bannerData = <BannerData>[];
      json['bannerData'].forEach((v) {
        bannerData!.add(new BannerData.fromJson(v));
      });
    }
    if (json['categoryData'] != null) {
      categoryData = <CategoryData>[];
      json['categoryData'].forEach((v) {
        categoryData!.add(new CategoryData.fromJson(v));
      });
    }
    if (json['enquiryData'] != null) {
      enquiryData = <EnquiryData>[];
      json['enquiryData'].forEach((v) {
        enquiryData!.add(new EnquiryData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['errorCode'] = this.errorCode;
    if (this.bannerData != null) {
      data['bannerData'] = this.bannerData!.map((v) => v.toJson()).toList();
    }
    if (this.categoryData != null) {
      data['categoryData'] = this.categoryData!.map((v) => v.toJson()).toList();
    }
    if (this.enquiryData != null) {
      data['enquiryData'] = this.enquiryData!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class BannerData {
  String? id;
  String? bannerName;
  String? img;
  String? cityId;
  String? createdAt;
  String? status;

  BannerData(
      {this.id,
        this.bannerName,
        this.img,
        this.cityId,
        this.createdAt,
        this.status});

  BannerData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bannerName = json['bannerName'];
    img = json['img'];
    cityId = json['cityId'];
    createdAt = json['createdAt'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bannerName'] = this.bannerName;
    data['img'] = this.img;
    data['cityId'] = this.cityId;
    data['createdAt'] = this.createdAt;
    data['status'] = this.status;
    return data;
  }
}

class CategoryData {
  String? id;
  String? catSubtitle;
  String? catName;
  String? catImage;
  String? catStatus;
  String? catVideo;
  Null? cityId;

  CategoryData(
      {this.id,
        this.catSubtitle,
        this.catName,
        this.catImage,
        this.catStatus,
        this.catVideo,
        this.cityId});

  CategoryData.fromJson(Map<String, dynamic> json) {
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

class EnquiryData {
  String? id;
  String? productName;
  String? productImage;
  String? status;

  EnquiryData({this.id, this.productName, this.productImage, this.status});

  EnquiryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    productImage = json['product_image'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_name'] = this.productName;
    data['product_image'] = this.productImage;
    data['status'] = this.status;
    return data;
  }
}
