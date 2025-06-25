import 'package:sahte/nurse/services/data/api/services_api_service.dart';
import 'package:sahte/nurse/services/model/services_response.dart';

class ServicesRepository {
  final ServicesApiService apiService;

  ServicesRepository(this.apiService);

  Future<ServicesResponse> getServices() {
    return apiService.getServices();
  }

  Future<void> createService({required String name, required String price}) {
    return apiService.createService(name, price);
  }

  Future<void> updateService({
    required int id,
    required String name,
    required String price,
  }) {
    return apiService.updateService(id, name, price);
  }

  Future<void> deleteService({required int id}) {
    return apiService.deleteService(id);
  }
}
