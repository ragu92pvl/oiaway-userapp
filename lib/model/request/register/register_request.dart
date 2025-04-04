


class RegisterRequest{


  late String name = "";
  late String mobile = "";
  late String email = "";
  late String password= "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['mobile'] = mobile;
    map['email'] = email;
    map['password'] = password;
    return map;
  }
}