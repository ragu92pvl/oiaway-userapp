import 'package:userapp/model/response/address/address_response.dart';
import 'package:userapp/model/response/product/product_response.dart';

class OrderResponse {
  bool? success;
  int? errorCode;
  List<OverallOrderDetails>? overallorderdetails;
  String? message;

  OrderResponse(
      {this.success, this.errorCode, this.overallorderdetails, this.message});

  OrderResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    errorCode = json['errorCode'];
    if (json['overallorderdetails'] != null) {
      overallorderdetails = <OverallOrderDetails>[];
      json['overallorderdetails'].forEach((v) {
        overallorderdetails!.add(new OverallOrderDetails.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['errorCode'] = this.errorCode;
    data['message'] = this.message;
    return data;
  }
}

class OverallOrderDetails {
  String? id;
  String? uid;
  VendorDetails? vendordetails;
  ProductData? productdetails;
  String? odate;
  AddressData? addressdetails;
  String? oTotal;
  String? subtotal;
  String? discount;
  String? tax;
  String? transId;
  String? oStatus;

  OverallOrderDetails(
      {this.id,
        this.uid,
        this.vendordetails,
        this.productdetails,
        this.odate,
        this.addressdetails,
        this.oTotal,
        this.subtotal,
        this.discount,
        this.tax,
        this.transId,
        this.oStatus});

  OverallOrderDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    vendordetails = json['vendordetails'] != null
        ? new VendorDetails.fromJson(json['vendordetails'])
        : null;
    productdetails = json['productdetails'] != null
        ? new ProductData.fromJson(json['productdetails'])
        : null;
    odate = json['odate'];
    addressdetails = json['addressdetails'] != null
        ? new AddressData.fromJson(json['addressdetails'])
        : null;
    oTotal = json['o_total'];
    subtotal = json['subtotal'];
    discount = json['discount'];
    tax = json['tax'];
    transId = json['trans_id'];
    oStatus = json['o_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    if (this.vendordetails != null) {
      data['vendordetails'] = this.vendordetails!.toJson();
    }
    if (this.productdetails != null) {
      data['productdetails'] = this.productdetails!.toJson();
    }
    data['odate'] = this.odate;
    if (this.addressdetails != null) {
      data['addressdetails'] = this.addressdetails!.toJson();
    }
    data['o_total'] = this.oTotal;
    data['subtotal'] = this.subtotal;
    data['discount'] = this.discount;
    data['tax'] = this.tax;
    data['trans_id'] = this.transId;
    data['o_status'] = this.oStatus;
    return data;
  }
}

class VendorDetails {
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

  VendorDetails(
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

  VendorDetails.fromJson(Map<String, dynamic> json) {
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

