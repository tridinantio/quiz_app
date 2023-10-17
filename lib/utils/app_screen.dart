import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/features/home/home_page.dart';
import 'package:quiz_app/features/quiz_page/cubit/quiz_cubit.dart';
import 'package:quiz_app/features/quiz_page/views/quiz_page.dart';
import 'package:quiz_app/features/quiz_page/views/topic_page.dart';
import 'package:quiz_app/theme_manager/theme_data_manager.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<QuizCubit>().fetchQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      theme: getApplicationThemeData(),
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        QuizPage.routeName: (context) => const QuizPage(),
        TopicPage.routeName: (context) => const TopicPage()
      },
    );
  }
}
