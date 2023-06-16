import 'package:flutter/material.dart';
import 'package:toeic/src/app_resources.dart';

class Summary extends StatelessWidget {
  const Summary({super.key, this.summary = '', this.problem = ''});

  final String summary;
  final String problem;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('\n1. Summary', style: AppResources.text_styles.h5),
        Text(
          summary,
          style: const TextStyle(fontSize: 18),
        ),
        Text('\n2. Problem in the actual test',
            style: AppResources.text_styles.h5),
        Text(
          problem,
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
