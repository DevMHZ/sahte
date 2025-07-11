import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import ' widgets/service_form_dialog.dart';
import '../../core/di/di.dart';
import '../logic/service_cubit.dart';
import '../logic/service_state.dart';
import '../data/models/service_model.dart';
import 'widgets/service_form_dialog.dart';
class ServiceScreen extends StatelessWidget {
  final int nurseId;
  const ServiceScreen({super.key, required this.nurseId});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ServiceCubit>()..fetchServices(),
      child: Scaffold(
        appBar: AppBar(title: const Text('الخدمات')),
        body: BlocBuilder<ServiceCubit, ServiceState>(
          builder: (context, state) {
            if (state is _Loading) return const Center(child: CircularProgressIndicator());
            if (state is _Error) return Center(child: Text('حدث خطأ: ${state.message}'));
            if (state is _Loaded) {
              final services = state.services;
              return ListView.builder(
                itemCount: services.length,
                itemBuilder: (context, index) {
                  final service = services[index];
                  return ListTile(
                    title: Text(service.name),
                    subtitle: Text('${service.price} ل.س'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => showDialog(
                            context: context,
                            builder: (_) => ServiceFormDialog(
                              name: service.name,
                              price: service.price,
                              onSubmit: (name, price) => context.read<ServiceCubit>().updateService(service.id, name, price),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => context.read<ServiceCubit>().deleteService(service.id),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showDialog(
            context: context,
            builder: (_) => ServiceFormDialog(
              onSubmit: (name, price) => context.read<ServiceCubit>().createService(name, price, nurseId),
            ),
          ),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

