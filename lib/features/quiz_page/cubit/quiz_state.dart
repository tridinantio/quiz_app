part of 'quiz_cubit.dart';

sealed class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object> get props => [];
}

final class QuizInitial extends QuizState {}

final class QuizAnswered extends QuizState {
  final int currentQuestion;

  const QuizAnswered({required this.currentQuestion});

  @override
  // TODO: implement props
  List<Object> get props => [currentQuestion];
}

final class QuizCompleted extends QuizState {
  final List<bool> results;

  const QuizCompleted({required this.results});

  @override
  // TODO: implement props
  List<Object> get props => [results];
}

final class QuizFetchSuccess extends QuizState {
  final List<QuestionModel> indonesiaQuestionData;
  final List<QuestionModel> animalQuestionData;
  final List<QuestionModel> worldQuestionData;
  final List<QuestionModel> foodQuestionData;

  const QuizFetchSuccess(
      {required this.indonesiaQuestionData,
      required this.animalQuestionData,
      required this.worldQuestionData,
      required this.foodQuestionData});

  @override
  // TODO: implement props
  List<Object> get props => [
        indonesiaQuestionData,
        animalQuestionData,
        worldQuestionData,
        foodQuestionData
      ];
}

final class QuizFetchFailed extends QuizState {
  final String message;

  const QuizFetchFailed({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
