import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sahte/core/services/auth_storage_helper.dart';
import 'package:sahte/features/services/data/api/api_const.dart';
import 'package:sahte/features/services/model/services_request/services_request.dart';
import 'package:sahte/features/services/model/services_response/services_response.dart';

part 'services_api_service.g.dart';

@RestApi(baseUrl: ServicesApiConst.baseUrl)
abstract class ServicesApiService {
  factory ServicesApiService(Dio dio, {String baseUrl}) = _ServicesApiService;

  @GET('/services')
  Future<ServicesResponse> getServices();

  @POST('/services')
  Future<void> createService(@Body() ServicesRequest request);

  @POST('/services/{id}')
  Future<void> updateService(
    @Path('id') int id,
    @Body() ServicesRequest request,
  );

  @DELETE('/services/{id}')
  Future<void> deleteService(@Path('id') int id);
} 