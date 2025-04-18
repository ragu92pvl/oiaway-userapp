

class AmcPackageResponse {
  bool? success;
  int? errorCode;
  List<AmcPackageData>? amcpackageData;
  String? message;

  AmcPackageResponse(
      {this.success, this.errorCode, this.amcpackageData, this.message});

  AmcPackageResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    errorCode = json['errorCode'];
    if (json['amcpackageData'] != null) {
      amcpackageData = <AmcPackageData>[];
      json['amcpackageData'].forEach((v) {
        amcpackageData!.add(new AmcPackageData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['errorCode'] = this.errorCode;
    if (this.amcpackageData != null) {
      data['amcpackageData'] =
          this.amcpackageData!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class AmcPackageData {
  String? id;
  String? name;
  String? price;
  String? durationdays;
  String? packages;
  String? spare;
  String? description;

  AmcPackageData(
      {this.id,
        this.name,
        this.price,
        this.durationdays,
        this.packages,
        this.spare,
        this.description});

  AmcPackageData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    durationdays = json['durationdays'];
    packages = json['packages'];
    spare = json['spare'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['durationdays'] = this.durationdays;
    data['packages'] = this.packages;
    data['spare'] = this.spare;
    data['description'] = this.description;
    return data;
  }
}
