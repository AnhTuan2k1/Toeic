import 'package:flutter/material.dart';
import 'package:toeic/presentation/screen/home/speaking/lesson_content_speaking.dart';
import 'package:toeic/presentation/screen/home/speaking/process.dart';
import 'package:toeic/presentation/screen/home/speaking/scoring.dart';
import 'package:toeic/presentation/screen/home/speaking/speaking_lesson_page.dart';
import 'package:toeic/presentation/screen/home/speaking/summary.dart';
import 'package:toeic/presentation/screen/home/widget/lesson.dart';
import 'package:toeic/presentation/screen/home/widget/part_card.dart';
import 'package:toeic/src/app_resources.dart';

class SpeakingPage extends StatelessWidget {
  const SpeakingPage({super.key});

  static const String title = "Speaking";

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.03),
              _Question12(),
              _Question34(),
              _Question57(),
              _Question810(),
              _Question11()
            ],
          ),
        ),
      ),
    );
  }
}

class _Question12 extends StatelessWidget {
  const _Question12({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PartCard(
      imagePath: AppResources.images.speaking_q12,
      title: "Question 1->2",
      content: "Read a text aloud",
      child: Column(
        children: [
          Lesson(
            id: '1',
            lessonPage: SpeakingLessonPage(
              title: 'Process',
              heroId: '_Question12_lesson1',
              child: Process(
                titles: const [
                  '1. Màn hình hiển thị đoạn văn hướng dẫn',
                  '2. Màn hình trả lời câu số 1 - 45s',
                  '3. Màn hình chuẩn bị câu số 2 - 45s',
                ],
                images: [
                  AppResources.images.speaking_q12_process1,
                  AppResources.images.speaking_q12_process2,
                  AppResources.images.speaking_q12_process3,
                ],
                contents: [
                  LessonContentSpeaking.question12.lesson11_VN,
                  LessonContentSpeaking.question12.lesson12_VN,
                  LessonContentSpeaking.question12.lesson13_VN,
                ],
              ),
            ),
          ),
          Lesson(
            id: '2',
            lessonPage: SpeakingLessonPage(
              title: 'Scoring & Guide to answer',
              heroId: '_Question12_lesson2',
              child: Scoring(
                scoringKey: '• pronunciation • intonation and stress',
                scoringContent: LessonContentSpeaking.question12.lesson21_VN,
                guideToAnswer: LessonContentSpeaking.question12.lesson22_VN,
              ),
            ),
          ),
          Lesson(
            id: '3',
            lessonPage: SpeakingLessonPage(
              title: 'Summary & problems in the actual test',
              heroId: '_Question12_lesson3',
              child: Summary(
                summary: LessonContentSpeaking.question12.lesson31_VN,
                problem: LessonContentSpeaking.question12.lesson32_VN,
              ),
            ),
          ),
          const _Question12Test()
        ],
      ),
    );
  }
}

class _Question12Test extends StatelessWidget {
  const _Question12Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: []);
  }
}

class _Question34 extends StatelessWidget {
  const _Question34({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PartCard(
      imagePath: AppResources.images.home_part1,
      title: "Question 3->4",
      content: "Describe a picture",
      child: Column(
        children: [
          Lesson(
            id: '1',
            lessonPage: SpeakingLessonPage(
              title: 'Process',
              heroId: '_Question34_lesson1',
              child: Process(
                titles: const [
                  '1. Màn hình hiển thị đoạn văn hướng dẫn',
                  '2. Màn hình chuẩn bị miêu tả bức ảnh - 45s',
                  '3. Màn hình trả lời câu số 4 - 30s',
                ],
                images: [
                  AppResources.images.speaking_q34_process1,
                  AppResources.images.speaking_q34_process2,
                  AppResources.images.speaking_q34_process3,
                ],
                contents: [
                  LessonContentSpeaking.question34.lesson11_VN,
                  LessonContentSpeaking.question34.lesson12_VN,
                  LessonContentSpeaking.question34.lesson13_VN,
                ],
              ),
            ),
          ),
          Lesson(
            id: '2',
            lessonPage: SpeakingLessonPage(
              title: 'Scoring & Guide to answer',
              heroId: '_Question34_lesson2',
              child: Scoring(
                scoringKey: '• All criteria in question 1, 2\n• grammar\n• vocabulary\n• cohesion',
                scoringContent: LessonContentSpeaking.question34.lesson21_VN,
                guideToAnswer: LessonContentSpeaking.question34.lesson22_VN,
              ),
            ),
          ),
          Lesson(
            id: '3',
            lessonPage: SpeakingLessonPage(
              title: 'Summary & problems in the actual test',
              heroId: '_Question34_lesson3',
              child: Summary(
                summary: LessonContentSpeaking.question34.lesson31_VN,
                problem: LessonContentSpeaking.question34.lesson32_VN,
              ),
            ),
          ),
          const _Question34Test()
        ],
      ),
    );
  }
}

class _Question34Test extends StatelessWidget {
  const _Question34Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: []);
  }
}

