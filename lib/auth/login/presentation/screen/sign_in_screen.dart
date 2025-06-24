import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sahte/auth/login/presentation/widgets/sign_in_form_fields.dart';
import 'package:sahte/auth/login/presentation/widgets/sign_in_title.dart';
 

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

// test
class _SignInScreenState extends State<SignInScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SignInTitle(),
            SizedBox(height: 10.h),
            SizedBox(height: 24.h),
            const SignInFormFields(),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
