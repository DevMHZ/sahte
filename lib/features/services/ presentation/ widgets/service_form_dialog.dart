import 'package:flutter/material.dart';

class ServiceFormDialog extends StatefulWidget {
  final String? name;
  final String? price;
  final void Function(String name, String price) onSubmit;

  const ServiceFormDialog({super.key, this.name, this.price, required this.onSubmit});

  @override
  State<ServiceFormDialog> createState() => _ServiceFormDialogState();
}

class _ServiceFormDialogState extends State<ServiceFormDialog> {
  late TextEditingController nameController;
  late TextEditingController priceController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);
    priceController = TextEditingController(text: widget.price);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.name == null ? 'إضافة خدمة' : 'تعديل خدمة'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(controller: nameController, decoration: const InputDecoration(labelText: 'اسم الخدمة')),
          TextField(controller: priceController, decoration: const InputDecoration(labelText: 'السعر'), keyboardType: TextInputType.number),
        ],
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('إلغاء')),
        ElevatedButton(
          onPressed: () {
            widget.onSubmit(nameController.text.trim(), priceController.text.trim());
            Navigator.pop(context);
          },
          child: const Text('حفظ'),
        ),
      ],
    );
  }
}