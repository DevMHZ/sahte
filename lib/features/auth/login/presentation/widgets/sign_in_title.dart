import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sahte/core/style/design_tokens.dart';

class SignInTitle extends StatelessWidget {
  const SignInTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Column(
      children: [
        Container(
          width: AppSpacing.spacing80,
          height: AppSpacing.spacing80,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.3),
                blurRadius: AppSpacing.shadowBlurXxl,
                offset: Offset(AppSpacing.shadowOffsetX, AppSpacing.shadowOffsetYXl),
              ),
            ],
          ),
          child: Icon(
            Icons.medical_services_rounded,
            size: AppSpacing.iconXxl,
            color: AppColors.textPrimaryDark,
          ),
        ),
        SizedBox(height: AppSpacing.spacing16),
        Text(
          'app_name'.tr(),
          style: AppTextStyles.displayLarge(context, isDark: isDark, color: AppColors.primary),
        ),
        Text(
          'app_subtitle'.tr(),
          style: AppTextStyles.bodyLarge(
            context,
            isDark: isDark,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
