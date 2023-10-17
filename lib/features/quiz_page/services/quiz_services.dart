import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz_app/features/quiz_page/models/question_model.dart';

class QuizServices {
  final _db = FirebaseFirestore.instance;

  Future<List<QuestionModel>> fetchAllIndoneesiaQuestions() async {
    final snapshot = await _db.collection('indonesia').get();
    final questionsData =
        snapshot.docs.map((e) => QuestionModel.fromSnapshot(e)).toList();
    log(questionsData.toString());
    return questionsData;
  }

  Future<List<QuestionModel>> fetchAllAnimalQuestions() async {
    final snapshot = await _db.collection('animal').get();
    final questionsData =
        snapshot.docs.map((e) => QuestionModel.fromSnapshot(e)).toList();
    log(questionsData.toString());
    return questionsData;
  }

  Future<List<QuestionModel>> fetchAllWorldQuestions() async {
    final snapshot = await _db.collection('world').get();
    final questionsData =
        snapshot.docs.map((e) => QuestionModel.fromSnapshot(e)).toList();
    log(questionsData.toString());
    return questionsData;
  }

  Future<List<QuestionModel>> fetchAllFoodQuestions() async {
    final snapshot = await _db.collection('food').get();
    final questionsData =
        snapshot.docs.map((e) => QuestionModel.fromSnapshot(e)).toList();
    log(questionsData.toString());
    return questionsData;
  }
}
