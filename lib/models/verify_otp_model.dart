class VerifyOtpModel {
  VerifyOtpModel({
    required this.otpToken,
    required this.email,
  });
  late final String otpToken;
  late final String email;

  VerifyOtpModel.fromJson(Map<String, dynamic> json) {
    otpToken = json['otpToken'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['otpToken'] = otpToken;
    data['email'] = email;
    return data;
  }
}
