import 'package:flutter/material.dart';
import 'package:sahte/features/nurse_by_abdulkareem/model/service.dart';
class CardItem extends StatelessWidget {
  Service service;
   CardItem({super.key, required this. service});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        title: Text(service.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text('السعر: ${service.price}'),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.medical_services, color: Colors.blue),
            Text('ID: ${service.id}', style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

