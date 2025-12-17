import 'package:flutter/material.dart';

class ErrorMessageWidget extends StatelessWidget {
  final String? message;
  final Function? callback;

  const ErrorMessageWidget({super.key, this.message, this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error, color: Colors.red, size: 55),
          const SizedBox(height: 16),
          Text(message ?? "An Error Occurred"),
          const SizedBox(height: 16),
          callback != null
              ? TextButton(
                  onPressed: () {
                    callback!();
                  },
                  child: const Text('Retry'),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
