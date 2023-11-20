import 'dart:convert';

ResponseModel responseJson(String str) =>
    ResponseModel.fromJson(json.decode(str));

class ResponseModel {
  ResponseModel({
    required this.status,
    required this.message,
  });
  late final String status;
  late final String message;

  ResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class ErrorResponse {
  final String message;

  ErrorResponse(this.message);

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(json['message']);
  }
}
