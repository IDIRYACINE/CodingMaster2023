import 'package:flutter/material.dart';

class InformativeDialog extends StatelessWidget {
  const InformativeDialog({super.key, required this.descripton});

  final String descripton;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Error'),
      content: Text(descripton),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Ok'),
        ),
      ],
    );
  }
}
