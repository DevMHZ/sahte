import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahte/core/services/snak_bar.dart';
import 'package:sahte/features/services/presentation/cubit/services_cubit.dart';
import 'package:sahte/features/services/presentation/widgets/service_dialog.dart';

class AddServiceButton extends StatelessWidget {
  const AddServiceButton({super.key});

  void _showAddDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => ServiceDialog(
        onConfirm: (name, price) {
          context.read<ServicesCubit>().createService(name: name, price: price);
          CustomSnackBar.show(
            context: context,
            message: 'service_added_successfully'.tr(),
            status: SnackBarStatus.success,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _showAddDialog(context),
      tooltip: 'add_service'.tr(),
      child: const Icon(Icons.add),
    );
  }
}
