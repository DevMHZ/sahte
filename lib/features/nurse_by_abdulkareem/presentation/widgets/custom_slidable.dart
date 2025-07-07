import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CustomSlidable extends StatelessWidget {
  const CustomSlidable({
    super.key,
    required this.keyY,
    required this.child,
    required this.editFunction,
    required this.deleteFunction,
  });

  final Key keyY;
  final Widget child;
  final VoidCallback editFunction;
  final VoidCallback deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: keyY,
      closeOnScroll: true,
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => deleteFunction(),
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => editFunction(),
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
        ],
      ),
      child: child,
    );
  }
}
