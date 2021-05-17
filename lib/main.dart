import 'package:faq_rique/result.dart';

import 'questionary.dart';
import 'package:flutter/material.dart';

main() {
  runApp(new PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  bool get isThisQuestionSelected {
    return _questionSelected < _questions.length;
  }

  // final List<Map<String, Object>> questions = [
  final _questions = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Azul', 'pontuacao': 5},
        {'texto': 'Marrom', 'pontuacao': 3},
        {'texto': 'Cinza', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Baleia', 'pontuacao': 10},
        {'texto': 'Aranha', 'pontuacao': 5},
        {'texto': 'Elefante', 'pontuacao': 3},
        {'texto': 'Leão', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é minha banda favorita?',
      'respostas': [
        {'texto': 'Death Cab For Cutie', 'pontuacao': 10},
        {'texto': 'Bon iver', 'pontuacao': 9},
        {'texto': 'American Football', 'pontuacao': 6},
        {'texto': 'Kings of Convenience', 'pontuacao': 7},
      ],
    }
  ];
  var _questionSelected = 0;
  var _totalScore = 0;

  void _answer(int score) {
    if (isThisQuestionSelected) {
      setState(() {
        _questionSelected++;
        _totalScore += score;
      });
      print(_questionSelected);
    }
  }

  final colors = [
    Color(0xff8a2bce),
  ];

  @override
  Widget build(BuildContext context) {
    //declarativo

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
            ? Questionary(
                questions: _questions,
                questionSelected: _questionSelected,
                answerOk: _answer)
            : Result(_totalScore),
      ),
    );
  }
}
