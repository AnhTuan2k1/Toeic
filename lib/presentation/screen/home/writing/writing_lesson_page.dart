

import 'package:flutter/material.dart';
import 'package:toeic/presentation/screen/home/widget/lesson_page.dart';
import 'package:toeic/src/app_resources.dart';

class WritingLessonPage extends LessonPage {
  const WritingLessonPage(
  {super.key,
  this.title = '',
  this.child,
  });

  final String title;
  final Widget? child;

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
            child: child,
          ),
        ),
      ),
    );
  }
}