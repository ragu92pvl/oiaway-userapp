class NotificationResponse {
  bool? success;
  List<NotificationData>? notificationData;
  int? errorCode;
  String? message;

  NotificationResponse(
      {this.success, this.notificationData, this.errorCode, this.message});

  NotificationResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['notificationData'] != null) {
      notificationData = <NotificationData>[];
      json['notificationData'].forEach((v) {
        notificationData!.add(new NotificationData.fromJson(v));
      });
    }
    errorCode = json['errorCode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.notificationData != null) {
      data['notificationData'] =
          this.notificationData!.map((v) => v.toJson()).toList();
    }
    data['errorCode'] = this.errorCode;
    data['message'] = this.message;
    return data;
  }
}

class NotificationData {
  String? id;
  String? uid;
  String? datetime;
  String? title;
  String? image;
  String? type;

  NotificationData(
      {this.id, this.uid, this.datetime, this.title, this.image, this.type});

  NotificationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    datetime = json['datetime'];
    title = json['title'];
    image = json['image'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['datetime'] = this.datetime;
    data['title'] = this.title;
    data['image'] = this.image;
    data['type'] = this.type;
    return data;
  }
}
