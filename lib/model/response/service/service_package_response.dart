class ServicePackageResponse {
  bool? success;
  int? errorCode;
  List<PackageData>? packageData;
  String? message;

  ServicePackageResponse(
      {this.success, this.errorCode, this.packageData, this.message});

  ServicePackageResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    errorCode = json['errorCode'];
    if (json['packageData'] != null) {
      packageData = <PackageData>[];
      json['packageData'].forEach((v) {
        packageData!.add(new PackageData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['errorCode'] = this.errorCode;
    if (this.packageData != null) {
      data['packageData'] = this.packageData!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class PackageData {
  String? servicePackageId;
  String? serviceCategoryId;
  String? title;
  String? description;
  String? image;
  String? rating;
  String? specification;
  String? packagePrice;
  String? cityId;
  List<Gallery>? gallery;
  SubPackages? subPackages;
  String? status;

  PackageData(
      {this.servicePackageId,
        this.serviceCategoryId,
        this.title,
        this.description,
        this.image,
        this.rating,
        this.specification,
        this.packagePrice,
        this.cityId,
        this.gallery,
        this.subPackages,
        this.status});

  PackageData.fromJson(Map<String, dynamic> json) {
    servicePackageId = json['servicePackageId'];
    serviceCategoryId = json['serviceCategoryId'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    rating = json['rating'];
    specification = json['specification'];
    packagePrice = json['packagePrice'];
    cityId = json['cityId'];
    if (json['gallery'] != null) {
      gallery = <Gallery>[];
      json['gallery'].forEach((v) {
        gallery!.add(new Gallery.fromJson(v));
      });
    }
    subPackages = json['subPackages'] != null
        ? new SubPackages.fromJson(json['subPackages'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['servicePackageId'] = this.servicePackageId;
    data['serviceCategoryId'] = this.serviceCategoryId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['rating'] = this.rating;
    data['specification'] = this.specification;
    data['packagePrice'] = this.packagePrice;
    data['cityId'] = this.cityId;
    if (this.gallery != null) {
      data['gallery'] = this.gallery!.map((v) => v.toJson()).toList();
    }
    if (this.subPackages != null) {
      data['subPackages'] = this.subPackages!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Gallery {
  String? packageGallaryId;
  String? packageId;
  String? fileName;
  String? status;
  String? dom;

  Gallery(
      {this.packageGallaryId,
        this.packageId,
        this.fileName,
        this.status,
        this.dom});

  Gallery.fromJson(Map<String, dynamic> json) {
    packageGallaryId = json['package_gallary_id'];
    packageId = json['package_id'];
    fileName = json['file_name'];
    status = json['status'];
    dom = json['dom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['package_gallary_id'] = this.packageGallaryId;
    data['package_id'] = this.packageId;
    data['file_name'] = this.fileName;
    data['status'] = this.status;
    data['dom'] = this.dom;
    return data;
  }
}

class SubPackages {
  String? id;
  String? packageId;
  String? serviceName;
  String? servicePrice;
  String? serviceOffer;
  String? serviceImage;
  String? createdAt;
  String? status;

  SubPackages(
      {this.id,
        this.packageId,
        this.serviceName,
        this.servicePrice,
        this.serviceOffer,
        this.serviceImage,
        this.createdAt,
        this.status});

  SubPackages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    packageId = json['package_id'];
    serviceName = json['service_name'];
    servicePrice = json['service_price'];
    serviceOffer = json['service_offer'];
    serviceImage = json['service_image'];
    createdAt = json['created_at'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['package_id'] = this.packageId;
    data['service_name'] = this.serviceName;
    data['service_price'] = this.servicePrice;
    data['service_offer'] = this.serviceOffer;
    data['service_image'] = this.serviceImage;
    data['created_at'] = this.createdAt;
    data['status'] = this.status;
    return data;
  }
}
