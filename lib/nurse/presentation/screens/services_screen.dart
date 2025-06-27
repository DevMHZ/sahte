import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahte/nurse/presentation/cubit/services_cubit.dart';
import 'package:sahte/nurse/presentation/cubit/services_state.dart';
import 'package:sahte/nurse/presentation/widget/add_service_button.dart';
import 'package:sahte/nurse/presentation/widget/service_list_item_actions.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Services'), centerTitle: true),
      body: BlocBuilder<ServicesCubit, ServicesState>(
        builder: (context, state) {
          if (state is ServicesLoading || state is ServicesInitial) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ServicesFailure) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          }

          if (state is ServicesSuccess) {
            if (state.services.isEmpty) {
              return const Center(child: Text('No services yet.'));
            }

            return ListView.builder(
              itemCount: state.services.length,
              itemBuilder: (context, index) {
                final service = state.services[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    title: Text(
                      service.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Price: ${service.price}'),

                    trailing: ServiceListItemActions(service: service),
                  ),
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: const AddServiceFabButton(),
    );
  }
}
