import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahte/auth/login/presentation/cubit/login_cubit.dart';
import 'package:sahte/core/widgets/buttons/loading_button.dart';
import 'package:sahte/core/widgets/snak_bar.dart';

class SignInButton extends StatelessWidget {
  final Future<dynamic>? Function()? onPressed;

  const SignInButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        debugPrint('state: $state');
        return state.maybeWhen(
          orElse: () {
            return LoadingButton(
              buttonText: 'Sign In',
              onPressed: onPressed,
              isLoading: false,
            );
          },
          loading: () {
            return LoadingButton(
              buttonText: 'Sign In',
              onPressed: onPressed,
              isLoading: true,
            );
          },
          success: (signInResponse) {
            Future.delayed(const Duration(microseconds: 100), () {
              // UserService.saveUser(LocalUserModel( name: signInResponse.fullName!, email: signInResponse.email, image: signInResponse.image, roleId: signInResponse.roleId));
              // context.go(homeUserRoute(signInResponse.roleId!));
            });
            return LoadingButton(
              buttonText: 'Sign In',
              onPressed: onPressed,
              isLoading: false,
            );
          },
          failure: (message) {
            SnackbarHelper.showSnackbar(
              context: context,
              title: 'error',
              content: message,
              state: SnackbarState.error,
            );
            context.read<LoginCubit>().resetState(); // ✅ رجّع الحالة initial

            return LoadingButton(
              buttonText: 'Sign In',
              onPressed: onPressed,
              isLoading: false,
            );
          },
        );
      },
    );
  }
}
