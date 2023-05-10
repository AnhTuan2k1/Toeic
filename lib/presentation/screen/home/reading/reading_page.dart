import 'package:flutter/material.dart';
import 'package:toeic/presentation/screen/home/widget/lesson.dart';
import 'package:toeic/presentation/screen/home/widget/lesson_page.dart';
import 'package:toeic/presentation/screen/home/widget/test.dart';

import '../../../../src/app_resources.dart';
import '../widget/part_card.dart';


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
              Part5(),
              Part6(),
              Part7(),
              Part8(),
            ],
          ),
        ),
      ),
    );
  }
}

class Part5 extends StatelessWidget {
  const Part5({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PartCard(
      imagePath: AppResources.images.reading_part5,
      title: "Part5",
      content: "Incomplete sentences",
      child: Column(
        children: const [
          Lesson(
            id: '1',
            lessonPage: LessonPage(
              title: 'Part of speech',
              heroId: 'part5_lesson1',
              topic: ['sdagl', '216'],
              content: ['sdhow', '44'],
            ),
          ),
          Lesson(
            id: '2',
            lessonPage: LessonPage(
              title: 'Gerunds & Infinitives',
              heroId: 'part5_lesson2',
              topic: ['sdagl', '216'],
              content: ['sdhow', '44'],
            ),
          ),
          Lesson(
            id: '3',
            lessonPage: LessonPage(
              title: 'Suffixes and Prefixes',
              heroId: 'part5_lesson3',
              topic: ['sdagl', '216'],
              content: ['sdhow', '44'],
            ),
          ),
          Lesson(
            id: '4',
            lessonPage: LessonPage(
              title: 'Pronouns',
              heroId: 'part5_lesson4',
              topic: ['sdagl', '216'],
              content: ['sdhow', '44'],
            ),
          ),
          Test(
            id: '1',
            title: '',
          ),
          Test(
            id: '2',
            title: '',
          ),
        ],
      ),
    );
  }
}

class Part6 extends StatelessWidget {
  const Part6({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PartCard(
      imagePath: AppResources.images.reading_part6,
      title: "Part6",
      content: "Text completion",
      child: Column(
        children: const [
          Lesson(
            id: '1',
            lessonPage: LessonPage(
              title: 'Using context to choose the correct verb form',
              heroId: 'part6_lesson1',
              topic: ['sdagl', '216'],
              content: ['sdhow', '44'],
            ),
          ),
          Lesson(
            id: '2',
            lessonPage: LessonPage(
              title: 'Choosing correct part of speech',
              heroId: 'part6_lesson2',
              topic: ['sdagl', '216'],
              content: ['sdhow', '44'],
            ),
          ),
          Lesson(
            id: '3',
            lessonPage: LessonPage(
              title: 'Using clues to choose correct verb form',
              heroId: 'part6_lesson3',
              topic: ['sdagl', '216'],
              content: ['sdhow', '44'],
            ),
          ),
          Lesson(
            id: '4',
            lessonPage: LessonPage(
              title: 'Prepositions & Conjunctions',
              heroId: 'part6_lesson4',
              topic: ['sdagl', '216'],
              content: ['sdhow', '44'],
            ),
          ),
          Test(
            id: '1',
            title: '',
          ),
          Test(
            id: '2',
            title: '',
          ),
        ],
      ),
    );
  }
}

class Part7 extends StatelessWidget {
  const Part7({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PartCard(
      imagePath: AppResources.images.reading_part7,
      title: "Part7",
      content: "Single Passages",
      child: Column(
        children: const [
          Lesson(
            id: '1',
            lessonPage: LessonPage(
              title: 'Scanning',
              heroId: 'part7_lesson1',
              topic: ['sdagl', '216'],
              content: ['sdhow', '44'],
            ),
          ),
          Lesson(
            id: '2',
            lessonPage: LessonPage(
              title: 'Answering vocabulary question annd inferring the meaning',
              heroId: 'part7_lesson2',
              topic: ['sdagl', '216'],
              content: ['sdhow', '44'],
            ),
          ),
          Lesson(
            id: '3',
            lessonPage: LessonPage(
              title: 'Answering "NOT" questions, question with name, number, date and time',
              heroId: 'part7_lesson3',
              topic: ['sdagl', '216'],
              content: ['sdhow', '44'],
            ),
          ),
          Lesson(
            id: '4',
            lessonPage: LessonPage(
              title: 'Dealing with chart, tables, form and double, triple passages',
              heroId: 'part7_lesson4',
              topic: ['sdagl', '216'],
              content: ['sdhow', '44'],
            ),
          ),
          Test(
            id: '1',
            title: '',
          ),
          Test(
            id: '2',
            title: '',
          ),
        ],
      ),
    );
  }
}

class Part8 extends StatelessWidget {
  const Part8({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PartCard(
      imagePath: AppResources.images.reading_part8,
      title: "Part8",
      content: "Double, Triple Passages",
      child: Column(
        children: const [
          Lesson(
            id: '1',
            lessonPage: LessonPage(
              title: 'Scanning',
              heroId: 'part8_lesson1',
              topic: ['sdagl', '216'],
              content: ['sdhow', '44'],
            ),
          ),
          Lesson(
            id: '2',
            lessonPage: LessonPage(
              title: 'Answering vocabulary question annd inferring the meaning',
              heroId: 'part8_lesson2',
              topic: ['sdagl', '216'],
              content: ['sdhow', '44'],
            ),
          ),
          Lesson(
            id: '3',
            lessonPage: LessonPage(
              title: 'Answering "NOT" questions, question with name, number, date and time',
              heroId: 'part8_lesson3',
              topic: ['sdagl', '216'],
              content: ['sdhow', '44'],
            ),
          ),
          Lesson(
            id: '4',
            lessonPage: LessonPage(
              title: 'Dealing with chart, tables, form and double, triple passages',
              heroId: 'part8_lesson4',
              topic: ['sdagl', '216'],
              content: ['sdhow', '44'],
            ),
          ),
          Test(
            id: '1',
            title: '',
          ),
          Test(
            id: '2',
            title: '',
          ),
        ],
      ),
    );
  }
}