import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sahte/features/nurse_by_abdulkareem/model/service_request.dart';

import '../../../nurse/data/api/api_const.dart';
import '../../model/service_response.dart';

part 'services_api.g.dart';

@RestApi(baseUrl: ServicesApiConst.baseUrl)
abstract class RestServices {
  factory RestServices(Dio dio, {String? baseUrl}) = _RestServices;

  @GET('/services')
  Future<ServicesResponse> getServices();

  @POST('/services')
  Future<void> createService(@Body() ServicesRequest request);

  @DELETE('/services/{id}')
  Future<void> deleteService(@Path('id') int id);

  @POST('/services/{id}')
  Future<void> updateService(
    @Path('id') int id,
    @Body() ServicesRequest request,
  );
}

