// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:ap/config.dart';
import 'package:ap/models/login_request_model.dart';
import 'package:ap/models/login_response_model.dart';
import 'package:ap/models/register_request_model.dart';
import 'package:ap/models/reset_password.dart';
import 'package:ap/models/response_model.dart';
import 'package:ap/models/send_mail_model.dart';
import 'package:ap/models/verify_otp_model.dart';
import 'package:ap/services/shared_service.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static var client = http.Client();

  // REGISTER USER API SERVICE

  static Future<ResponseModel> register(RegisterRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiUrl, Config.registerApi);

    try {
      var response = await client.post(
        url,
        headers: requestHeaders,
        body: jsonEncode(model.toJson()),
      );

      return responseJson(response.body);
    } catch (error) {
      throw Exception('Error while trying to register $error');
    }
  }

  // LOGIN USER API SERVICE

  static Future<LoginResponseModel?> login(LoginRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiUrl, Config.loginApi);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        await SharedService.setLoginDetails(loginResponseJson(response.body));
        return loginResponseJson(response.body);
      }

      if (response.statusCode == 400 || response.statusCode == 500) {
        print("Login is failed: ${response.body}");
        return loginResponseJson(response.body);
      }
    } catch (error) {
      print("exception caught $error");
      return loginResponseJson(response.body);
    }
    return null;
  }

  // SEND MAIL API SERVICE

  static Future<ResponseModel> sendMail(SendMailModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiUrl, Config.sendOtpApi);

    try {
      var response = await client.post(
        url,
        headers: requestHeaders,
        body: jsonEncode(model.toJson()),
      );

      return responseJson(response.body);
    } catch (error) {
      throw Exception('Error while trying to send mail $error');
    }
  }

  // VERIFY OTP API SERVICE

  static Future<ResponseModel> verifyOtp(VerifyOtpModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiUrl, Config.verifyOtpApi);

    try {
      var response = await client.post(
        url,
        headers: requestHeaders,
        body: jsonEncode(model.toJson()),
      );

      return responseJson(response.body);
    } catch (error) {
      throw Exception('Error while trying to verify otp $error');
    }
  }

  // RESET PASSWORD API SERVICE

  static Future<ResponseModel> resetPassword(ResetPasswordModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiUrl, Config.resetPasswordApi);

    try {
      var response = await client.post(
        url,
        headers: requestHeaders,
        body: jsonEncode(model.toJson()),
      );

      return responseJson(response.body);
    } catch (error) {
      throw Exception('Error while trying to verify otp $error');
    }
  }
}
