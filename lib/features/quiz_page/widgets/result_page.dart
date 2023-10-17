import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/features/home/home_page.dart';
import 'package:quiz_app/features/quiz_page/cubit/quiz_cubit.dart';
import 'package:quiz_app/shared/widgets/primary_button.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key, required this.result}) : super(key: key);
  final List<bool> result;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 6,
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              width: double.maxFinite,
              child: Lottie.asset("assets/result_lottie.json",
                  fit: BoxFit.fitWidth)),
          RatingBarIndicator(
            rating:
                result.where((element) => element == true).length.toDouble(),
            itemBuilder: (context, index) => const Icon(
              Icons.star_rate_rounded,
              color: Colors.amber,
            ),
            itemCount: 5,
            itemSize: 50.0,
            direction: Axis.horizontal,
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
                "Correct answers : ${result.where((element) => element == true).length}"),
          ),
          const SizedBox(
            height: 30,
          ),
          PrimaryButton(
            text: "Back to home",
            onTap: () {
              context.read<QuizCubit>().backToHome();
              Navigator.popUntil(context,
                  (route) => route.settings.name == HomePage.routeName);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Share.share(
                  "Hi, I got ${result.where((element) => element == true).length} question(s) correct! Now it's your turn to play.");
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.share,
                  color: Color.fromARGB(255, 137, 136, 124),
                  size: 40,
                ),
                Text("Share your score")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
