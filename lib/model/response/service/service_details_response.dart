class ServiceDetailsResponse {
  bool? success;
  int? errorCode;
  List<AddressData>? addressData;
  String? message;

  ServiceDetailsResponse(
      {this.success, this.errorCode, this.addressData, this.message});

  ServiceDetailsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    errorCode = json['errorCode'];
    if (json['addressData'] != null) {
      addressData = <AddressData>[];
      json['addressData'].forEach((v) {
        addressData!.add(new AddressData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['errorCode'] = this.errorCode;
    if (this.addressData != null) {
      data['addressData'] = this.addressData!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class AddressData {
  String? serviceId;
  String? serviceStatus;
  String? sign;
  String? jobdate;
  String? jobTime;
  String? stotal;
  String? ototal;
  String? image;
  String? providerName;
  String? providerMobile;
  String? paymentStatus;
  String? titile;
  String? packageprice;
  String? address;
  String? mobileNumber;
  List<ServicePhotos>? servicePhotos;
  List<Addon>? addon;

  AddressData(
      {this.serviceId,
        this.serviceStatus,
        this.sign,
        this.jobdate,
        this.jobTime,
        this.stotal,
        this.ototal,
        this.image,
        this.providerName,
        this.providerMobile,
        this.paymentStatus,
        this.titile,
        this.packageprice,
        this.address,
        this.mobileNumber,
        this.servicePhotos,
      this.addon});

  AddressData.fromJson(Map<String, dynamic> json) {
    serviceId = json['service_id'];
    serviceStatus = json['service_status'];
    sign = json['sign'];
    jobdate = json['jobdate'];
    jobTime = json['job_time'];
    stotal = json['stotal'];
    ototal = json['ototal'];
    image = json['image'];
    providerName = json['provider_name'];
    providerMobile = json['provider_mobile'];
    paymentStatus = json['payment_status'];
    titile = json['titile'];
    packageprice = json['packageprice'];
    address = json['address'];
    mobileNumber = json['mobile_number'];
    if (json['service_photos'] != null) {
      servicePhotos = <ServicePhotos>[];
      json['service_photos'].forEach((v) {
        servicePhotos!.add(new ServicePhotos.fromJson(v));
      });
    }
    if (json['addon'] != null) {
      addon = <Addon>[];
      json['addon'].forEach((v) {
        addon!.add(new Addon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_id'] = this.serviceId;
    data['service_status'] = this.serviceStatus;
    data['sign'] = this.sign;
    data['jobdate'] = this.jobdate;
    data['job_time'] = this.jobTime;
    data['stotal'] = this.stotal;
    data['ototal'] = this.ototal;
    data['image'] = this.image;
    data['provider_name'] = this.providerName;
    data['provider_mobile'] = this.providerMobile;
    data['payment_status'] = this.paymentStatus;
    data['titile'] = this.titile;
    data['packageprice'] = this.packageprice;
    data['address'] = this.address;
    data['mobile_number'] = this.mobileNumber;
    if (this.servicePhotos != null) {
      data['service_photos'] =
          this.servicePhotos!.map((v) => v.toJson()).toList();
    }
    if (this.addon != null) {
      data['addon'] = this.addon!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ServicePhotos {
  String? id;
  String? sid;
  String? photo;
  String? createdAt;
  String? status;

  ServicePhotos({this.id, this.sid, this.photo, this.createdAt, this.status});

  ServicePhotos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sid = json['sid'];
    photo = json['photo'];
    createdAt = json['created_at'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sid'] = this.sid;
    data['photo'] = this.photo;
    data['created_at'] = this.createdAt;
    data['status'] = this.status;
    return data;
  }
}

class Addon {
  String? price;
  String? scharge;
  String? sprice;
  String? spname;

  Addon({this.price, this.scharge, this.sprice});

  Addon.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    scharge = json['scharge'];
    sprice = json['sprice'];
    spname = json['spname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['scharge'] = this.scharge;
    data['sprice'] = this.sprice;
    data['spname'] = this.spname;
    return data;
  }
}
