import 'package:flutter/material.dart';
import 'package:toeic/src/app_resources.dart';

class Scoring extends StatelessWidget {
  const Scoring(
      {super.key,
      this.scoringKey = '',
      this.scoringContent = '',
      this.guideToAnswer = ''});

  final String scoringKey;
  final String scoringContent;
  final String guideToAnswer;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('\n1. Scoring', style: AppResources.text_styles.h5),
        Text(
          scoringKey,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
        ),
        Text(
          scoringContent,
          style: const TextStyle(fontSize: 18),
        ),
        Text('\n2. Guide to answer', style: AppResources.text_styles.h5),
        Text(
          guideToAnswer,
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
