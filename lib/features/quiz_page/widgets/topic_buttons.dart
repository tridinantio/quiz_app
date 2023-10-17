import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TopicButton extends StatelessWidget {
  const TopicButton(
      {Key? key,
      required this.title,
      required this.imageUrl,
      required this.onTap})
      : super(key: key);
  final String title;
  final String imageUrl;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 6,
            width: double.maxFinite,
            margin: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 25, 95, 151),
                borderRadius: BorderRadius.circular(15)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
              child: Text(
            title,
            style: const TextStyle(
                fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
          )),
        ],
      ),
    );
  }
}
