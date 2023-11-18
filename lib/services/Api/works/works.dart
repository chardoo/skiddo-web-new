import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:skiddo_web/models/auth/LoginResponse.dart';
import 'package:skiddo_web/models/images/folder_image.dart';
import 'package:skiddo_web/services/Api/DioClietService.dart';

class WorkEndpoint {
  static WorkEndpoint? _instance;
  factory WorkEndpoint() => _instance ??= WorkEndpoint._();

  WorkEndpoint._();

 

  Future<dynamic> getSample(dynamic payload) async {
    try {
      var response = await Api()
          .dio
          .post('/photographer/getSample', data: jsonEncode(payload));


        print("samples  works");
          print(response.data);
      switch (response.statusCode) {
        case 200:
            List<dynamic> results = response.data;
            List<Sample> imageFolder =
              results.map((json) => Sample.fromJson(json)).toList();
          return imageFolder;
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



 Future<dynamic> uploadSample(dynamic payload) async {
    try {
      
      var response = await Api()
          .dio
          .post('/photographer/uploadSample', data:  payload,
          options: Options(headers: {
          "accept": "*/*",
            "Access-Control-Allow-Origin": "*",
         'Content-Type': 'multipart/form-data',
        })
          
          );
          print("response is here man ite upload is her");
          print(response.data);
      switch (response.statusCode) {
        case 201:
            List<dynamic> results = response.data;
            List<Sample> imagesamples =
              results.map((json) => Sample.fromJson(json)).toList();
          return imagesamples;
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




Future<dynamic> deleteAnImage(dynamic payload) async {
    try {
      var response = await Api()
          .dio
          .post('/photographer/deleteSample', data: jsonEncode(payload));
      
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
