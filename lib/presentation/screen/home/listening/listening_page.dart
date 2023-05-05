import 'package:flutter/material.dart';

import '../../../../src/app_resources.dart';
import '../part_card.dart';

class ListeningPage extends StatelessWidget {
  const ListeningPage({super.key});
  static const String title = "Listening";

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
                imagePath: AppResources.images.home_part1,
                title: "Part 1",
                content: "Tranh\nGồm ",
              ),
              PartCard(
                imagePath: AppResources.images.listening_part2,
                title: "Part 2",
                content: "Tranh\nGồm ",
              ),
              PartCard(
                imagePath: AppResources.images.listening_part3,
                title: "Part 3",
                content: "Tranh\nGồm ",
              ),
              PartCard(
                imagePath: AppResources.images.listening_part4,
                title: "Part 4",
                content: "Tranh\nGồm ",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
