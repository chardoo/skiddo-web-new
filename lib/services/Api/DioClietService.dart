import 'dart:async';
import "package:dio/dio.dart";

class Api {
  final dio = createDio();
  final tokenDio = Dio(BaseOptions(baseUrl: "https://api.skiiddo.com"));

  Api._internal();

  static final _singleton = Api._internal();

  factory Api() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: "https://api.skiiddo.com",
      receiveTimeout: const Duration(seconds: 15000), // 15 seconds
      connectTimeout: const Duration(seconds: 15000),
      sendTimeout: const Duration(seconds: 15000),
    ));

    dio.interceptors.addAll({
      AppInterceptors(dio),
    });
    return dio;
  }
}

class AppInterceptors extends Interceptor {
  final Dio dio;
  AppInterceptors(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['content-Type'] = 'application/json';
    // var sessionId = await DeviceService.getSession();

    // if (sessionId.isNotEmpty) {
    //   options.data['sessionId'] = sessionId;
    // }

    return handler.next(options);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    print("onError: $err jdjjsdsjjsddsj");
    if (err.response?.statusCode == null) {
     
    }
    return handler.next(err); // <--- THE TIP IS HERE
  }

  // @override
  // void onError(DioError err, ErrorInterceptorHandler handler) {
  //   switch (err.type) {
  //     case DioErrorType.connectTimeout:
  //     case DioErrorType.sendTimeout:
  //     case DioErrorType.receiveTimeout:
  //       throw DeadlineExceededException(err.requestOptions);
  //     case DioErrorType.response:
  //       switch (err.response?.statusCode) {
  //         case 400:
  //           throw BadRequestException(err.requestOptions);
  //         case 401:
  //           throw UnauthorizedException(err.requestOptions);
  //         case 404:
  //           throw NotFoundException(err.requestOptions);
  //         case 409:
  //           throw ConflictException(err.requestOptions);
  //         case 500:
  //           throw InternalServerErrorException(err.requestOptions);
  //       }
  //       throw err;
  //     case DioErrorType.cancel:
  //       break;
  //     case DioErrorType.other:
  //       throw NoInternetConnectionException(err.requestOptions);
  //   }

  //   return handler.next(err);
  // }
}

class BadRequestException extends DioError {
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Invalid request';
  }
}

class InternalServerErrorException extends DioError {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Unknown error occurred, please try again later.';
  }
}

class ConflictException extends DioError {
  ConflictException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Conflict occurred';
  }
}

class UnauthorizedException extends DioError {
  UnauthorizedException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Access denied';
  }
}

class NotFoundException extends DioError {
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The requested information could not be found';
  }
}

class NoInternetConnectionException extends DioError {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'No internet connection detected, please try again.';
  }
}

class DeadlineExceededException extends DioError {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The connection has timed out, please try again.';
  }
}
