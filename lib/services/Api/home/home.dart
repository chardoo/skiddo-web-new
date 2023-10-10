import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:skiddo_web/models/auth/LoginResponse.dart';
import 'package:skiddo_web/services/Api/DioClietService.dart';

class HomeEndpoint {
  static HomeEndpoint? _instance;
  factory HomeEndpoint() => _instance ??= HomeEndpoint._();

  HomeEndpoint._();

 

  Future<dynamic> getDashBoardData(dynamic payload) async {
    try {
      var response = await Api()
          .dio
          .post('/photographer/dashboardData', data: jsonEncode(payload));


    print("response for dashboard");
    print(response.data);
      switch (response.statusCode) {
        case 200:
         
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


}
