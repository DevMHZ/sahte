import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sahte/core/style/design_tokens.dart';

class ConfirmDialogWidget extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const ConfirmDialogWidget({
    super.key,
    required this.title,
    required this.content,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title.tr(),
        style: AppTextStyles.headlineSmall(context),
      ),
      content: Text(
        content.tr(),
        style: AppTextStyles.bodyMedium(context),
      ),
      actions: [
        TextButton(
          onPressed: onCancel,
          child: Text(
            'cancel'.tr(),
            style: AppTextStyles.bodyLarge(context),
          ),
        ),
        TextButton(
          onPressed: onConfirm,
          child: Text(
            'confirm'.tr(),
            style: AppTextStyles.bodyLarge(context),
          ),
        ),
      ],
    );
  }
}
