// ignore_for_file: avoid_print

class RegisterRequestModel {
  RegisterRequestModel({
    required this.userName,
    required this.email,
    required this.password,
  });
  late final String userName;
  late final String email;
  late final String password;

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userName'] = userName;
    data['email'] = email;
    data['password'] = password;
    print(data);
    return data;
  }
}
