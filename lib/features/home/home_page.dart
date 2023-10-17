import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/features/quiz_page/views/quiz_page.dart';
import 'package:quiz_app/features/quiz_page/views/topic_page.dart';
import 'package:quiz_app/shared/widgets/primary_button.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:developer' as dev;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static String routeName = "/home-page";

  @override
  Widget build(BuildContext context) {
    Random random = Random();

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width: double.maxFinite,
                child: Lottie.asset(
                  'assets/home_lottie.json',
                ),
              ),
            ),
            // const Center(
            //   child: SizedBox(
            //     child: Icon(
            //       Icons.lightbulb,
            //       color: Color.fromARGB(255, 245, 225, 48),
            //       size: 200,
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 20,
            ),
            PrimaryButton(
                text: "Start Quiz",
                onTap: () {
                  int randomNumber = random.nextInt(4);
                  dev.log(randomNumber.toString());
                  Navigator.pushNamed(context, QuizPage.routeName,
                      arguments: randomNumber.toString());
                }),
            const SizedBox(
              height: 12,
            ),
            PrimaryButton(
                text: "Select Topic",
                onTap: () {
                  Navigator.pushNamed(context, TopicPage.routeName);
                }),
            const SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () {
                Share.share(
                    "Hi, I'm using Quiz App to test my skills. You can do it too!");
              },
              child: const Icon(
                Icons.share,
                color: Color.fromARGB(255, 137, 136, 124),
                size: 40,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
