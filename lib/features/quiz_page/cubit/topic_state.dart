part of 'topic_cubit.dart';

sealed class TopicState extends Equatable {
  const TopicState();

  @override
  List<Object> get props => [];
}

final class TopicInitial extends TopicState {}

final class TopicLoading extends TopicState {}

final class TopicSuccess extends TopicState {
  final List<TopicModel> topicData;

  const TopicSuccess({required this.topicData});

  @override
  // TODO: implement props
  List<Object> get props => [topicData];
}

final class TopicFailed extends TopicState {
  final String message;

  const TopicFailed({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
