import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/constants/questions.dart';
import 'package:quiz_app/features/quiz_page/cubit/quiz_cubit.dart';
import 'package:quiz_app/features/quiz_page/widgets/question_card.dart';
import 'package:quiz_app/features/quiz_page/widgets/result_page.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);
  static String routeName = "/quiz-page";

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int? selectedAnswerIndex;
  int questionIndex = 0;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          BlocBuilder<QuizCubit, QuizState>(
            builder: (context, state) {
              if (state is QuizInitial) {
                return QuestionCard(
                  question: questions[0],
                );
              } else if (state is QuizAnswered) {
                return QuestionCard(
                  question: questions[state.currentQuestion],
                  lastQuestion: state.currentQuestion == questions.length - 1
                      ? true
                      : false,
                );
              } else if (state is QuizCompleted) {
                return ResultPage(result: state.results);
              } else {
                return const SizedBox();
              }
            },
          )
        ],
      )),
    );
  }
}
