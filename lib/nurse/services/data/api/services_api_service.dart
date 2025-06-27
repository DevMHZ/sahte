import 'package:dio/dio.dart';
import 'package:sahte/nurse/services/data/api/api_const.dart';
import 'package:sahte/nurse/services/model/services_response.dart';

class ServicesApiService {
  final Dio dio;

  final String _baseUrl = ServicesApiConst.baseUrl;

  ServicesApiService(this.dio);

  Future<ServicesResponse> getServices() async {
    try {
      final response = await dio.get('$_baseUrl/services');

      return ServicesResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> createService(String name, String price) async {
    try {
      final formData = FormData.fromMap({'name': name, 'price': price});

      await dio.post('$_baseUrl/services', data: formData);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateService(int id, String name, String price) async {
    try {
      final formData = FormData.fromMap({'name': name, 'price': price});

      await dio.post('$_baseUrl/services/$id', data: formData);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteService(int id) async {
    try {
      await dio.delete('$_baseUrl/services/$id');
    } catch (e) {
      rethrow;
    }
  }
}
