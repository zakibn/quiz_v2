/* import 'package:get/get.dart';

import 'core/Constant/app_routes.dart';
import 'view/screen/quiz_screen.dart';

class AppPages {
  static final pages = <GetPage<dynamic>>[
    GetPage(name: AppRoutes.quiz, page: () => const QuizScreen()),
  ];
}
 */

import 'package:get/get.dart';

import 'Binding/quiz_binding.dart';
import 'core/Constant/app_routes.dart';
import 'view/screen/quiz_screen.dart';
import 'view/screen/result_screen.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: AppRoutes.quiz,
    page: () => const QuizScreen(),
    binding: QuizBinding(),
  ),
  GetPage(name: AppRoutes.result, page: () => const ResultScreen()),
];
