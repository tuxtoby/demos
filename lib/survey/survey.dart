import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demos/survey/survey_data.dart';
import 'package:flutter/material.dart';

import 'widgets/survey_content.dart';
import 'widgets/survey_error.dart';
import 'widgets/survey_loading.dart';

class Survey extends StatefulWidget {
  const Survey({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  late int _index = 0;

  final CollectionReference _datas =
      FirebaseFirestore.instance.collection("surveys");

  final List<SurveyData> _surveys = <SurveyData>[];

  void _nextQuestion(int question) {
    setState(() {
      _index++;
    });
  }

  void snapshotToWidgets(AsyncSnapshot snapshot) {
    for (var doc in snapshot.data.docs) {
      print("${doc.id} => ${doc.data()}");

      var data = doc.data();
      var survey = SurveyData(
          question: data['question'],
          addionnalInfo: data['additionnal_info'],
          decisions: List<String>.from(data["decision"]));

      _surveys.add(survey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _datas.get(),
        builder: (context, snapshot) {
          Widget content;
          if (snapshot.hasData) {
            snapshotToWidgets(snapshot);
            content = SurveyContent(_surveys[_index], _nextQuestion);
          } else if (snapshot.hasError) {
            content = SurveyError(snapshot.error as String);
          } else {
            content = const SurveyLoading();
          }
          return Center(child: content);
        });
  }
}
