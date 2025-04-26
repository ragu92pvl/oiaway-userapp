


class MyServiceResponse {
  bool? success;
  int? errorCode;
  List<MyServiceData>? data;
  String? message;

  MyServiceResponse({this.success, this.errorCode, this.data, this.message});

  MyServiceResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    errorCode = json['error_code'];
    if (json['data'] != null) {
      data = <MyServiceData>[];
      json['data'].forEach((v) {
        data!.add(new MyServiceData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['error_code'] = this.errorCode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class MyServiceData {
  String? id;
  String? title;
  String? image;
  String? specification;
  String? price;
  String? serviceStatus;
  String? jobdate;
  String? createdAt;

  MyServiceData(
      {this.id,
        this.title,
        this.image,
        this.specification,
        this.price,
        this.serviceStatus,
        this.jobdate,
        this.createdAt});

  MyServiceData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    specification = json['specification'];
    price = json['price'];
    serviceStatus = json['service_status'];
    jobdate = json['jobdate'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['specification'] = this.specification;
    data['price'] = this.price;
    data['service_status'] = this.serviceStatus;
    data['jobdate'] = this.jobdate;
    data['created_at'] = this.createdAt;
    return data;
  }
}
