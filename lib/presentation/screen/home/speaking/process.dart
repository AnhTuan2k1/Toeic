import 'package:flutter/material.dart';

class Process extends StatelessWidget {
  const Process(
      {super.key,
      required this.titles,
      required this.images,
      required this.contents});

  final List<String> titles;
  final List<String> images;
  final List<String> contents;

  @override
  Widget build(BuildContext context) {
    return buildProcess();
  }

  Column buildProcess() {
    List<Widget> list = [];
    for (int i = 0; i < images.length; i++) {
      list.add(const SizedBox(height: 15));
      list.add(Text(titles[i], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),));
      list.add(Image.asset(images[i]));
      list.add(Text(contents[i], style: const TextStyle(fontSize: 16),));
    }
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: list);
  }
}
