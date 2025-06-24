import 'package:flutter/material.dart';

Widget buildLoading(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            strokeWidth: 2.5,
            color: Theme.of(context).colorScheme.primary,
            backgroundColor: Theme.of(context).brightness == Brightness.dark
                ? Colors.grey[800]
                : Colors.grey[200],
            strokeCap: StrokeCap.round,
          ),
        ),
      ],
    ),
  );
}
