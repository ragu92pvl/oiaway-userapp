class LoginRequest {

  late String mobile;
  late String password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mobile'] = mobile;
    map['password'] = password;

    return map;
  }

}