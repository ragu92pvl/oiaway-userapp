


class ServiceCategoryResponse {
  bool? success;
  int? errorCode;
  List<ServiceData>? serviceData;
  List<BannerData>? bannerData;
  String? message;

  ServiceCategoryResponse(
      {this.success,
        this.errorCode,
        this.serviceData,
        this.bannerData,
        this.message});

  ServiceCategoryResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    errorCode = json['errorCode'];
    if (json['serviceData'] != null) {
      serviceData = <ServiceData>[];
      json['serviceData'].forEach((v) {
        serviceData!.add(new ServiceData.fromJson(v));
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
    if (this.serviceData != null) {
      data['serviceData'] = this.serviceData!.map((v) => v.toJson()).toList();
    }
    if (this.bannerData != null) {
      data['bannerData'] = this.bannerData!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class ServiceData {
  String? id;
  String? serviceSubtitle;
  String? serviceName;
  String? serviceStatus;
  String? serviceImg;
  String? serviceVideo;
  String? cityId;

  ServiceData(
      {this.id,
        this.serviceSubtitle,
        this.serviceName,
        this.serviceStatus,
        this.serviceImg,
        this.serviceVideo,
        this.cityId});

  ServiceData.fromJson(Map<String, dynamic> json) {
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
