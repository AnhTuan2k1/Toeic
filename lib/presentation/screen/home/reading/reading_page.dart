import 'package:flutter/material.dart';

import '../../../../src/app_resources.dart';
import '../part_card.dart';


class ReadingPage extends StatelessWidget {
  const ReadingPage({super.key});
  static const String title = "Reading";

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
                imagePath: AppResources.images.reading_part5,
                title: "Part5",
                content: "Tranh\nGồm ",
              ),
              PartCard(
                imagePath: AppResources.images.reading_part6,
                title: "Part6",
                content: "Tranh\nGồm ",
              ),
              PartCard(
                imagePath: AppResources.images.reading_part7,
                title: "Part7",
                content: "Tranh\nGồm ",
              ),
              PartCard(
                imagePath: AppResources.images.reading_part8,
                title: "Part8",
                content: "Tranh\nGồm ",
              ),
            ],
          ),
        ),
      ),
    );
  }
}