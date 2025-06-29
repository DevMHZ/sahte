import 'package:dio/dio.dart';
import 'package:sahte/core/services/auth_storage_helper.dart';
import 'package:sahte/features/nurse/data/api/api_const.dart';
import 'package:sahte/features/nurse/model/services_response.dart';

class ServicesApiService {
  final Dio dio;

  final String _baseUrl = ServicesApiConst.baseUrl;

  ServicesApiService(this.dio);

  /// Get authentication headers with token
  Future<Map<String, String>> _getAuthHeaders() async {
    final token = await AuthStorageHelper.getToken();
    if (token != null && token.isNotEmpty) {
      return {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };
    }
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
  }

  Future<ServicesResponse> getServices() async {
    try {
      final headers = await _getAuthHeaders();
      final response = await dio.get(
        '$_baseUrl/services',
        options: Options(headers: headers),
      );

      return ServicesResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> createService(String name, String price) async {
    try {
      final headers = await _getAuthHeaders();
      final formData = FormData.fromMap({'name': name, 'price': price});

      await dio.post(
        '$_baseUrl/services',
        data: formData,
        options: Options(headers: headers),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateService(int id, String name, String price) async {
    try {
      final headers = await _getAuthHeaders();
      final formData = FormData.fromMap({'name': name, 'price': price});

      await dio.post(
        '$_baseUrl/services/$id',
        data: formData,
        options: Options(headers: headers),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteService(int id) async {
    try {
      final headers = await _getAuthHeaders();
      await dio.delete(
        '$_baseUrl/services/$id',
        options: Options(headers: headers),
      );
    } catch (e) {
      rethrow;
    }
  }
}