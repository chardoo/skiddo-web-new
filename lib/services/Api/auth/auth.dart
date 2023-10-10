import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:skiddo_web/models/auth/LoginResponse.dart';
import 'package:skiddo_web/services/Api/DioClietService.dart';

class AuthEndpoint {
  static AuthEndpoint? _instance;
  factory AuthEndpoint() => _instance ??= AuthEndpoint._();

  AuthEndpoint._();

 

  Future<dynamic> register(dynamic payload) async {
    try {
      var response = await Api()
          .dio
          .post('/photographer/createphotographer', data: jsonEncode(payload));


    print("response for registration");
    print(response.data);
      switch (response.statusCode) {
        case 201:
         
            return response.data;
          

        default:
          return false;
      }
    } on DioError catch (err) {
      if (err.response == null) {
        // Nointernet().display(true);
        return null;
      } else {
        return false;
      }
    }
  }

  Future<dynamic> login(dynamic payload) async {
    try {
      var response = await Api()
          .dio
          .post('/photographer/login', data: jsonEncode(payload));
      switch (response.statusCode) {
        case 200:
        
            return  LoginResponseObject.fromJson(response.data);
        default:
          return false;
      }
    } on DioError catch (err) {
      if (err.response == null) {
        // Nointernet().display(true);
        return null;
      } else {
        return false;
      }
    }
  }

}
