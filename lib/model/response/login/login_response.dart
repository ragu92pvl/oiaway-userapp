

class LoginResponse {
  bool? success;
  int? errorCode;
  UserData? data;
  String? message;

  LoginResponse({this.success, this.errorCode, this.data, this.message});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    errorCode = json['error_code'];
    data = json['data'] != null ? new UserData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['error_code'] = this.errorCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class UserData {
  String? id;
  String? name = "";
  String? email;
  String? mobile;
  String? createdAt;
  String? status;

  UserData(
      {this.id,
        this.name,
        this.email,
        this.mobile,
        this.createdAt,
        this.status});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    createdAt = json['created_at'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['created_at'] = this.createdAt;
    data['status'] = this.status;
    return data;
  }
}
