// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/features/quiz_page/cubit/quiz_cubit.dart';

class AnswerButton extends StatefulWidget {
  const AnswerButton(
      {Key? key,
      required this.text,
      required this.answerIndex,
      required this.correctAnswerIndex,
      this.lastQuestion = false})
      : super(key: key);
  final String text;
  final int answerIndex;
  final int correctAnswerIndex;
  final bool lastQuestion;

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            onPressed: () {
              context.read<QuizCubit>().checkAnswer(widget.correctAnswerIndex,
                  widget.answerIndex, widget.lastQuestion);
            },
            child: Text(widget.text)));
  }
}