class _Question57 extends StatelessWidget {
  const _Question57({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PartCard(
      imagePath: AppResources.images.speaking_q57,
      title: "Question 5->7",
      content: "Response to question",
      child: Column(
        children: [
          Lesson(
            id: '1',
            lessonPage: SpeakingLessonPage(
              title: 'Process',
              heroId: '_Question57_lesson1',
              child: Process(
                titles: const [
                  '1. Màn hình hiển thị đoạn văn hướng dẫn',
                  '2. Màn hình hiển thị chủ đề',
                  '3. Màn hình chuẩn bị câu hỏi số 5 - 3s',
                  '4. Màn hình trả lời câu số 6 - 15s',
                ],
                images: [
                  AppResources.images.speaking_q57_process1,
                  AppResources.images.speaking_q57_process2,
                  AppResources.images.speaking_q57_process3,
                  AppResources.images.speaking_q57_process4,
                ],
                contents: [
                  LessonContentSpeaking.question57.lesson11_VN,
                  LessonContentSpeaking.question57.lesson12_VN,
                  '',
                  '',
                ],
              ),
            ),
          ),
          Lesson(
            id: '2',
            lessonPage: SpeakingLessonPage(
              title: 'Scoring & Guide to answer',
              heroId: '_Question57_lesson2',
              child: Scoring(
                scoringKey: '• All criteria in question 1, 2\n• relevance of content\n• completeness of content',
                scoringContent: LessonContentSpeaking.question57.lesson21_VN,
                guideToAnswer: LessonContentSpeaking.question57.lesson22_VN,
              ),
            ),
          ),
          Lesson(
            id: '3',
            lessonPage: SpeakingLessonPage(
              title: 'Summary & problems in the actual test',
              heroId: '_Question57_lesson3',
              child: Summary(
                summary: LessonContentSpeaking.question57.lesson31_VN,
                problem: LessonContentSpeaking.question57.lesson32_VN,
              ),
            ),
          ),
          const _Question57Test()
        ],
      ),
    );
  }
}

class _Question57Test extends StatelessWidget {
  const _Question57Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: []);
  }
}

