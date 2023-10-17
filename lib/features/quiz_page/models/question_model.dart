import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionModel {
  final String topic;
  final String question;
  final List<dynamic> options;
  final int correctAnswerIndex;
  final String image;

  const QuestionModel(
      {this.topic = "",
      required this.correctAnswerIndex,
      required this.question,
      required this.options,
      this.image = ""});

  factory QuestionModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return QuestionModel(
        correctAnswerIndex: data['correctOption'],
        question: data['questionText'],
        options: data['options'],
        image: data['image'] ?? "");
  }
}
