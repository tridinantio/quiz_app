import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/features/quiz_page/cubit/quiz_cubit.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key, required this.result}) : super(key: key);
  final List<bool> result;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
            "Correct asnwers : ${result.where((element) => element == true).length}"),
        ElevatedButton(
            onPressed: () {
              context.read<QuizCubit>().backToHome();
              Navigator.pop(context);
            },
            child: const Text("Back to home"))
      ],
    );
  }
}
