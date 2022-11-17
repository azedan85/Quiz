import 'package:flutter/material.dart';
import 'questions.dart';
import 'answar.dart';

void main() {
  runApp(const QuizzApp());
}

class QuizzApp extends StatefulWidget {
  const QuizzApp({Key? key}) : super(key: key);

  @override
  State<QuizzApp> createState() => _QuizzAppState();
}

class _QuizzAppState extends State<QuizzApp> {
  int _idx = 0;

  final List<String> _questions = [
    'What\'s your name ?',
    'How old are you ?',
    'What\'s your faveort color ?',
    'What\'s your faveort anaimal ?'
  ];

  final List _answard = [
    ['Ahmed', 'Mohamed', 'Ali'],
    ['40', '30', '60'],
    ['Red', 'Green', 'Pink'],
    ['Lion', 'Elephant', 'Monky']
  ];

  void questionAnswar() {
    if ((_idx + 1) < _questions.length) {
      setState(() {
        _idx += 1;
      });
    } else {
      setState(() {
        _idx = 0;
      });
    }
    // print('clicked $_idx');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizz',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('QUIZ'),
        ),
        body: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Questions(_questions[_idx]),
              Answar(questionAnswar, _answard[_idx][0]),
              Answar(questionAnswar, _answard[_idx][1]),
              Answar(questionAnswar, _answard[_idx][2]),
            ],
          ),
        ),
      ),
    );
  }
}