class _Question810 extends StatelessWidget {
  const _Question810({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PartCard(
      imagePath: AppResources.images.speaking_q810,
      title: "Question 8->10",
      content: "Response to question using information provided",
      child: Column(
        children: [
          Lesson(
            id: '1',
            lessonPage: SpeakingLessonPage(
              title: 'Process',
              heroId: '_Question810_lesson1',
              child: Process(
                titles: const [
                  '1. Màn hình hiển thị đoạn văn hướng dẫn',
                  '2. Màn hình hiển thị bài đọc - 45s',
                  '3. Màn hình chuẩn bị trả lời câu hỏi - 3s',
                  '4. Màn hình trả lời câu hỏi 8 và 9 - 15s',
                  '5. Màn hình trả lời câu hỏi 10 - 30s',
                ],
                images: [
                  AppResources.images.speaking_q810_process1,
                  AppResources.images.speaking_q810_process2,
                  AppResources.images.speaking_q810_process3,
                  AppResources.images.speaking_q810_process4,
                  AppResources.images.speaking_q810_process5,
                ],
                contents: [
                  LessonContentSpeaking.question810.lesson11_VN,
                  LessonContentSpeaking.question810.lesson12_VN,
                  LessonContentSpeaking.question810.lesson13_VN,
                  '',
                  '',
                ],
              ),
            ),
          ),
          Lesson(
            id: '2',
            lessonPage: SpeakingLessonPage(
              title: 'Scoring & Guide to answer',
              heroId: '_Question810_lesson2',
              child: Scoring(
                scoringKey: '• All criteria',
                scoringContent: LessonContentSpeaking.question810.lesson21_VN,
                guideToAnswer: LessonContentSpeaking.question810.lesson22_VN,
              ),
            ),
          ),
          Lesson(
            id: '3',
            lessonPage: SpeakingLessonPage(
              title: 'Summary & problems in the actual test',
              heroId: '_Question810_lesson3',
              child: Summary(
                summary: LessonContentSpeaking.question810.lesson31_VN,
                problem: LessonContentSpeaking.question810.lesson32_VN,
              ),
            ),
          ),
          const _Question810Test()
        ],
      ),
    );
  }
}

class _Question810Test extends StatelessWidget {
  const _Question810Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: []);
  }
}

class _Question11 extends StatelessWidget {
  const _Question11({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PartCard(
      imagePath: AppResources.images.speaking_q10,
      title: "Question 11",
      content: "Express an opinion",
      child: Column(
        children: [
          Lesson(
            id: '1',
            lessonPage: SpeakingLessonPage(
              title: 'Process',
              heroId: '_Question11_lesson1',
              child: Process(
                titles: const [
                  '1. Màn hình hiển thị đoạn văn hướng dẫn',
                  '2. Màn hình chuẩn bị câu số 11 - 45s',
                ],
                images: [
                  AppResources.images.speaking_q11_process1,
                  AppResources.images.speaking_q11_process2,
                ],
                contents: [
                  LessonContentSpeaking.question11.lesson11_VN,
                  LessonContentSpeaking.question11.lesson12_VN,
                ],
              ),
            ),
          ),
          Lesson(
            id: '2',
            lessonPage: SpeakingLessonPage(
              title: 'Scoring & Guide to answer',
              heroId: '_Question11_lesson2',
              child: Scoring(
                scoringKey: '• All criteria',
                scoringContent: LessonContentSpeaking.question11.lesson21_VN,
                guideToAnswer: LessonContentSpeaking.question11.lesson22_VN,
              ),
            ),
          ),
          Lesson(
            id: '3',
            lessonPage: SpeakingLessonPage(
              title: 'Summary & problems in the actual test',
              heroId: '_Question11_lesson3',
              child: Summary(
                summary: LessonContentSpeaking.question11.lesson31_VN,
                problem: LessonContentSpeaking.question11.lesson32_VN,
              ),
            ),
          ),
          const _Question11Test()
        ],
      ),
    );
  }
}

class _Question11Test extends StatelessWidget {
  const _Question11Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: []);
  }
}

class _Questionbonus extends StatelessWidget {
  const _Questionbonus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PartCard(
      imagePath: AppResources.images.speaking_q10,
      title: "Question bonus",
      content: "propose a solution",
      child: Column(
        children: const [
          Lesson(
            id: '1',
            lessonPage: SpeakingLessonPage(
              title: 'Process',
              heroId: '_Question0_lesson1',
            ),
          ),
          Lesson(
            id: '2',
            lessonPage: SpeakingLessonPage(
              title: 'Scoring & Guide to answer',
              heroId: '_Question0_lesson3',
              child: Scoring(
                scoringKey: '• pronunciation • intonation and stress',
                scoringContent: '',
                guideToAnswer: '',
              ),
            ),
          ),
          Lesson(
            id: '3',
            lessonPage: SpeakingLessonPage(
              title: 'Summary & problems in the actual test',
              heroId: '_Question0_lesson2',
              child: Summary(
                summary: '',
                problem: '',
              ),
            ),
          ),
          _Question11Test()
        ],
      ),
    );
  }
}

class _QuestionbonusTest extends StatelessWidget {
  const _QuestionbonusTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: []);
  }
}
