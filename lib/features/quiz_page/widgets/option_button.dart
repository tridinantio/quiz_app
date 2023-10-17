import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  const OptionButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                backgroundColor: const Color.fromARGB(255, 15, 55, 87)),
            onPressed: onTap,
            child: Text(text)));
  }
}
