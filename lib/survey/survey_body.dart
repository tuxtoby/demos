import 'package:flutter/material.dart';

import 'decision.dart';

class SurveyBody extends StatelessWidget {
  const SurveyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            Text(
              "Faut-il isoler les logements en France?",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
            Decision("Oui, et l'état paye l'intégralité"),
            Decision("Oui, et l'état paye une partie"),
            Decision("Non, je ne trouve pas ça utile"),
            Decision("Sans opinion"),
          ],
        ));
  }
}
