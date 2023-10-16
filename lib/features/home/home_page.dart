import 'package:flutter/material.dart';
import 'package:quiz_app/features/quiz_page/views/quiz_page.dart';
import 'package:share_plus/share_plus.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static String routeName = "/home-page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: SizedBox(
              child: Icon(
                Icons.lightbulb,
                color: Color.fromARGB(255, 245, 225, 48),
                size: 200,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, QuizPage.routeName);
              },
              child: const Text("Start Quiz")),
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
      )),
    );
  }
}
