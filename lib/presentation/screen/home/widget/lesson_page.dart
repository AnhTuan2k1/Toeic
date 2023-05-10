import 'package:flutter/material.dart';
import 'package:toeic/src/app_resources.dart';

class LessonPage extends StatelessWidget {
  const LessonPage(
      {super.key,
      this.topic = const [],
      this.content = const [],
      this.title = '',
      this.heroId = ''});

  final String title;
  final List<String> topic;
  final List<String> content;
  final String heroId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(title),
        // elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        actions: [
          Padding(
              padding: EdgeInsets.all(5),
              child: Hero(
                  tag: heroId, child: Image.asset(AppResources.images.book)))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              children: topic
                  .map((t) => Column(
                        children: [
                          Text(t),
                          Text(content.elementAt(topic.indexOf(t)))
                        ],
                      ))
                  .toList()),
        ),
      ),
    );
  }
}
