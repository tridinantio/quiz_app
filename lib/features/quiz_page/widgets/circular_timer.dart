import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/features/quiz_page/cubit/quiz_cubit.dart';

class CircularTimer extends StatefulWidget {
  const CircularTimer({Key? key, required this.controller}) : super(key: key);
  final CountDownController controller;

  @override
  State<CircularTimer> createState() => _CircularTimerState();
}

class _CircularTimerState extends State<CircularTimer> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizCubit, QuizState>(
      builder: (context, state) {
        if (state is QuizFetchSuccess) {
          return CircularCountDownTimer(
            duration: 30,
            initialDuration: 0,
            controller: widget.controller,
            width: MediaQuery.of(context).size.width / 8,
            height: MediaQuery.of(context).size.height / 8,
            ringColor: Colors.grey[300]!,
            ringGradient: null,
            fillColor: Colors.purpleAccent[100]!,
            fillGradient: null,
            backgroundColor: Colors.purple[500],
            backgroundGradient: null,
            strokeWidth: 5.0,
            strokeCap: StrokeCap.round,
            textStyle: const TextStyle(
                fontSize: 33.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
            textFormat: CountdownTextFormat.S,
            isReverse: true,
            isReverseAnimation: true,
            isTimerTextShown: true,
            autoStart: true,
            onStart: () {
              debugPrint('Countdown Started');
            },
            onComplete: () {
              widget.controller.restart();

              context.read<QuizCubit>().timeOut(false);
            },
            onChange: (String timeStamp) {
              debugPrint('Countdown Changed $timeStamp');
            },
            timeFormatterFunction: (defaultFormatterFunction, duration) {
              if (duration.inSeconds == 0) {
                return "0";
              } else {
                return Function.apply(defaultFormatterFunction, [duration]);
              }
            },
          );
        } else if (state is QuizAnswered) {
          return CircularCountDownTimer(
            duration: 5,
            initialDuration: 0,
            controller: widget.controller,
            width: MediaQuery.of(context).size.width / 8,
            height: MediaQuery.of(context).size.height / 8,
            ringColor: Colors.grey[300]!,
            ringGradient: null,
            fillColor: Colors.purpleAccent[100]!,
            fillGradient: null,
            backgroundColor: Colors.purple[500],
            backgroundGradient: null,
            strokeWidth: 10.0,
            strokeCap: StrokeCap.round,
            textStyle: const TextStyle(
                fontSize: 33.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
            textFormat: CountdownTextFormat.S,
            isReverse: true,
            isReverseAnimation: true,
            isTimerTextShown: true,
            autoStart: true,
            onStart: () {
              debugPrint('Countdown Started');
            },
            onComplete: () {
              widget.controller.restart();

              context.read<QuizCubit>().timeOut(state.currentQuestion ==
                      context.read<QuizCubit>().indonesiaQuestions.length - 1
                  ? true
                  : false);
            },
            onChange: (String timeStamp) {
              debugPrint('Countdown Changed $timeStamp');
            },
            timeFormatterFunction: (defaultFormatterFunction, duration) {
              if (duration.inSeconds == 0) {
                return "0";
              } else {
                return Function.apply(defaultFormatterFunction, [duration]);
              }
            },
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
