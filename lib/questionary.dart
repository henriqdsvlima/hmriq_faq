import 'package:flutter/material.dart';

import 'package:faq_rique/answer.dart';
import 'package:faq_rique/question.dart';

class Questionary extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionSelected;
  final void Function(int) answerOk;

  Questionary({
    @required this.questions,
    @required this.questionSelected,
    @required this.answerOk,
  });

  bool get temPerguntaSelecionada {
    return questionSelected < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? questions[questionSelected]['respostas']
        : null;

    return Column(
      children: <Widget>[
        Question(questions[questionSelected]['texto']),
        ...respostas.map((answ) {
          return Answer(
            answ['texto'],
            () => answerOk(answ['pontuacao']),
          );
        }).toList(),
      ],
    );
  }
}
