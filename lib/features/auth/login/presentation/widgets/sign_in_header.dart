import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sahte/core/style/design_tokens.dart';

Widget buildSigninHeader(
  BuildContext context,
  ColorScheme colorScheme,
  TextTheme textTheme,
) {
  return Column(
    children: [
      Container(
        width: AppSpacing.spacing80,
        height: AppSpacing.spacing80,
        decoration: BoxDecoration(
          color: colorScheme.primary,
          borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
          boxShadow: [
            BoxShadow(
              color: colorScheme.primary.withOpacity(0.3),
              blurRadius: AppSpacing.shadowBlurXxl,
              offset: Offset(
                AppSpacing.shadowOffsetX,
                AppSpacing.shadowOffsetYXl,
              ),
            ),
          ],
        ),
        child: Icon(
          Icons.medical_services_rounded,
          size: AppSpacing.iconXxl,
          color: colorScheme.onPrimary,
        ),
      ),

      SizedBox(height: AppSpacing.spacing16),

      Text(
        'app_name'.tr(),
        style: textTheme.displayLarge?.copyWith(
          color: colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),

      Text(
        'app_subtitle'.tr(),
        style: textTheme.bodyLarge?.copyWith(
          color: colorScheme.onSurface.withOpacity(0.7),
        ),
      ),
    ],
  );
}
