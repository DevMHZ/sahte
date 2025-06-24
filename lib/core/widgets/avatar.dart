import 'package:flutter/material.dart';

Widget buildDefaultAvatar(BuildContext context) {
  return Container(
    color: Theme.of(context).colorScheme.surfaceContainerHighest,
    child: Center(
      child: Icon(
        Icons.person_rounded,
        size: 60,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
    ),
  );
}
