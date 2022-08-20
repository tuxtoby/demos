import 'package:flutter/material.dart';

class SurveyError extends StatelessWidget {
  final String errorMessage;

  const SurveyError(this.errorMessage);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Icon(
        Icons.error_outline,
        color: Colors.red,
        size: 60,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Text('Error: $errorMessage'),
      )
    ]);
  }
}
