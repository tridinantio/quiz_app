import 'package:flutter/material.dart';
import 'package:quiz_app/features/home/home_page.dart';
import 'package:quiz_app/features/quiz_page/views/quiz_page.dart';
import 'package:quiz_app/theme_manager/theme_data_manager.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      theme: getApplicationThemeData(),
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        QuizPage.routeName: (context) => const QuizPage()
      },
    );
  }
}
