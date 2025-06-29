import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sahte/core/style/design_tokens.dart';

class SignInPrompt extends StatelessWidget {
  const SignInPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'no_account'.tr(),
          style: AppTextStyles.bodyMedium(context),
        ),
        TextButton(
          onPressed: () {
            // context.push(RouteNames.signUp);
          },
          child: Text(
            'create_account'.tr(),
            style: AppTextStyles.bodyLarge(context).copyWith(
              letterSpacing: 1,
              shadows: const [
                Shadow(color: Colors.black, offset: Offset(0, 0)),
              ],
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
