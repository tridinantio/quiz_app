import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_app/features/quiz_page/models/topic_model.dart';
import 'package:quiz_app/features/quiz_page/services/topic_services.dart';

part 'topic_state.dart';

class TopicCubit extends Cubit<TopicState> {
  TopicCubit() : super(TopicInitial());

  late List<TopicModel> currentTopics = [];

  Future<void> sortTopic() async {
    log("Sort");

    currentTopics = List.from(currentTopics.reversed);
    log(currentTopics[0].title);
    emit(TopicSuccess(topicData: currentTopics));
  }

  Future<void> searchTopic(String text) async {
    if (text.isEmpty) {
      emit(TopicSuccess(topicData: currentTopics));
    } else {
      log("search");

      List<TopicModel> searchedTopics = List.from(currentTopics.where(
          (element) =>
              element.title.toLowerCase().contains(text.toLowerCase())));
      log(currentTopics[0].title);
      emit(TopicSuccess(topicData: searchedTopics));
    }
  }

  Future<void> fetchAllTopics() async {
    try {
      emit(TopicLoading());
      List<TopicModel> topicData = await TopicServices().fetchAllTopics();
      currentTopics = topicData;

      emit(TopicSuccess(topicData: topicData));
    } catch (e) {
      emit(TopicFailed(message: e.toString()));
    }
  }
}
