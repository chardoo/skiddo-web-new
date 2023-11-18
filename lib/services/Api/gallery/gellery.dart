import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:skiddo_web/models/auth/LoginResponse.dart';
import 'package:skiddo_web/models/images/folder_image.dart';
import 'package:skiddo_web/services/Api/DioClietService.dart';

class GalleryEndpoint {
  static GalleryEndpoint? _instance;
  factory GalleryEndpoint() => _instance ??= GalleryEndpoint._();

  GalleryEndpoint._();

  Future<dynamic> getFolder(dynamic payload) async {
    try {
      var response = await Api()
          .dio
          .post('/photographer/eventFolders', data: jsonEncode(payload));

      switch (response.statusCode) {
        case 200:
          List<dynamic> results = response.data;
          List<Folder> imageFolder =
              results.map((json) => Folder.fromJson(json)).toList();
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

  Future<dynamic> deleteFolder(dynamic payload) async {
    print("fkfkdfkdkfkdf");
    print(payload);
    try {
      var response = await Api()
          .dio
          .post('/photographer/deleteImageFolder', data: jsonEncode(payload));
      switch (response.statusCode) {
        case 200:
          // List<dynamic> results = response.data;
          // List<Folder> imageFolder =
          //   results.map((json) => Folder.fromMap(json)).toList();
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

  Future<dynamic> getEventpicture(dynamic payload) async {
    try {
      var response = await Api()
          .dio
          .post('/photographer/images', data: jsonEncode(payload));

      print("event price");
      print(response.data);
      switch (response.statusCode) {
        case 200:
          List<dynamic> results = response.data;
          List<EventImages> images =
              results.map((json) => EventImages.fromJson(json)).toList();
          return images;
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
          .post('/photographer/deleteImage', data: jsonEncode(payload));

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

  Future<dynamic> updateImage(dynamic payload) async {
    try {
      var response = await Api()
          .dio
          .post('/photographer/updateImage', data: jsonEncode(payload));

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

  Future<dynamic> createEvent(dynamic payload) async {
    try {
      var response = await Api().dio.post('/photographer/createEvent',
          data: payload,
          options: Options(headers: {
            "accept": "*/*",
            "Access-Control-Allow-Origin": "*",
            'Content-Type': 'multipart/form-data',
          }));

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

  Future<dynamic> updatingImage(dynamic payload) async {
    try {
      var response = await Api()
          .dio
          .post('/photographer/updateImage', data: jsonEncode(payload));
      print("results of updating");
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

  Future<dynamic> uploadImages(dynamic payload) async {
    try {
      var response = await Api().dio.post('/photographer/uploadImages',
          data: payload,
          options: Options(headers: {
            "accept": "*/*",
            "Access-Control-Allow-Origin": "*",
            'Content-Type': 'multipart/form-data',
          }));
      switch (response.statusCode) {
        case 201:
          List<dynamic> results = response.data;
          List<EventImages> images =
              results.map((json) => EventImages.fromJson(json)).toList();
          return images;
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
