import 'package:flutter/material.dart';
import 'package:toeic/src/app_resources.dart';

class LessonPage extends StatelessWidget {
  const LessonPage(
  {super.key,
  this.content = const ['', ''],
  this.title = ''});

  final String title;
  final List<String> content;

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
              child: Image.asset(AppResources.images.book))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child:
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('\n1. Question Type', style: AppResources.text_styles.h4),
              Text('\n${content[0]}', style: AppResources.text_styles.content,),
              Text('\n\n2. Guide to answer', style: AppResources.text_styles.h4),
              Text('\n${content[1]}', style: AppResources.text_styles.content,)
            ]),
          ),
        ),
      ),
    );
  }
}
