import 'package:flutter/material.dart';

class SurveyLoading extends StatelessWidget {
  const SurveyLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 60,
      height: 60,
      child: CircularProgressIndicator(),
    );
  }
}
