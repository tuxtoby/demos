import 'package:demos/survey/decision.dart';
import 'package:demos/survey/survey_body.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'additionnal_info.dart';

class Survey extends StatelessWidget {
  const Survey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
        minHeight: 75,
        backdropEnabled: true,
        body: const SurveyBody(),
        panel: const AdditionnalInfo(),
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
