class UserPayloadModel {
  int? userId;
  String? username;
  String? name;
  String? email;
  String? mobile;
  String? mobileCode;
  String? password;
  String? authToken;
  int? status;
  String? createdDate;

  UserPayloadModel(
      {this.userId,
      this.username,
      this.name,
      this.email,
      this.mobile,
      this.mobileCode,
      this.password,
      this.authToken,
      this.status,
      this.createdDate});

  UserPayloadModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    username = json['username'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    mobileCode = json['mobile_code'];
    password = json['password'];
    authToken = json['auth_token'];
    status = json['status'];
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['username'] = username;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['mobile_code'] = mobileCode;
    data['password'] = password;
    data['auth_token'] = authToken;
    data['status'] = status;
    data['created_date'] = createdDate;
    return data;
  }
}
