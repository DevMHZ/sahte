import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahte/core/style/design_tokens.dart';

import '../../../nurse_by_abdulkareem/presentation/cubit/service_cubit.dart';
void showAddServiceDialog(BuildContext context) {
  final nameController = TextEditingController();
  final priceController = TextEditingController();

  final servicesCubit = context.read<ServicesCubit>();

  showDialog(
    context: context,
    builder: (_) {
      return BlocProvider.value(
        value: servicesCubit,
        child: Builder(
          builder: (dialogContext) => AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            title: Text(
              'إضافة خدمة',
              style: AppTextStyles.headlineMedium(dialogContext),
              textAlign: TextAlign.center,
            ),
            content: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: AppSpacing.spacing16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'اسم الخدمة',
                        border: const OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: AppSpacing.spacing12,
                          horizontal: AppSpacing.spacing16,
                        ),
                      ),
                    ),
                    SizedBox(height: AppSpacing.spacing16),
                    TextField(
                      controller: priceController,
                      decoration: InputDecoration(
                        labelText: 'السعر',
                        border: const OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: AppSpacing.spacing12,
                          horizontal: AppSpacing.spacing16,
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
            ),
            actionsPadding: EdgeInsets.symmetric(
              horizontal: AppSpacing.spacing16,
              vertical: AppSpacing.spacing8,
            ),
            actionsAlignment: MainAxisAlignment.spaceBetween,
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.error,
                  textStyle: AppTextStyles.bodyLarge(dialogContext),
                ),
                child: const Text('إلغاء'),
                onPressed: () => Navigator.of(dialogContext).pop(),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.spacing24,
                    vertical: AppSpacing.spacing12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                  ),
                  textStyle: AppTextStyles.bodyLarge(dialogContext).copyWith(color: Colors.white),
                ),
                child: const Text('حفظ'),
                onPressed: () {
                  final name = nameController.text.trim();
                  final price = priceController.text.trim();
                  if (name.isNotEmpty && price.isNotEmpty) {
                    dialogContext.read<ServicesCubit>().addService(
                      name: name,
                      price: price,
                    );
                    Navigator.of(dialogContext).pop();
                  }
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
