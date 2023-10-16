import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/features/quiz_page/cubit/quiz_cubit.dart';
import 'package:quiz_app/features/quiz_page/models/question_model.dart';

class QuestionCard extends StatefulWidget {
  const QuestionCard(
      {Key? key, required this.question, this.lastQuestion = false})
      : super(key: key);
  final QuestionModel question;
  final bool lastQuestion;

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(widget.question.question),
          const SizedBox(
            height: 12,
          ),

          // Column(children: questions.map((data) => AnswerButton(text: data.question, answerIndex: data., correctAnswerIndex: data.correctAnswerIndex)).toList();,),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    context.read<QuizCubit>().checkAnswer(
                        widget.question.correctAnswerIndex,
                        0,
                        widget.lastQuestion);
                  },
                  child: Text(widget.question.options[0]))),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    context.read<QuizCubit>().checkAnswer(
                        widget.question.correctAnswerIndex,
                        1,
                        widget.lastQuestion);
                  },
                  child: Text(widget.question.options[1]))),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    context.read<QuizCubit>().checkAnswer(
                        widget.question.correctAnswerIndex,
                        2,
                        widget.lastQuestion);
                  },
                  child: Text(widget.question.options[2]))),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    context.read<QuizCubit>().checkAnswer(
                        widget.question.correctAnswerIndex,
                        3,
                        widget.lastQuestion);
                  },
                  child: Text(widget.question.options[3])))
        ],
      ),
    );
  }
}
