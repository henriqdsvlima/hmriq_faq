import 'package:faq_rique/answer.dart';
import 'package:faq_rique/question.dart';
import 'package:flutter/material.dart';

main() {
  runApp(new PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  // final List<Map<String, Object>> questions = [
  final _questions = const [
    {
      'texto': 'Qual é a minha cor favorita?',
      'resposta': ['Azul', 'Preto', 'Marrom', 'Cinza'],
    },
    {
      'texto': 'Qual a minha banda favorita?',
      'resposta': [
        'Death cab for cutie',
        'Bon iver',
        'American Football',
        'The Kooks'
      ],
    },
    {
      'texto': 'Qual animal favorito?',
      'resposta': ['Elefante', 'Baleia', 'Cachorro', 'Aranha'],
    },
  ];
  var _questionSelected = 0;

  void _answer() {
    if (isThisQuestionSelected) {
      setState(() {
        _questionSelected++;
      });
      print(_questionSelected);
    }
  }

  bool get isThisQuestionSelected {
    return _questionSelected < _questions.length;
  }

  final colors = [
    Color(0xff8a2bce),
  ];

  @override
  Widget build(BuildContext context) {
    //declarativo

    List<String> answers = isThisQuestionSelected
        ? _questions[_questionSelected]['resposta']
        : null;
    //pega as respostas, converte a lista de strings para lista de widgets e uma vez convertendo pra widgets converte o resultado  do map em uma lista

    //imperativo
    // for (String answerText in answers) {
    //   answersList.add(Answer(answerText, _answer));
    // }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: colors[0],
          title: Text('PR-HMRIQ'),
        ),
        body: isThisQuestionSelected
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Question(_questions[_questionSelected]['texto']),
                  ...answers
                      .map((text) => Answer(text, _answer))
                      .toList(), // essas reticencias vão fazer com que a lista seja adicionada na outra lista
                ],
              )
            : Center(
                child: Text('Parabens!', style: TextStyle(fontSize: 29)),
              ),
      ),
    );
  }
}
