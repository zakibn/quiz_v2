import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/quiz_controller.dart';

class ReviewScreen extends GetView<QuizController> {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Answer Review')),
      body: ListView.builder(
        itemCount: controller.questions.length,
        itemBuilder: (context, index) {
          final question = controller.questions[index];

          final userAnswerIndex = controller.userAnswers[question.id];

          final userAnswer =
              userAnswerIndex == null
                  ? 'Not answered'
                  : question.options[userAnswerIndex];
          final isCorrect = userAnswerIndex == question.answer;
          final correctAnswer = question.options[question.answer];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: Icon(
                isCorrect ? Icons.check_circle : Icons.cancel,
                color: isCorrect ? Colors.green : Colors.red,
              ),
              title: Text('${index + 1}. ${question.question}'),

              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your answer: $userAnswer',
                    style: TextStyle(
                      color: isCorrect ? Colors.green : Colors.red,
                    ),
                  ),
                  Text(
                    'Correct answer: $correctAnswer',
                    style: const TextStyle(color: Colors.green),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
