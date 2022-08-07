import 'package:flutter/material.dart';
import 'package:demos/firstDecision/text_area.dart';

class FirstDecisionContent extends StatelessWidget {
  const FirstDecisionContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
              Text(
                  "Selon-vous, quelle serez la première decision à prendre pour la France?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              TextArea()
            ])));
  }
}
