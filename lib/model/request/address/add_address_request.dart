

class AddAddressRequest {


  String? uid;
  String? address = "";
  String? pincode = "";
  String? houseno= "";
  String? landmark= "";
  String? mobileNumber= "";
  String? type= "";
  String? latMap= "";
  String? longMap= "";


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['address'] = this.address;
    data['pincode'] = this.pincode;
    data['houseno'] = this.houseno;
    data['landmark'] = this.landmark;
    data['mobileNumber'] = this.mobileNumber;
    data['type'] = this.type;
    data['latMap'] = this.latMap;
    data['longMap'] = this.longMap;
    return data;
  }
}
