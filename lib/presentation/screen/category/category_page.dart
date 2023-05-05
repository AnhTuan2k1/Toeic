import 'package:flutter/material.dart';

import '../../../src/app_resources.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});
  static const String title = "Category";

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