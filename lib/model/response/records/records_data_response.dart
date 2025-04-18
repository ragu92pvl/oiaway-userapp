class RecordsDataResponse {
  bool? success;
  int? errorCode;
  List<RecordsData>? recordsData;
  String? message;

  RecordsDataResponse(
      {this.success, this.errorCode, this.recordsData, this.message});

  RecordsDataResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    errorCode = json['errorCode'];
    if (json['recordsData'] != null) {
      recordsData = <RecordsData>[];
      json['recordsData'].forEach((v) {
        recordsData!.add(new RecordsData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['errorCode'] = this.errorCode;
    if (this.recordsData != null) {
      data['recordsData'] = this.recordsData!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class RecordsData {
  String? id;
  String? userid;
  String? recordType;
  String? title;
  String? description;
  String? datajson;
  String? image;
  String? amc;
  String? amcProductId;

  RecordsData(
      {this.id,
        this.userid,
        this.recordType,
        this.title,
        this.description,
        this.datajson,this.image,this.amcProductId,this.amc});

  RecordsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userid = json['userid'];
    recordType = json['record_type'];
    title = json['title'];
    description = json['description'];
    datajson = json['datajson'];
    amcProductId = json['amc_product_id'];
    amc = json['amc'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userid'] = this.userid;
    data['record_type'] = this.recordType;
    data['title'] = this.title;
    data['description'] = this.description;
    data['datajson'] = this.datajson;
    data['amc_product_id'] = this.amcProductId;
    data['image'] = this.image;
    return data;
  }
}
