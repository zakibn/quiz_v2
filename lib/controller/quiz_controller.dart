import 'package:get/get.dart';
import 'dart:async';
import '../data/datasource/static/question_data.dart';
import '../data/model/question_model.dart';
import '../core/Constant/app_routes.dart';

class QuizController extends GetxController {
  final List<QuestionModel> questions = questionData;

  //int currentQuestionIndex = 0;
  final RxInt currentQuestionIndex = 0.obs;

  final RxnInt selectedAnswer = RxnInt();

  final RxBool hasAnswered = false.obs;

  final RxInt score = 0.obs;

  final Map<int, int> userAnswers = {};

  final RxInt remainingSeconds = 5.obs;
  Timer? questionTimer;

  @override
  void onInit() {
    super.onInit();
    startQuestionTimer();
  }

  String get currentQuestion {
    return questions[currentQuestionIndex.value].question;
  }

  void nextQuestion() {
    if (currentQuestionIndex.value < questions.length - 1) {
      currentQuestionIndex.value++;
      selectedAnswer.value = null;
      hasAnswered.value = false;
      startQuestionTimer();
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
    if (selectedAnswer.value == null ||
        hasAnswered.value ||
        userAnswers.containsKey(questions[currentQuestionIndex.value].id)) {
      return;
    }
    questionTimer?.cancel();
    userAnswers[questions[currentQuestionIndex.value].id] =
        selectedAnswer.value!;
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
    questionTimer?.cancel();

    currentQuestionIndex.value = 0;
    selectedAnswer.value = null;
    hasAnswered.value = false;
    score.value = 0;
    userAnswers.clear();

    startQuestionTimer();
  }

  void startQuestionTimer() {
    questionTimer?.cancel();
    remainingSeconds.value = 10;

    questionTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (hasAnswered.value) {
        timer.cancel();
        return;
      }

      if (remainingSeconds.value > 1) {
        remainingSeconds.value--;
      } else {
        timer.cancel();
        remainingSeconds.value = 0;

        if (isLastQuestion) {
          hasAnswered.value = true;
          Get.offNamed(AppRoutes.result);
          return;
        }
        selectedAnswer.value = null;
        nextQuestion();
      }
    });
  }

  @override
  void onClose() {
    questionTimer?.cancel();
    super.onClose();
  }
}
