import 'package:sahte/features/nurse_by_abdulkareem/model/service_request.dart';
import 'package:sahte/features/nurse_by_abdulkareem/model/service_response.dart';

import '../api/services_api.dart';

class ServicesRepository {
  final RestServices api;

  ServicesRepository(this.api);

  Future<ServicesResponse> getServices() async {
    return await api.getServices();
  }

  Future<void> createService(ServicesRequest request) async {
    await api.createService(request);
  }

  Future<void> updateService(int id, ServicesRequest request) async {
    await api.updateService(id, request);
  }

  Future<void> deleteService(int id) async {
    await api.deleteService(id);
  }
}
