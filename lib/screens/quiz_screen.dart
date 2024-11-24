import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;

  final List<Map<String, Object>> _questions = [
    {
      'question': 'What is the capital of France?',
      'options': ['Paris', 'London', 'Berlin', 'Madrid'],
      'answer': 'Paris',
    },
    {
      'question': 'What is 5 + 3?',
      'options': ['5', '8', '9', '7'],
      'answer': '8',
    },
  ];

  void _answerQuestion(String selectedAnswer) {
    if (_questions[_currentQuestionIndex]['answer'] == selectedAnswer) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Correct!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Wrong!')),
      );
    }
    setState(() {
      _currentQuestionIndex =
          (_currentQuestionIndex + 1) % _questions.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _questions[_currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(title: Text('Quiz App')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion['question'] as String,
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          ...((currentQuestion['options'] as List<String>).map((option) {
            return ElevatedButton(
              onPressed: () => _answerQuestion(option),
              child: Text(option),
            );
          }).toList()),
        ],
      ),
    );
  }
}
