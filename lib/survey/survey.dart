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
  late int _index = 0;

  final CollectionReference _datas =
      FirebaseFirestore.instance.collection("surveys");

  final List<SurveyData> _surveys = <SurveyData>[];

  String get currentQuestion => _surveys[_index].question;
  List<String> get currentDecisions => _surveys[_index].decisions;
  String get currentAdditionnalInfo => _surveys[_index].addionnalInfo;

  void _nextQuestion() {
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
        future: _datas.get(), // a previously-obtained Future<String> or null
        builder: (context, snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            snapshotToWidgets(snapshot);
            children = <Widget>[
              SlidingUpPanel(
                  minHeight: 75,
                  backdropEnabled: true,
                  body: SurveyBody(
                      currentQuestion, currentDecisions, _nextQuestion),
                  panel: AdditionnalInfo(currentAdditionnalInfo),
                  collapsed: Container(
                      color: Colors.blueGrey,
                      child: Center(
                          child: Column(
                        children: const [
                          SizedBox(height: 10),
                          Icon(Icons.arrow_upward, color: Colors.white),
                          SizedBox(height: 10),
                          Text("Pour comprendre",
                              style: TextStyle(color: Colors.white)),
                        ],
                      ))))
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              )
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              )
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        });
  }
}
