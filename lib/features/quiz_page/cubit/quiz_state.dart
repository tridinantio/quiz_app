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
