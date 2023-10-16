class QuestionModel {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  const QuestionModel({
    required this.correctAnswerIndex,
    required this.question,
    required this.options,
  });
}
