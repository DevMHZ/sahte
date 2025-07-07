import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahte/features/nurse_by_abdulkareem/model/service.dart';
import 'package:sahte/features/nurse_by_abdulkareem/presentation/widgets/card_item.dart';
import 'package:sahte/features/nurse_by_abdulkareem/presentation/widgets/custom_slidable.dart';
import 'package:sahte/features/nurse_by_abdulkareem/presentation/cubit/service_cubit.dart';

class ServicesList extends StatelessWidget {
  final List<Service> services;

  const ServicesList({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: services.length,
      itemBuilder: (context, index) {
        final service = services[index];

        return CustomSlidable(
          keyY: Key(service.id.toString()),
          editFunction: () => _showEditDialog(context, service),
          deleteFunction: () => _confirmDelete(context, service.id),
          child: CardItem(service: service),
        );
      },
    );
  }

  void _showEditDialog(BuildContext context, Service service) {
    final nameController = TextEditingController(text: service.name);
    final priceController = TextEditingController(text: service.price);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('تعديل الخدمة'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'اسم الخدمة'),
            ),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(labelText: 'السعر'),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            child: const Text('إلغاء'),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            child: const Text('حفظ'),
            onPressed: () {
              context.read<ServicesCubit>().updateService(
                id: service.id,
                name: nameController.text,
                price: priceController.text,
              );
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  void _confirmDelete(BuildContext context, int id) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('تأكيد الحذف'),
        content: const Text('هل أنت متأكد أنك تريد حذف هذه الخدمة؟'),
        actions: [
          TextButton(
            child: const Text('إلغاء'),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            child: const Text('حذف'),
            onPressed: () {
              context.read<ServicesCubit>().deleteService(id: id);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
