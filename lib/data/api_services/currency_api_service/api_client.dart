import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:re_exam_5/data/api_services/custom_network_exception.dart';

class ApiClient {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://nbu.uz/en/exchange-rates/json/",
      connectTimeout: 25000,
      receiveTimeout: 20000,
    ),
  );

  ApiClient() {
    _init();
  }

  Future _init() async {
    dio.interceptors.add(
      (InterceptorsWrapper(
        onError: (error, handler) async {
          print("ON ERRORGA KIRDI");
          switch (error.type) {
            case DioErrorType.connectTimeout:
            case DioErrorType.sendTimeout:
            case DioErrorType.receiveTimeout:
              throw DeadlineException(error.requestOptions);
            case DioErrorType.response:
              switch (error.response?.statusCode) {
                case 502:
                  throw BadGatewayException(error.requestOptions);
                case 401:
                  throw UnauthorizedException(error.requestOptions);
                case 404:
                  throw BadGatewayException(error.requestOptions);
              }
              break;
            case DioErrorType.cancel:
              break;
            case DioErrorType.other:
              throw NoInternetConnectionException(error.requestOptions);
          }
          debugPrint('Error Status Code:${error.response?.statusCode}');
          return handler.next(error);
        },
        onRequest: (requestOptions, handler) {
          requestOptions.headers["Accept"] = "application/json";
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) async {
          return handler.next(response);
        },
      )),
    );
  }
}