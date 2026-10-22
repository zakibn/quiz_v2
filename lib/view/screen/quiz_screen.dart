import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/quiz_controller.dart';
import '../../core/Constant/app_routes.dart';

class QuizScreen extends GetView<QuizController> {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz')),
      body: Center(
        child: /* Text(
          // controller.questions[0].question,  1
          // controller.questions[controller.currentQuestionIndex].question, 2
          controller.currentQuestion, 3
        ), */
        // Obx(() => Text(controller.currentQuestion)), 4
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Obx(() => Text(controller.currentQuestion)), 5
            /*  Obx(
              () => ElevatedButton(
                onPressed:
                    controller.isLastQuestion ? null : controller.nextQuestion,
                child: Text(controller.isLastQuestion ? 'Finish' : 'Next'),
              ),
            ), */
            Obx(
              () => Text(
                'Question ${controller.currentQuestionIndex.value + 1} '
                'of ${controller.questions.length}',
              ),
            ),
            const SizedBox(height: 12),

            Obx(
              () => LinearProgressIndicator(
                value:
                    (controller.currentQuestionIndex.value + 1) /
                    controller.questions.length,
                minHeight: 8,
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            const SizedBox(height: 20),
            Obx(
              () => Text(
                controller.currentQuestion,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 20),
            Obx(
              () => Text(
                'Score: ${controller.score.value}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Obx(
              () => Column(
                children: List.generate(
                  controller
                      .questions[controller.currentQuestionIndex.value]
                      .options
                      .length,
                  (index) {
                    final option =
                        controller
                            .questions[controller.currentQuestionIndex.value]
                            .options[index];

                    return ListTile(
                      //title: Text(option),
                      title: Text(
                        option,
                        style: TextStyle(
                          color:
                              controller.selectedAnswer.value == index
                                  ? Colors.blue
                                  : Colors.black,
                        ),
                      ),
                      onTap:
                          controller.hasAnswered.value
                              ? null
                              : () => controller.selectAnswer(index),
                    );
                  },
                ),
              ),
            ),

            Obx(
              () => ElevatedButton(
                onPressed:
                    controller.hasAnswered.value
                        ? null
                        : controller.confirmAnswer,
                child: const Text('Confirm Answer'),
              ),
            ),
            Obx(() {
              if (!controller.hasAnswered.value) {
                return const SizedBox.shrink();
              }

              final correctAnswer =
                  controller
                      .questions[controller.currentQuestionIndex.value]
                      .options[controller
                      .questions[controller.currentQuestionIndex.value]
                      .answer];

              return Column(
                children: [
                  Text(
                    controller.isCorrectAnswer
                        ? 'Correct answer!'
                        : 'Wrong answer!',
                    style: TextStyle(
                      color:
                          controller.isCorrectAnswer
                              ? Colors.green
                              : Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (!controller.isCorrectAnswer)
                    Text('Correct answer: $correctAnswer'),
                ],
              );
            }),

            const SizedBox(height: 20),
            Obx(
              () => ElevatedButton(
                onPressed:
                    controller.hasAnswered.value
                        ? () {
                          if (controller.isLastQuestion) {
                            Get.toNamed(AppRoutes.result);
                          } else {
                            controller.nextQuestion();
                          }
                        }
                        : null,
                child: Text(controller.isLastQuestion ? 'Finish' : 'Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
