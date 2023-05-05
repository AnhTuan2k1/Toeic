import 'package:flutter/material.dart';

import '../../../../src/app_resources.dart';
import '../part_card.dart';


class SpeakingPage extends StatelessWidget {
  const SpeakingPage({super.key});
  static const String title = "Speaking";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.03),
              PartCard(
                imagePath: AppResources.images.speaking_q12,
                title: "Question 1->2",
                content: "Read a text aloud",
              ),
              PartCard(
                imagePath: AppResources.images.home_part1,
                title: "Question 3",
                content: "Describe a picture",
              ),
              PartCard(
                imagePath: AppResources.images.speaking_q456,
                title: "Question 4->6",
                content: "Response to question",
              ),
              PartCard(
                imagePath: AppResources.images.speaking_q789,
                title: "Question 7->9",
                content: "Response to question using information provided",
              ),
              PartCard(
                imagePath: AppResources.images.speaking_q10,
                title: "Question 10",
                content: "propose a solution",
              ),
              PartCard(
                imagePath: AppResources.images.speaking_q11,
                title: "Question 11",
                content: "Express an opinion",
              ),
            ],
          ),
        ),
      ),
    );
  }
}