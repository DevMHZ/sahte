import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:sahte/auth/login/data/repo/repo.dart';
import 'package:sahte/auth/login/model/sign_in_request/login_request.dart';
import 'package:sahte/auth/login/model/sign_in_response/login_response.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository repo;

  LoginCubit(this.repo) : super(const LoginState.initial());

  Future<void> login(LoginRequest request) async {
    emit(const LoginState.loading());
    try {
      final res = await repo.login(request);

      // Since your model doesn't have status boolean, 
      // you can just check if token is not empty
      if (res.token.isNotEmpty) {
        // Save token to Hive after successful login
        final box = await Hive.openBox("authBox");
        await box.put('token', res.token); // Save token in Hive

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