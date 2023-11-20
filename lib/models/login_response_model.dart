import "dart:convert";

LoginResponseModel loginResponseJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  LoginResponseModel({
    required this.status,
    required this.token,
    required this.message,
    required this.data,
  });
  late final String status;
  late final String token;
  late final String message;
  late final Data data;

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final loginData = <String, dynamic>{};
    loginData['status'] = status;
    loginData['token'] = token;
    loginData['message'] = message;
    loginData['data'] = data.toJson();
    return loginData;
  }
}

class Data {
  Data({
    required this.user,
  });
  late final User user;

  Data.fromJson(Map<String, dynamic> json) {
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user'] = user.toJson();
    return data;
  }
}

class User {
  User({
    required this.id,
    required this.emailId,
    required this.userName,
    required this.registeredAt,
    required this.updatedAt,
    required this.role,
  });
  late final String id;
  late final String emailId;
  late final String userName;
  late final String registeredAt;
  late final String updatedAt;
  late final String role;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    emailId = json['emailId'];
    userName = json['userName'];
    registeredAt = json['registeredAt'];
    updatedAt = json['updatedAt'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['emailId'] = emailId;
    data['userName'] = userName;
    data['registeredAt'] = registeredAt;
    data['updatedAt'] = updatedAt;
    data['role'] = role;
    return data;
  }
}
