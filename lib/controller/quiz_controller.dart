import 'package:get/get.dart';

import '../data/datasource/static/question_data.dart';
import '../data/model/question_model.dart';

class QuizController extends GetxController {
  final List<QuestionModel> questions = questionData;

  //int currentQuestionIndex = 0;
  final RxInt currentQuestionIndex = 0.obs;

  final RxnInt selectedAnswer = RxnInt();

  final RxBool hasAnswered = false.obs;

  final RxInt score = 0.obs;

  String get currentQuestion {
    return questions[currentQuestionIndex.value].question;
  }

  void nextQuestion() {
    if (currentQuestionIndex.value < questions.length - 1) {
      currentQuestionIndex.value++;
      selectedAnswer.value = null;
      hasAnswered.value = false;
    }
  }

  // منع المستخدم من الانتقال إلى السؤال التالي إذا وصل إلى آخر سؤال، ومعرفة متى انتهى الاختبار
  bool get isLastQuestion {
    return currentQuestionIndex.value == questions.length - 1;
  }

  // إنشاء دالة لاختيار الإجابة

  void selectAnswer(int index) {
    if (hasAnswered.value) {
      return;
    }

    selectedAnswer.value = index;
  }

  void confirmAnswer() {
    if (selectedAnswer.value == null || hasAnswered.value) {
      return;
    }

    hasAnswered.value = true;

    final currentQuestion = questions[currentQuestionIndex.value];

    if (selectedAnswer.value == currentQuestion.answer) {
      score.value++;
    }
  }

  bool get isCorrectAnswer {
    return selectedAnswer.value == questions[currentQuestionIndex.value].answer;
  }

  void restartQuiz() {
    currentQuestionIndex.value = 0;
    selectedAnswer.value = null;
    hasAnswered.value = false;
    score.value = 0;
  }
}
