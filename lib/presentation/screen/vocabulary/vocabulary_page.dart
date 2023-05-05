

import 'package:flutter/material.dart';

import '../../../src/app_resources.dart';

class VocabularyPage extends StatelessWidget {
  const VocabularyPage({super.key});
  static const String title = "Vobucalory";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          //color: Colors.green,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppResources.text_styles.h1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}