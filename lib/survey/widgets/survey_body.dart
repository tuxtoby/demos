import 'package:flutter/material.dart';

import 'decision.dart';

class SurveyBody extends StatelessWidget {
  final String _question;
  final List<String> _decisions;
  final VoidCallback _nextCallback;

  const SurveyBody(this._question, this._decisions, this._nextCallback);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              _question,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24),
            ),
            Column(children: _decisions.map((_) => Decision(_)).toList()),
            ElevatedButton(
                onPressed: () => _nextCallback(), child: const Text("Next"))
          ],
        ));
  }
}
