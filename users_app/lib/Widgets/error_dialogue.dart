import 'package:flutter/material.dart';

class ErrorAlert extends StatelessWidget {
  final String? message;
  const ErrorAlert({
    Key? key,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      content: Text(message!),
      actions: [
        ElevatedButton(
          child: const Center(
            child: Text(
              "OK",
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(primary: Colors.brown),
        )
      ],
    );
  }
}
