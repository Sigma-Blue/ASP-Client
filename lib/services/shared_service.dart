import 'dart:convert';

import 'package:ap/models/login_response_model.dart';
import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:flutter/material.dart';

class SharedService {
  static Future<bool> isLoggedIn() async {
    var isTokenExist =
        await APICacheManager().isAPICacheKeyExist("login_token");

    return isTokenExist;
  }

  static Future<LoginResponseModel?> tokenDetails() async {
    var isTokenExist =
        await APICacheManager().isAPICacheKeyExist("login_token");

    if (isTokenExist) {
      var cacheData = await APICacheManager().getCacheData("login_token");

      return loginResponseJson(cacheData.syncData);
    }
    return null;
  }

  static Future<void> setLoginDetails(LoginResponseModel model) async {
    APICacheDBModel cacheDBModel = APICacheDBModel(
        key: "login_token", syncData: jsonEncode(model.toJson()));

    await APICacheManager().addCacheData(cacheDBModel);
  }

  static Future<void> logout(BuildContext context) async {
    await APICacheManager().deleteCache("login_token");
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }
}
