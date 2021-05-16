import 'package:flutter/material.dart';

final _color = Color(0xff8a2bce);

class Answer extends StatelessWidget {
  final text;
  final void Function() whenSelectedCallMe;

  Answer(this.text, this.whenSelectedCallMe);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(_color),
          ),
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
          onPressed: whenSelectedCallMe,
        ),
      ),
    );
  }
}
