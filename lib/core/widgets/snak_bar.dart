import 'package:flutter/material.dart';
import 'package:sahte/core/style/app_colors.dart';
import 'package:sahte/core/theme/app_theme.dart';

void showErrorSnackbar(BuildContext context, String message) {
  _showCustomSnackbar(
    context,
    title: 'Error',
    message: message,
    backgroundColor: AppColors.error,
  );
}

void showSuccessSnackbar(BuildContext context, String message) {
  _showCustomSnackbar(
    context,
    title: 'Success',
    message: message,
    backgroundColor: AppTheme.currentTheme.primaryColor,
  );
}

void _showCustomSnackbar(
  BuildContext context, {
  required String title,
  required String message,
  required Color backgroundColor,
}) {
  final snackBar = SnackBar(
    content: Row(
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(message, style: const TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ],
    ),
    backgroundColor: backgroundColor,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(16),
    duration: const Duration(seconds: 3),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
