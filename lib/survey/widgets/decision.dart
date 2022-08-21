import 'package:flutter/material.dart';

class Decision extends StatelessWidget {
  final String _content;
  final int _index;
  final Function _callback;

  const Decision(this._content, this._callback, this._index, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(25),
        child: ElevatedButton(
            onPressed: () => _callback(_index),
            style: TextButton.styleFrom(
                minimumSize: const Size(50, 30),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap),
            child: Text(_content)));
  }
}
