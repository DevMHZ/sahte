import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sahte/features/auth/login/data/api/api_const.dart';
import 'package:sahte/features/auth/login/model/sign_in_request/login_request.dart';
import 'package:sahte/features/auth/login/model/sign_in_response/login_response.dart';

part 'login_api_service.g.dart';

@RestApi(baseUrl: LoginApiConst.baseUrl)
abstract class LoginApiService {
  factory LoginApiService(Dio dio, {String baseUrl}) = _LoginApiService;

  @POST(LoginApiConst.login)
  Future<LoginResponse> login(@Body() LoginRequest request);
}
