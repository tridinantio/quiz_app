import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/features/quiz_page/cubit/topic_cubit.dart';
import 'package:quiz_app/features/quiz_page/views/quiz_page.dart';
import 'package:quiz_app/features/quiz_page/widgets/search_and_sort_header.dart';
import 'package:quiz_app/features/quiz_page/widgets/topic_buttons.dart';

class TopicPage extends StatelessWidget {
  const TopicPage({Key? key}) : super(key: key);
  static String routeName = '/topic-page';

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchWordController = TextEditingController();
    context.read<TopicCubit>().fetchAllTopics();
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(14),
        child: SingleChildScrollView(
          child: BlocBuilder<TopicCubit, TopicState>(
            builder: (context, state) {
              if (state is TopicLoading) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else if (state is TopicSuccess) {
                return Column(
                  children: [
                    SearchAndSortHeader(
                        searchWordController: searchWordController),
                    Column(
                      children: state.topicData
                          .map((data) => TopicButton(
                              title: data.title,
                              imageUrl: data.imageUrl,
                              onTap: () {
                                Navigator.pushNamed(context, QuizPage.routeName,
                                    arguments: data.id);
                              }))
                          .toList(),
                    ),
                  ],
                );
              } else if (state is TopicFailed) {
                return const Center(
                  child:
                      Text("Sorry, there's something wrong with the network"),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      )),
    );
  }
}
