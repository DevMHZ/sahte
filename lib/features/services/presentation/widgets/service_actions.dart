import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahte/core/services/snak_bar.dart';
import 'package:sahte/core/widgets/confierm_dialog.dart';
import 'package:sahte/features/services/model/services.dart';
import 'package:sahte/features/services/presentation/cubit/services_cubit.dart';
import 'package:sahte/features/services/presentation/widgets/service_dialog.dart';

class ServiceActions extends StatelessWidget {
  final Services service;

  const ServiceActions({super.key, required this.service});

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return ConfirmDialogWidget(
          title: 'confirm_deletion'.tr(),
          content: '${'delete_confirmation_message'.tr()} "${service.name}"?',
          onConfirm: () {
            context.read<ServicesCubit>().deleteService(serviceId: service.id);
            Navigator.of(dialogContext).pop();
            CustomSnackBar.show(
              context: context,
              message: 'service_deleted_successfully'.tr(),
              status: SnackBarStatus.success,
            );
          },
          onCancel: () => Navigator.of(dialogContext).pop(),
        );
      },
    );
  }

  void _showUpdateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => ServiceDialog(
        serviceToUpdate: service,
        onConfirm: (name, price) {
          context.read<ServicesCubit>().updateService(
            serviceId: service.id,
            name: name,
            price: price,
          );
          CustomSnackBar.show(
            context: context,
            message: 'service_updated_successfully'.tr(),
            status: SnackBarStatus.success,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.edit, color: Colors.blue),
          onPressed: () => _showUpdateDialog(context),
        ),
        IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () => _showDeleteConfirmationDialog(context),
        ),
      ],
    );
  }
}
