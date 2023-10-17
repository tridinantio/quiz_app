import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_app/features/quiz_page/models/question_model.dart';
import 'package:quiz_app/features/quiz_page/services/quiz_services.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());

  int currentQuestion = 0;

  List<bool> results = [];
  List<QuestionModel> indonesiaQuestions = [];
  List<QuestionModel> animalQuestions = [];
  List<QuestionModel> worldQuestions = [];
  List<QuestionModel> foodQuestions = [];

  bool lastQuestion = false;

  void checkAnswer(int correctAnswer, int answer, bool lastQuestion) {
    if (correctAnswer == answer) {
      results.add(true);
      currentQuestion++;

      lastQuestion
          ? emit(QuizCompleted(results: results))
          : emit(QuizAnswered(currentQuestion: currentQuestion));
    } else {
      results.add(false);
      currentQuestion++;
      lastQuestion
          ? emit(QuizCompleted(results: results))
          : emit(QuizAnswered(currentQuestion: currentQuestion));
    }
  }

  void timeOut(bool lastQuestion) {
    results.add(false);
    currentQuestion++;
    log("Timeout count $currentQuestion");

    lastQuestion
        ? emit(QuizCompleted(results: results))
        : emit(QuizAnswered(currentQuestion: currentQuestion));
  }

  Future<void> fetchQuestions() async {
    try {
      emit(QuizInitial());
      indonesiaQuestions = await QuizServices().fetchAllIndoneesiaQuestions();
      animalQuestions = await QuizServices().fetchAllAnimalQuestions();
      worldQuestions = await QuizServices().fetchAllWorldQuestions();
      foodQuestions = await QuizServices().fetchAllFoodQuestions();
      emit(QuizFetchSuccess(
          indonesiaQuestionData: indonesiaQuestions,
          animalQuestionData: animalQuestions,
          worldQuestionData: worldQuestions,
          foodQuestionData: foodQuestions));
    } catch (e) {
      emit(QuizFetchFailed(message: e.toString()));
    }
  }

  void backToHome() {
    currentQuestion = 0;
    results.clear();
    lastQuestion = false;

    emit(QuizFetchSuccess(
        indonesiaQuestionData: indonesiaQuestions,
        animalQuestionData: animalQuestions,
        worldQuestionData: worldQuestions,
        foodQuestionData: foodQuestions));
  }
}
