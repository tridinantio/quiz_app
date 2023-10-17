import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/constants/questions.dart';
import 'package:quiz_app/features/quiz_page/cubit/quiz_cubit.dart';
import 'package:quiz_app/features/quiz_page/models/question_model.dart';
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
  List<QuestionModel> currentQuestions = questions;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    //READ ARGUMENTS FROM PREV PAGE
    final args = ModalRoute.of(context)!.settings.arguments;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<QuizCubit, QuizState>(
                builder: (context, state) {
                  if (state is QuizFetchSuccess) {
                    switch (args.toString()) {
                      case "0":
                        currentQuestions = state.indonesiaQuestionData;

                        break;
                      case "1":
                        currentQuestions = state.animalQuestionData;

                        break;
                      case "2":
                        currentQuestions = state.worldQuestionData;

                        break;
                      case "3":
                        currentQuestions = state.foodQuestionData;

                        break;

                      default:
                        currentQuestions = questions;
                    }

                    return QuestionCard(question: currentQuestions[0]);
                    // Text("data");
                  } else if (state is QuizAnswered) {
                    return QuestionCard(
                      question: currentQuestions[state.currentQuestion],
                      lastQuestion: state.currentQuestion ==
                              context
                                      .read<QuizCubit>()
                                      .indonesiaQuestions
                                      .length -
                                  1
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
          ),
        )),
      ),
    );
  }
}
