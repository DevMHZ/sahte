import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sahte/auth/login/model/sign_in_request/login_request.dart';
import 'package:sahte/auth/login/presentation/cubit/login_cubit.dart';
import 'package:sahte/auth/login/presentation/widgets/sign_in_button.dart';
import 'package:sahte/core/helper/size.dart';
import 'package:sahte/core/router/rotue_names.dart';
import 'package:sahte/core/style/text_style.dart';
import 'package:sahte/core/widgets/text_form_fiels.dart';
 
 
// ignore: must_be_immutable
class SignInFormFields extends StatefulWidget {
  const SignInFormFields({
    super.key,
  });

  @override
  SignInFormFieldsState createState() => SignInFormFieldsState();
}

class SignInFormFieldsState extends State<SignInFormFields> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  bool validate() {
    return _formKey.currentState?.validate() ?? false;
  }

  GlobalKey<FormState> get formKey => _formKey; // Expose the formKey

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            fillColor: Theme.of(context).colorScheme.secondary,
            controller: _emailController,
            additionalWidget: Text(
              'email'.tr(),
              style: TextStyles.text_14(context)
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            hintText: 'example@gmail.com',
            validator: _validateEmail,
          ),
          MediaSize.verticalSpce(10),
           CustomTextFormField(
            fillColor: Theme.of(context).colorScheme.secondary,
            controller: _passwordController,
            additionalWidget: Text(
              'password'.tr(),
              style: TextStyles.text_14(context)
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            hintText: '********',
          ),
           MediaSize.verticalSpce(20),
BlocBuilder<LoginCubit, LoginState>(
  builder: (_, state) {
    return state.maybeWhen(orElse:() {
      return const SizedBox();
    },
    
    success: (response) {
      Future.delayed(Duration.zero,(){
        context.push(RouteNames.nurseHomeScreen ,);
      });
      return const SizedBox();
    },);
  },
),
          SignInButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                context.read<LoginCubit>().login(LoginRequest(
                      email: _emailController.text,
                      password: _passwordController.text,
                    ));
         

               } else {
              }
              return null;
            },
          )
        ],
      ),
    );}
  } 