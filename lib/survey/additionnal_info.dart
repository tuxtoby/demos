import 'package:flutter/material.dart';

class AdditionnalInfo extends StatelessWidget {
  const AdditionnalInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(children: const [
              Padding(
                  padding: EdgeInsets.only(bottom: 50),
                  child: Text("Les 3 bonnes raisons d'isoler selon l'ADEME",
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center)),
              Text(
                "+ D'économie (66% de l'énergie utilisée dans un logement vient du chauffage) \n\n + De confort \n\n+ de valeur ",
                style: TextStyle(fontSize: 18),
              )
            ])));
  }
}
