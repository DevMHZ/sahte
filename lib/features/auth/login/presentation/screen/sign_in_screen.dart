import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahte/core/manger/manager_cubit.dart';
import 'package:sahte/core/manger/manager_state.dart';
import 'package:sahte/core/widgets/app_bar.dart';
import 'package:sahte/features/auth/login/presentation/widgets/sign_in_form_fields.dart';
import 'package:sahte/features/auth/login/presentation/widgets/sign_in_button.dart';
import 'package:sahte/core/style/design_tokens.dart';
import 'package:sahte/features/auth/login/presentation/widgets/sign_in_header.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          BlocBuilder<ManagerCubit, ManagerState>(
            builder: (context, state) {
              return Container(
                margin: EdgeInsets.only(right: AppSpacing.spacing4),
                child: IconButton(
                  onPressed: () {
                    context.read<ManagerCubit>().toggleTheme();
                  },
                  icon: Icon(
                    state.themeMode == ThemeMode.dark
                        ? Icons.light_mode
                        : Icons.dark_mode,
                    size: AppSpacing.iconLg,
                    color: colorScheme.primary,
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: colorScheme.primary.withOpacity(0.1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                    ),
                    padding: EdgeInsets.all(AppSpacing.spacing12),
                    minimumSize: Size(AppSpacing.spacing40, AppSpacing.spacing40),
                  ),
                ),
              );
            },
          ),
        ],
        title: 'app_name'.tr(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.screenMarginLg,
              vertical: AppSpacing.spacing20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: AppSpacing.spacing20),
                buildSigninHeader(context, colorScheme, textTheme),
                SizedBox(height: AppSpacing.spacing40),
                SignInFormFields(
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
                SizedBox(height: AppSpacing.spacing32),
                SignInButton(
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
                SizedBox(height: AppSpacing.spacing20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
