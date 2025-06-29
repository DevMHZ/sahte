import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahte/features/nurse/presentation/cubit/services_cubit.dart';
import 'package:sahte/features/nurse/presentation/widgets/add_or_update_services.dart';

class AddServiceFabButton extends StatelessWidget {
  const AddServiceFabButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => AddServiceDialog(
            onConfirm: (name, price) {
              context.read<ServicesCubit>().createService(
                name: name,
                price: price,
              );
            },
          ),
        );
      },
      tooltip: 'Add Service',
      child: const Icon(Icons.add),
    );
  }
}