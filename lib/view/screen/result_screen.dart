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
            Obx(
              () => Text(
                'Your score: ${controller.score.value} '
                '/ ${controller.questions.length}',
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
