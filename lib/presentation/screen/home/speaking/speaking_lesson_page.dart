

import 'package:flutter/material.dart';
import 'package:toeic/presentation/screen/home/widget/lesson_page.dart';
import 'package:toeic/src/app_resources.dart';

class SpeakingLessonPage extends LessonPage {
  const SpeakingLessonPage(
  {super.key,
  this.title = '',
  this.heroId = '',
  this.child,
  });

  final String title;
  final String heroId;
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
              child: Hero(
                  tag: heroId, child: Image.asset(AppResources.images.book)))
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