import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import 'decision.dart';

class SurveyBody extends StatelessWidget {
  final String _question;
  final List<String> _decisions;
  final Function _nextCallback;

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
            Column(
                children: _decisions
                    .mapIndexed((index, element) =>
                        Decision(element, _nextCallback, index))
                    .toList())
          ],
        ));
  }
}
