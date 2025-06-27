import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio/io.dart';

class DioFactory {
  DioFactory._();

  static Dio? _dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (_dio == null) {
      _dio = Dio()
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;

      _addDioHeaders();
      _addDioInterceptor();

      // Disable SSL certificate verification (for development purposes)
      (_dio!.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
        final client = HttpClient();
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) =>
                true; // Ignore SSL certificate errors
        return client;
      };
    }

    return _dio!;
  }

  static void _addDioHeaders() {
    // Set common headers for requests
    _dio?.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    _dio?.options.headers['Authorization'] = 'Bearer $token';
  }

  // static void _addDioInterceptor() {
  //   _dio?.interceptors.add(
  //     PrettyDioLogger(
  //       request: true,
  //       requestHeader: true,
  //       requestBody: true,
  //       responseHeader: true,
  //       responseBody: true,
  //       error: true,
  //     ),
  //   );

  //   // Add error handling interceptor to handle errors properly
  //   _dio?.interceptors.add(
  //     InterceptorsWrapper(
  //       onError: (DioException e, ErrorInterceptorHandler handler) {
  //         // Log detailed error information
  //         print('Error occurred: ${e.message}');
  //         print('Request: ${e.requestOptions}');
  //         if (e.response != null) {
  //           print('Response: ${e.response?.data}');
  //           print('Status Code: ${e.response?.statusCode}');
  //         } else {
  //           print('Request failed without response: ${e.requestOptions.data}');
  //         }
  //         handler.next(e); // Continue with the error handling chain
  //       },
  //     ),
  //   );
  // }

  static void _addDioInterceptor() {
    _dio?.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final box = await Hive.openBox("authBox");
          final token = box.get('token');
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
      ),
    );

    if (kDebugMode) {
      _dio?.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          error: true,
        ),
      );
    }
  }
}
