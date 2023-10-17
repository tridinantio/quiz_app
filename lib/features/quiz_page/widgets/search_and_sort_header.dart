import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/features/quiz_page/cubit/topic_cubit.dart';

class SearchAndSortHeader extends StatelessWidget {
  const SearchAndSortHeader({Key? key, required this.searchWordController})
      : super(key: key);
  final TextEditingController searchWordController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            if (searchWordController.text.isEmpty) {
              context.read<TopicCubit>().sortTopic();
            }
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Icon(
              Icons.sort_by_alpha,
              size: 24,
            ),
          ),
        ),
        Flexible(
          child: SearchBar(
            controller: searchWordController,
            hintText: 'Search topic',
            trailing: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  context
                      .read<TopicCubit>()
                      .searchTopic(searchWordController.text);
                },
              ),
            ],
            onSubmitted: (value) {
              context.read<TopicCubit>().searchTopic(searchWordController.text);
            },
            onChanged: (value) {
              context.read<TopicCubit>().searchTopic(searchWordController.text);
            },
          ),
        ),
      ],
    );
  }
}
