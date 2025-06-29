import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahte/core/widgets/app_bar.dart';
import 'package:sahte/core/widgets/loading.dart';
import 'package:sahte/features/nurse/presentation/cubit/services_cubit.dart';
import 'package:sahte/features/nurse/presentation/cubit/services_state.dart';
import 'package:sahte/features/nurse/presentation/widgets/add_services_button.dart';
import 'package:sahte/features/nurse/presentation/widgets/service_list_items_actions.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch services when screen loads
    context.read<ServicesCubit>().fetchServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'My Services'),
      body: BlocBuilder<ServicesCubit, ServicesState>(
        builder: (context, state) {
          if (state is ServicesLoading || state is ServicesInitial) {
            return Center(child: buildLoading(context));
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
