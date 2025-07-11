import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'models/service_model.dart';
import 'models/service_list_response.dart';
part 'service_api.g.dart';

@RestApi(baseUrl: 'https://evra-co.com/api/nurse')
abstract class ServiceApi {
  factory ServiceApi(Dio dio, {String baseUrl}) = _ServiceApi;

  @GET('/services')
  Future<ServiceListResponse> getServices();

  @POST('/services')
  Future<Service> createService(@Body() Map<String, dynamic> body);

  @PUT('/services/{id}')
  Future<Service> updateService(@Path('id') int id, @Body() Map<String, dynamic> body);

  @DELETE('/services/{id}')
  Future<void> deleteService(@Path('id') int id);
}