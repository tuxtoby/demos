import 'package:flutter/material.dart';

class Decision extends StatelessWidget {
  final String _content;

  const Decision(this._content, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(25),
        child: Text(
          _content,
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 18),
        ));
  }
}
