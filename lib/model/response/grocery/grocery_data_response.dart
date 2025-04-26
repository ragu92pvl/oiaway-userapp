class GroceryDataResponse {
  bool? success;
  int? errorCode;
  List<GroceryData>? groceryData;
  List<BannerData>? bannerData;
  String? message;

  GroceryDataResponse(
      {this.success,
        this.errorCode,
        this.groceryData,
        this.bannerData,
        this.message});

  GroceryDataResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    errorCode = json['errorCode'];
    if (json['groceryData'] != null) {
      groceryData = <GroceryData>[];
      json['groceryData'].forEach((v) {
        groceryData!.add(new GroceryData.fromJson(v));
      });
    }
    if (json['bannerData'] != null) {
      bannerData = <BannerData>[];
      json['bannerData'].forEach((v) {
        bannerData!.add(new BannerData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['errorCode'] = this.errorCode;
    if (this.groceryData != null) {
      data['groceryData'] = this.groceryData!.map((v) => v.toJson()).toList();
    }
    if (this.bannerData != null) {
      data['bannerData'] = this.bannerData!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class GroceryData {
  String? id;
  String? groceryName;
  String? groceryStatus;
  String? groceryImg;
  String? cityId;

  GroceryData(
      {this.id,
        this.groceryName,
        this.groceryStatus,
        this.groceryImg,
        this.cityId});

  GroceryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groceryName = json['groceryName'];
    groceryStatus = json['groceryStatus'];
    groceryImg = json['groceryImg'];
    cityId = json['cityId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['groceryName'] = this.groceryName;
    data['groceryStatus'] = this.groceryStatus;
    data['groceryImg'] = this.groceryImg;
    data['cityId'] = this.cityId;
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
