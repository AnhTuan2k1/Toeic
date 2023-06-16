import 'package:flutter/material.dart';
import 'package:toeic/presentation/screen/home/speaking/process.dart';
import 'package:toeic/presentation/screen/home/speaking/scoring.dart';
import 'package:toeic/presentation/screen/home/widget/lesson.dart';
import 'package:toeic/presentation/screen/home/widget/part_card.dart';
import 'package:toeic/presentation/screen/home/writing/lesson_content_writing.dart';
import 'package:toeic/presentation/screen/home/writing/writing_lesson_page.dart';
import 'package:toeic/src/app_resources.dart';

class WritingPage extends StatelessWidget {
  const WritingPage({super.key});

  static const String title = "Writing";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        child: Container(
          //color: Colors.green,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.03),
              _Question15(),
              _Question67(),
              _Question8(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Question15 extends StatelessWidget {
  const _Question15({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PartCard(
      imagePath: AppResources.images.home_part1,
      title: "Question 1->5",
      content: "Write a sentence based on a picture",
      child: Column(
        children: [
          Lesson(
            id: '1',
            lessonPage: WritingLessonPage(
              title: 'Process',
              heroId: '_Question12_lesson1',
              child: Process(
                titles: [
                  '1. Màn hình hiển thị đoạn văn hướng dẫn',
                  '2. Màn hình câu số 2',
                  '3. Màn hình câu số 5'
                ],
                images: [
                  AppResources.images.writing_q15_process1,
                  AppResources.images.writing_q15_process2,
                  AppResources.images.writing_q15_process3,
                ],
                contents: [
                  LessonContentWriting.question15.lesson11_VN,
                  LessonContentWriting.question15.lesson12_VN,
                  LessonContentWriting.question15.lesson13_VN
                ],
              ),
            ),
          ),
          Lesson(
            id: '2',
            lessonPage: WritingLessonPage(
              title: 'Scoring & Guide to answer',
              heroId: '_Question12_lesson2',
              child: Scoring(
                scoringKey: LessonContentWriting.question15.lesson21_VN,
                scoringContent: LessonContentWriting.question15.lesson22_VN,
                guideToAnswer: LessonContentWriting.question15.lesson23_VN,
              ),
            ),
          ),
          const _Question15Test()
        ],
      ),
    );
  }
}

class _Question15Test extends StatelessWidget {
  const _Question15Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: []);
  }
}

class _Question67 extends StatelessWidget {
  const _Question67({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PartCard(
      imagePath: AppResources.images.writing_q67,
      title: "Question 6->7",
      content: "respond to a written request",
      child: Column(
        children: [
          Lesson(
            id: '1',
            lessonPage: WritingLessonPage(
              title: 'Process',
              heroId: '_Question67_lesson1',
              child: Process(
                titles: [
                  '1. Màn hình hiển thị đoạn văn hướng dẫn',
                  '2. Màn hình câu số 6',
                ],
                images: [
                  AppResources.images.writing_q67_process1,
                  AppResources.images.writing_q67_process2,
                ],
                contents: [
                  LessonContentWriting.question67.lesson11_VN,
                  LessonContentWriting.question67.lesson12_VN
                ],
              ),
            ),
          ),
          Lesson(
            id: '2',
            lessonPage: WritingLessonPage(
              title: 'Scoring & Guide to answer',
              heroId: '_Question67_lesson2',
              child: Scoring(
                scoringKey: LessonContentWriting.question67.lesson21_VN,
                scoringContent: LessonContentWriting.question67.lesson22_VN,
                guideToAnswer: LessonContentWriting.question67.lesson23_VN,
              ),
            ),
          ),
          const _Question67Test()
        ],
      ),
    );
  }
}

class _Question67Test extends StatelessWidget {
  const _Question67Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: []);
  }
}

class _Question8 extends StatelessWidget {
  const _Question8({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PartCard(
      imagePath: AppResources.images.writing_q8,
      title: "Question 8",
      content: "Write a opinion essay",
      child: Column(
        children: [
          Lesson(
            id: '1',
            lessonPage: WritingLessonPage(
              title: 'Process',
              heroId: '_Question8_lesson1',
              child: Process(
                titles: [
                  '1. Màn hình hiển thị đoạn văn hướng dẫn',
                  '2. Màn hình câu số 8'
                ],
                images: [
                  AppResources.images.writing_q8_process1,
                  AppResources.images.writing_q8_process2
                ],
                contents: [
                  LessonContentWriting.question8.lesson11_VN,
                  LessonContentWriting.question8.lesson12_VN
                ],
              ),
            ),
          ),
          Lesson(
            id: '2',
            lessonPage: WritingLessonPage(
              title: 'Scoring & Guide to answer',
              heroId: '_Question8_lesson2',
              child: Scoring(
                scoringKey: LessonContentWriting.question8.lesson21_VN,
                scoringContent: LessonContentWriting.question8.lesson22_VN,
                guideToAnswer: LessonContentWriting.question8.lesson23_VN,
              ),
            ),
          ),
          const _Question8Test()
        ],
      ),
    );
  }
}

class _Question8Test extends StatelessWidget {
  const _Question8Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: []);
  }
}
