import 'package:cloud_firestore/cloud_firestore.dart';

class TopicModel {
  final String title;
  final String id;
  final String imageUrl;

  const TopicModel({required this.title, required this.id, this.imageUrl = ""});

  factory TopicModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return TopicModel(
        title: data['title'], id: data['id'], imageUrl: data['imageUrl']);
  }
}
