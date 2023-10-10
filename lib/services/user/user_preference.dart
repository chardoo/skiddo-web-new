import 'dart:async';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  static Future<bool> setToken(String token) async {
    var prefs = Get.find<SharedPreferences>();
    return prefs.setString('access_token', token);
  }

  static Future<String> getToken() async {
    var prefs = Get.find<SharedPreferences>();
    var token = prefs.getString('access_token') ?? "";
    return Future.value(token);
  }

  static Future<bool> setEmail(String email) async {
    var prefs = Get.find<SharedPreferences>();
    return prefs.setString('email', email);
  }

  static Future<String> getEmail() async {
    var prefs = Get.find<SharedPreferences>();
    var token = prefs.getString('email') ?? "";
    return Future.value(token);
  }

  static Future<bool> setUserkey(String token) async {
    var prefs = Get.find<SharedPreferences>();
    return prefs.setString('user_key', token);
  }

  static Future<String> getUserKey() async {
    var prefs = Get.find<SharedPreferences>();
    var userKey = prefs.getString('user_key') ?? "";
    return Future.value(userKey);
  }


  static Future<bool> setLogin(bool token) async {
    var prefs = Get.find<SharedPreferences>();
    return prefs.setBool('isLoggedIn', token);
  }

  static Future<bool> getLogin() async {
    var prefs = Get.find<SharedPreferences>();
        var legals = prefs.getBool('isLoggedIn') ?? false;
    return Future.value(legals);
  }
}
