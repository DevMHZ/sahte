import 'dart:io';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio/io.dart';
import 'package:sahte/core/services/auth_storage_helper.dart';

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

  static void _addDioInterceptor() {
    _dio?.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Automatically add token to all requests if available
          final token = AuthStorageHelper.getTokenSync();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
        onError: (error, handler) {
          // Handle 401 Unauthorized errors
          if (error.response?.statusCode == 401) {
            print('🔐 Unauthorized request - token might be expired');
            // You can add logout logic here if needed
          }
          handler.next(error);
        },
      ),
    );

    // Add pretty logger for debugging
    _dio?.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        compact: true,
      ),
    );
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    _dio?.options.headers['Authorization'] = 'Bearer $token';
  }

  static void removeTokenFromHeaders() {
    _dio?.options.headers.remove('Authorization');
  }
}
