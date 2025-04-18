

class AddressResponse {
  bool? success;
  int? errorCode;
  List<AddressData>? addressData;
  String? message;

  AddressResponse(
      {this.success, this.errorCode, this.addressData, this.message});

  AddressResponse.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? uid;
  String? address;
  String? pincode;
  String? houseno;
  String? landmark;
  String? type;
  String? latMap;
  String? longMap;

  AddressData(
      {this.id,
        this.uid,
        this.address,
        this.pincode,
        this.houseno,
        this.landmark,
        this.type,
        this.latMap,
        this.longMap});

  AddressData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    address = json['address'];
    pincode = json['pincode'];
    houseno = json['houseno'];
    landmark = json['landmark'];
    type = json['type'];
    latMap = json['lat_map'];
    longMap = json['long_map'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['address'] = this.address;
    data['pincode'] = this.pincode;
    data['houseno'] = this.houseno;
    data['landmark'] = this.landmark;
    data['type'] = this.type;
    data['lat_map'] = this.latMap;
    data['long_map'] = this.longMap;
    return data;
  }
}
