import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahte/features/nurse/model/services.dart';
import 'package:sahte/features/nurse/presentation/cubit/services_cubit.dart';
import 'package:sahte/features/nurse/presentation/widgets/add_or_update_services.dart';

class ServiceListItemActions extends StatelessWidget {
  final Services service;

  const ServiceListItemActions({super.key, required this.service});

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: const Text('Are you sure you want to delete this service?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(dialogContext).pop(),
            ),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: const Text('Delete'),
              onPressed: () {
                context.read<ServicesCubit>().deleteService(
                  serviceId: service.id,
                );
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showUpdateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AddServiceDialog(
        serviceToUpdate: service,
        onConfirm: (newName, newPrice) {
          context.read<ServicesCubit>().updateService(
            serviceId: service.id,
            name: newName,
            price: newPrice,
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
          onPressed: () {
            _showUpdateDialog(context);
          },
          tooltip: 'Edit Service',
        ),
        IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            _showDeleteConfirmationDialog(context);
          },
          tooltip: 'Delete Service',
        ),
      ],
    );
  }
}