import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sahte/core/style/design_tokens.dart';
import 'package:sahte/features/services/model/services.dart';
import 'package:sahte/features/services/presentation/widgets/service_item.dart';

class ServicesList extends StatelessWidget {
  final List<Services> services;

  const ServicesList({
    super.key,
    required this.services,
  });

  @override
  Widget build(BuildContext context) {
    if (services.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.medical_services_outlined,
              size: AppSpacing.iconXxl,
              color: AppColors.textSecondary,
            ),
            SizedBox(height: AppSpacing.spacing16),
            Text(
              'no_services_yet'.tr(),
              style: AppTextStyles.bodyLarge(context),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppSpacing.spacing8),
            Text(
              'add_first_service_prompt'.tr(),
              style: AppTextStyles.bodyMedium(context),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.all(AppSpacing.screenMarginLg),
      itemCount: services.length,
      itemBuilder: (context, index) {
        final service = services[index];
        return Padding(
          padding: EdgeInsets.only(bottom: AppSpacing.spacing12),
          child: ServiceItem(service: service),
        );
      },
    );
  }
} 