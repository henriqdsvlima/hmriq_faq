import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final void Function() onRestartFaq;

  Result(this.score, this.onRestartFaq);

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
    return Column(
      children: [
        Center(
          child: Text(resultPhrase, style: TextStyle(fontSize: 29)),
        ),
        TextButton(
          onPressed: onRestartFaq,
          child: Text('Reiniciar?'),
        )
      ],
    );
  }
}
