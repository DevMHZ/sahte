import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:sahte/core/router/rotue_names.dart';
import 'package:sahte/core/services/snak_bar.dart';
import 'package:sahte/features/auth/login/model/sign_in_request/login_request.dart';
import 'package:sahte/features/auth/login/presentation/cubit/login_cubit.dart';

class SignInButton extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState>? formKey;
  
  const SignInButton({
    super.key,
    required this.emailController,
    required this.passwordController,
    this.formKey,
  });

  @override
  State<SignInButton> createState() => _SignInButtonState();
}

class _SignInButtonState extends State<SignInButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        state.map(
          initial: (_) => setState(() => _isLoading = false),
          loading: (_) => setState(() => _isLoading = true),
          success: (s) {
            setState(() => _isLoading = false);
            CustomSnackBar.show(
              context: context,
              message: s.response.message,
              status: SnackBarStatus.success,
            );
            context.go(RouteNames.nurseHomeScreen);
            print('Login Success: ${s.response.token}');
          },
          failure: (f) {
            setState(() => _isLoading = false);
            CustomSnackBar.show(
              context: context,
              message: f.message,
              status: SnackBarStatus.error,
            );
          },
        );
      },
      child: SizedBox(
        height: 56,
        child: ElevatedButton(
          onPressed: _isLoading ? null : _handleSignIn,
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
            elevation: 0,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          ),
          child: _isLoading
              ? SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      colorScheme.onPrimary,
                    ),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.login_rounded,
                      size: 20,
                      color: colorScheme.onPrimary,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'sign_in'.tr(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onPrimary,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  void _handleSignIn() {
    // Validate form fields
    if (widget.formKey != null && widget.formKey!.currentState != null) {
      if (!widget.formKey!.currentState!.validate()) {
        return;
      }
    }
    final email = widget.emailController.text.trim();
    final password = widget.passwordController.text.trim();

    // Validate form fields (redundant, but for safety)
    if (email.isEmpty) {
      CustomSnackBar.show(
        context: context,
        message: 'email_required'.tr(),
        status: SnackBarStatus.error,
      );
      return;
    }

    if (password.isEmpty) {
      CustomSnackBar.show(
        context: context,
        message: 'password_required'.tr(),
        status: SnackBarStatus.error,
      );
      return;
    }

    // Validate email format
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      CustomSnackBar.show(
        context: context,
        message: 'email_invalid'.tr(),
        status: SnackBarStatus.error,
      );
      return;
    }

    // Create login request with real data
    final loginRequest = LoginRequest(
      email: email,
      password: password,
    );

    // Call the API with real data
    context.read<LoginCubit>().login(loginRequest);
  }
}
