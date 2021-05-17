import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;

  Result(this.score);

  String get resultPhrase {
    if (score < 8) {
      return 'Boa!';
    } else if (score < 12) {
      return 'Que cara bom!';
    } else if (score < 16) {
      return 'Ora mas veja só...';
    } else {
      return 'Ora Ora Temos um Sheroque Holmes aqui!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(resultPhrase, style: TextStyle(fontSize: 29)),
    );
  }
}
