import 'package:flutter/material.dart';

import '../../../../src/app_resources.dart';
import '../part_card.dart';


class WritingPage extends StatelessWidget {
  const WritingPage({super.key});
  static const String title = "Writing";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Container(
          //color: Colors.green,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.03),
              PartCard(
                imagePath: AppResources.images.home_part1,
                title: "Question 1->5",
                content: "Write a sentence based on a picture",
              ),
              PartCard(
                imagePath: AppResources.images.writing_q67,
                title: "Question 6->7",
                content: "respond to a written request",
              ),
              PartCard(
                imagePath: AppResources.images.writing_q8,
                title: "Question 8",
                content: "Write a opinion essay",
              ),
            ],
          ),
        ),
      ),
    );
  }
}