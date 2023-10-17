import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/features/quiz_page/cubit/quiz_cubit.dart';
import 'package:quiz_app/features/quiz_page/models/question_model.dart';
import 'package:quiz_app/features/quiz_page/widgets/circular_timer.dart';
import 'package:quiz_app/features/quiz_page/widgets/image_card.dart';
import 'package:quiz_app/features/quiz_page/widgets/option_button.dart';

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
  final CountDownController controller = CountDownController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 8,
          ),
          CircularTimer(controller: controller),
          widget.question.image.isNotEmpty
              ? ImageCard(imageUrl: widget.question.image)
              : const SizedBox.shrink(),
          Card(
              elevation: 8,
              shadowColor: const Color.fromARGB(255, 42, 91, 163),
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  widget.question.question,
                  textAlign: TextAlign.center,
                ),
              )),
          const SizedBox(
            height: 12,
          ),
          OptionButton(
              text: widget.question.options[0],
              onTap: () {
                controller.restart();
                context.read<QuizCubit>().checkAnswer(
                    widget.question.correctAnswerIndex, 0, widget.lastQuestion);
              }),
          OptionButton(
              text: widget.question.options[1],
              onTap: () {
                controller.restart();
                context.read<QuizCubit>().checkAnswer(
                    widget.question.correctAnswerIndex, 1, widget.lastQuestion);
              }),
          OptionButton(
              text: widget.question.options[2],
              onTap: () {
                controller.restart();
                context.read<QuizCubit>().checkAnswer(
                    widget.question.correctAnswerIndex, 2, widget.lastQuestion);
              }),
          OptionButton(
              text: widget.question.options[3],
              onTap: () {
                controller.restart();
                context.read<QuizCubit>().checkAnswer(
                    widget.question.correctAnswerIndex, 3, widget.lastQuestion);
              }),
        ],
      ),
    );
  }
}
