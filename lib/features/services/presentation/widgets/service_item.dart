import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sahte/core/style/design_tokens.dart';
import 'package:sahte/features/services/model/services.dart';
import 'package:sahte/features/services/presentation/widgets/service_actions.dart';

class ServiceItem extends StatelessWidget {
  final Services service;

  const ServiceItem({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.getSurfaceColor(isDark),
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        boxShadow: [
          BoxShadow(
            color: AppColors.getShadowColor(isDark),
            blurRadius: AppSpacing.shadowBlurMd,
            offset: Offset(AppSpacing.shadowOffsetX, AppSpacing.shadowOffsetY),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(AppSpacing.spacing16),
        leading: Container(
          width: AppSpacing.spacing48,
          height: AppSpacing.spacing48,
          decoration: BoxDecoration(
            // ignore: deprecated_member_use
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          ),
          child: Icon(
            Icons.medical_services,
            color: AppColors.primary,
            size: AppSpacing.iconLg,
          ),
        ),
        title: Text(service.name, style: AppTextStyles.bodyLarge(context)),
        subtitle: Text(
          '${'price'.tr()}: ${service.price}',
          style: AppTextStyles.bodyMedium(
            context,
            color: AppColors.textSecondary,
          ),
        ),
        trailing: ServiceActions(service: service),
      ),
    );
  }
}
