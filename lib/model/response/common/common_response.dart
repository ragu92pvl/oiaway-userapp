

class CommonResponse {
  bool? success;
  int? errorCode;
  String? message;

  CommonResponse({this.success, this.errorCode, this.message});

  CommonResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    errorCode = json['errorCode'];
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
