import 'package:flutter/material.dart';

import 'package:faq_rique/answer.dart';
import 'package:faq_rique/question.dart';

class Questionary extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionSelected;
  final void Function() answerOk;

  bool get isThisQuestionSelected {
    return questionSelected < questions.length;
  }

  Questionary({
    @required this.questionSelected,
    @required this.answerOk,
    @required this.questions,
  });

  @override
  Widget build(BuildContext context) {
    List<String> answers =
        isThisQuestionSelected ? questions[questionSelected]['resposta'] : null;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Question(questions[questionSelected]['texto']),
        ...answers
            .map((text) => Answer(text, answerOk))
            .toList(), // essas reticencias vão fazer com que a lista seja adicionada na outra lista
      ],
    );
  }
}
