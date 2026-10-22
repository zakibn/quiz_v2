import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/quiz_controller.dart';
import '../../core/Constant/app_routes.dart';

class ResultScreen extends GetView<QuizController> {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz Result')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              final percentage =
                  controller.questions.isEmpty
                      ? 0
                      : (controller.score.value /
                              controller.questions.length *
                              100)
                          .round();

              return Text(
                'Your score: ${controller.score.value} '
                '/ ${controller.questions.length}\n'
                'Percentage: $percentage%',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              );
            }),
            Obx(() {
              final percentage =
                  controller.questions.isEmpty
                      ? 0
                      : (controller.score.value /
                              controller.questions.length *
                              100)
                          .round();

              String message;

              if (percentage == 100) {
                message = 'Excellent! Perfect score!';
              } else if (percentage >= 70) {
                message = 'Great job! Keep it up!';
              } else if (percentage >= 50) {
                message = 'Good effort! You can do better!';
              } else {
                message = 'Keep practicing! Never give up!';
              }

              return Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              );
            }),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            Obx(
              () => SizedBox(
                width: 250,
                child: LinearProgressIndicator(
                  value:
                      controller.questions.isEmpty
                          ? 0
                          : controller.score.value /
                              controller.questions.length,
                  minHeight: 12,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.restartQuiz();
                Get.offNamed(AppRoutes.quiz);
              },
              child: const Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
