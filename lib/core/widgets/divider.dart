import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Divider(
        height: 1,
        thickness: 0.5,
        color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
      ),
    );
  }
}
