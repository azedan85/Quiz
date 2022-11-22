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
  int _deg = 0;
  int _idx = 0;

  final List _questions = [
    {
      'quest': 'What\'s your name ?',
      'answar': [
        {'a': 'Ahmed', 'd': 10},
        {'a': 'Mohamed', 'd': 0},
        {'a': 'Ali', 'd': 0},
      ]
    },
    {
      'quest': 'How old are you ?',
      'answar': [
        {'a': '40', 'd': 10},
        {'a': '60', 'd': 0},
        {'a': '30', 'd': 0},
      ]
    },
    {
      'quest': 'What\'s your faveort color ?',
      'answar': [
        {'a': 'Red', 'd': 10},
        {'a': 'Green', 'd': 0},
        {'a': 'Pink', 'd': 0},
      ]
    },
    {
      'quest': 'What\'s your faveort anaimal ?',
      'answar': [
        {'a': 'Lion', 'd': 10},
        {'a': 'Elephant', 'd': 0},
        {'a': 'Monky', 'd': 0},
      ]
    },
  ];

  void questionAnswar(int cont) {
    if ((_idx + 1) < _questions.length) {
      setState(() {
        _idx += 1;
        _deg += cont;
      });
    } else {
      setState(() {
        _idx = 0;
        _deg = 0;
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
              Questions(_questions[_idx]['quest']),
              ...(_questions[_idx]['answar'] as List).map((ans) {
                return Answar(() => questionAnswar(ans['d']), ans['a']);
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
