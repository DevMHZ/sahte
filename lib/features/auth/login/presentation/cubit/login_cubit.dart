import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sahte/core/services/auth_storage_helper.dart';
import 'package:sahte/core/services/dio_factory.dart';
import 'package:sahte/features/auth/login/data/repo/repo.dart';
import 'package:sahte/features/auth/login/model/sign_in_request/login_request.dart';
import 'package:sahte/features/auth/login/model/sign_in_response/login_response.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository repo;

  LoginCubit(this.repo) : super(const LoginState.initial());

  Future<void> login(LoginRequest request) async {
    emit(const LoginState.loading());
    try {
      final res = await repo.login(request);
      if (res.token.isNotEmpty) {
        await AuthStorageHelper.saveToken(res.token);
        DioFactory.setTokenIntoHeaderAfterLogin(res.token);
        emit(LoginState.success(res));
        print('Received Token: ${res.token}');
        
      } else {
        emit(LoginState.failure(res.message));
      }
    } catch (e) {
      emit(const LoginState.failure("خطأ غير متوقع:"));
    }
  }

  void resetState() => emit(const LoginState.initial());
}
