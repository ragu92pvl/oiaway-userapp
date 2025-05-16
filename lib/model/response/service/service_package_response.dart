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
  String? id;
  String? servicePackageId;
  String? serviceCategoryId;
  String? title;
  String? description;
  String? image;
  String? rating;
  String? specification;
  String? packagePrice;
  String? cityId;
  Null? gallery;
  Vendordetails? vendordetails;
  String? status;

  PackageData(
      {this.id,
        this.servicePackageId,
        this.serviceCategoryId,
        this.title,
        this.description,
        this.image,
        this.rating,
        this.specification,
        this.packagePrice,
        this.cityId,
        this.gallery,
        this.vendordetails,
        this.status});

  PackageData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    servicePackageId = json['servicePackageId'];
    serviceCategoryId = json['serviceCategoryId'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    rating = json['rating'];
    specification = json['specification'];
    packagePrice = json['packagePrice'];
    cityId = json['cityId'];
    gallery = json['gallery'];
    vendordetails = json['vendordetails'] != null
        ? new Vendordetails.fromJson(json['vendordetails'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['servicePackageId'] = this.servicePackageId;
    data['serviceCategoryId'] = this.serviceCategoryId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['rating'] = this.rating;
    data['specification'] = this.specification;
    data['packagePrice'] = this.packagePrice;
    data['cityId'] = this.cityId;
    data['gallery'] = this.gallery;
    if (this.vendordetails != null) {
      data['vendordetails'] = this.vendordetails!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Vendordetails {
  String? id;
  String? shopname;
  String? username;
  String? mobile;
  String? password;
  String? image;
  String? shoptype;
  String? city;
  String? address;
  String? deviceToken;
  String? livestatus;
  String? status;
  String? email;
  String? createAt;
  String? updateAt;
  String? isactive;

  Vendordetails(
      {this.id,
        this.shopname,
        this.username,
        this.mobile,
        this.password,
        this.image,
        this.shoptype,
        this.city,
        this.address,
        this.deviceToken,
        this.livestatus,
        this.status,
        this.email,
        this.createAt,
        this.updateAt,
        this.isactive});

  Vendordetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopname = json['shopname'];
    username = json['username'];
    mobile = json['mobile'];
    password = json['password'];
    image = json['image'];
    shoptype = json['shoptype'];
    city = json['city'];
    address = json['address'];
    deviceToken = json['deviceToken'];
    livestatus = json['livestatus'];
    status = json['status'];
    email = json['email'];
    createAt = json['create_at'];
    updateAt = json['update_at'];
    isactive = json['isactive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['shopname'] = this.shopname;
    data['username'] = this.username;
    data['mobile'] = this.mobile;
    data['password'] = this.password;
    data['image'] = this.image;
    data['shoptype'] = this.shoptype;
    data['city'] = this.city;
    data['address'] = this.address;
    data['deviceToken'] = this.deviceToken;
    data['livestatus'] = this.livestatus;
    data['status'] = this.status;
    data['email'] = this.email;
    data['create_at'] = this.createAt;
    data['update_at'] = this.updateAt;
    data['isactive'] = this.isactive;
    return data;
  }
}
