import 'package:flutter/material.dart';

class AdditionnalInfo extends StatelessWidget {
  final String additionnalInfo;

  AdditionnalInfo(this.additionnalInfo);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(children: [
              const Padding(
                  padding: EdgeInsets.only(bottom: 50),
                  child: Text("Par ici les infos",
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center)),
              Text(additionnalInfo, style: const TextStyle(fontSize: 18))
            ])));
  }
}
