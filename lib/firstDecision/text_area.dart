import 'package:flutter/material.dart';

class TextArea extends StatelessWidget {
  const TextArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
        decoration: InputDecoration(
      labelText: 'Ma decision',
    ));
  }
}
