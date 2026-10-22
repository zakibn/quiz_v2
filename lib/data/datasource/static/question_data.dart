import '../../model/question_model.dart';

const List<QuestionModel> questionData = [
  QuestionModel(
    id: 1,
    question: 'What is the best state management?',
    answer: 1,
    options: ['Bloc', 'GetX', 'Provider', 'Riverpod'],
  ),
  QuestionModel(
    id: 2,
    question: 'Which language is used by Flutter?',
    answer: 0,
    options: ['Dart', 'Java', 'PHP', 'Python'],
  ),
  QuestionModel(
    id: 3,
    question: 'Which widget displays a list of items?',
    answer: 2,
    options: ['Container', 'Row', 'ListView', 'Stack'],
  ),
];
