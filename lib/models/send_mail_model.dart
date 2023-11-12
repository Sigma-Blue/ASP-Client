class SendMailModel {
  SendMailModel({
    required this.email,
  });
  late final String email;

  SendMailModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['email'] = email;
    return data;
  }
}
