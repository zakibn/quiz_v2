/* import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/Constant/app_routes.dart';
import 'routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Structure',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.quiz,
      getPages: AppPages.pages,
    );
  }
} */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/Constant/app_routes.dart';
import 'routes.dart';
import 'Binding/quiz_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.quiz,
      initialBinding: QuizBinding(),
      getPages: routes,
    );
  }
}
