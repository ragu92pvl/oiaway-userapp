

class ServiceRequest {
  String? uid;
  String? stotal;
  String? packageId;
  String? date;
  String? time;
  String? recordId;
  String? addressId;
  String? model;
  String? brand;
  String? type;


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['stotal'] = this.stotal;
    data['packageId'] = this.packageId;
    data['date'] = this.date;
    data['time'] = this.time;
    data['addressId'] = this.addressId;
    data['model'] = this.model;
    data['brand'] = this.brand;
    data['type'] = this.type;
    data['record_id'] = this.recordId;
    return data;
  }
}
