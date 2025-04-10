

class SubCategoryResponse {
  bool? success;
  int? errorCode;
  List<SubCategoryData>? subCategoryData;
  String? message;

  SubCategoryResponse(
      {this.success, this.errorCode, this.subCategoryData, this.message});

  SubCategoryResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    errorCode = json['errorCode'];
    if (json['subCategoryData'] != null) {
      subCategoryData = <SubCategoryData>[];
      json['subCategoryData'].forEach((v) {
        subCategoryData!.add(new SubCategoryData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['errorCode'] = this.errorCode;
    if (this.subCategoryData != null) {
      data['subCategoryData'] =
          this.subCategoryData!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class SubCategoryData {
  String? id;
  String? cid;
  String? title;
  String? image;
  String? status;

  SubCategoryData({this.id, this.cid, this.title, this.image, this.status});

  SubCategoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cid = json['cid'];
    title = json['title'];
    image = json['image'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cid'] = this.cid;
    data['title'] = this.title;
    data['image'] = this.image;
    data['status'] = this.status;
    return data;
  }
}
