import 'package:sahte/features/services/data/api/services_api_service.dart';
import 'package:sahte/features/services/model/services_request/services_request.dart';
import 'package:sahte/features/services/model/services_response/services_response.dart';

class ServicesRepository {
  final ServicesApiService api;

  ServicesRepository(this.api);

  Future<ServicesResponse> getServices() {
    return api.getServices();
  }

  Future<void> createService(ServicesRequest request) {
    return api.createService(request);
  }

  Future<void> updateService(int id, ServicesRequest request) {
    return api.updateService(id, request);
  }

  Future<void> deleteService(int id) {
    return api.deleteService(id);
  }
} 