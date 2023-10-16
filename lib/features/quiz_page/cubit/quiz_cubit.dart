import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());

  int currentQuestion = 0;

  List<bool> results = [];

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

  void backToHome() {
    currentQuestion = 0;
    results.clear();
    lastQuestion = false;
    emit(QuizInitial());
  }
}
