import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demos/survey/decision.dart';
import 'package:demos/survey/survey_body.dart';
import 'package:demos/survey/survey_data.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'additionnal_info.dart';

class Survey extends StatefulWidget {
  const Survey({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  late List<SurveyData> _datas;

  _SurveyState() {
    getData();
  }

  Future<void> getData() async {
    var db = FirebaseFirestore.instance;
    _datas = <SurveyData>[];

    db.collection("surveys").get().then((event) {
      for (var doc in event.docs) {
        print("${doc.id} => ${doc.data()}");

        var data = doc.data();
        var survey = SurveyData(
            question: data['question'],
            addionnalInfo: data['additionnal_info'],
            decisions: List<String>.from(data["decision"]));

        _datas.add(survey);
      }

      print("");
    });
  }

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
