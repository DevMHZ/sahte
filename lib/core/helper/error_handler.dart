import 'package:dio/dio.dart';

class ErrorParser {
  static String parse(dynamic error) {
    if (error is DioException || error is DioException) {
      final dioError = error;
      final response = dioError.response;
      if (response?.statusCode == 422 && response?.data is Map) {
        final data = response!.data;
        if (data.containsKey('errors')) {
          final errors = data['errors'] as Map<String, dynamic>;
          final firstKey = errors.keys.first;
          final messages = errors[firstKey];
          if (messages is List && messages.isNotEmpty) {
            return messages.first.toString();
          }
        }
      }

      if (response?.data is Map && response?.data['message'] != null) {
        return response!.data['message'].toString();
      }
      return "حدث خطأ أثناء الاتصال بالخادم.";
    }
    return "حدث خطأ غير متوقع.";
  }
}
