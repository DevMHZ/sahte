import 'package:sahte/features/auth/login/data/api/login_api_service.dart';
import 'package:sahte/features/auth/login/model/sign_in_request/login_request.dart';
import 'package:sahte/features/auth/login/model/sign_in_response/login_response.dart';

class LoginRepository {
  final LoginApiService api;

  LoginRepository(this.api);

  Future<LoginResponse> login(LoginRequest request) {
    return api.login(request);
  }
}
