import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz_app/features/quiz_page/models/topic_model.dart';

class TopicServices {
  final _db = FirebaseFirestore.instance;

  Future<List<TopicModel>> fetchAllTopics() async {
    final snapshot = await _db.collection('topics').get();
    final topicsData =
        snapshot.docs.map((e) => TopicModel.fromSnapshot(e)).toList();
    log(topicsData.toString());
    return topicsData;
  }
}
