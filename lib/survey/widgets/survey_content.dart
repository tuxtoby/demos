import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../survey_data.dart';
import 'additionnal_info.dart';
import 'survey_body.dart';

class SurveyContent extends StatelessWidget {
  final SurveyData survey;
  final VoidCallback _nextQuestion;

  const SurveyContent(this.survey, this._nextQuestion);

  String get currentQuestion => survey.question;
  List<String> get currentDecisions => survey.decisions;
  String get currentAdditionnalInfo => survey.addionnalInfo;

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
        minHeight: 75,
        backdropEnabled: true,
        body: SurveyBody(currentQuestion, currentDecisions, _nextQuestion),
        panel: AdditionnalInfo(currentAdditionnalInfo),
        collapsed: Container(
            color: Colors.blueGrey,
            child: Center(
                child: Column(
              children: const [
                SizedBox(height: 10),
                Icon(Icons.arrow_upward, color: Colors.white),
                SizedBox(height: 10),
                Text("Pour comprendre", style: TextStyle(color: Colors.white)),
              ],
            ))));
  }
}
