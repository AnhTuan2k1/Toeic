import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toeic/bloc/writing/writing_cubit.dart';
import 'package:toeic/presentation/screen/home/speaking/process.dart';
import 'package:toeic/presentation/screen/home/speaking/scoring.dart';
import 'package:toeic/presentation/screen/home/widget/lesson.dart';
import 'package:toeic/presentation/screen/home/widget/part_card.dart';
import 'package:toeic/presentation/screen/home/widget/snack_bar.dart';
import 'package:toeic/presentation/screen/home/widget/test.dart';
import 'package:toeic/presentation/screen/home/writing/lesson_content_writing.dart';
import 'package:toeic/presentation/screen/home/writing/writing_lesson_page.dart';
import 'package:toeic/presentation/screen/home/writing/writing_test_page.dart';
import 'package:toeic/src/app_resources.dart';

class WritingPage extends StatelessWidget {
  const WritingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Writing'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
      ),
      body: BlocProvider(
        create: (_) => WritingCubit(),
        child: const WritingForm(),
      ),
    );
  }
}

class WritingForm extends StatelessWidget {
  const WritingForm({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener<WritingCubit, WritingState>(
      listenWhen: (previous, current) =>
          previous.respondMsg != current.respondMsg,
      listener: (BuildContext context, state) {
        MySnackBar.showSnackBar(
            message: state.respondMsg.message,
            context: context,
            typeMsg: state.respondMsg.typeMsg);
      },
      child: SingleChildScrollView(
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
    );
  }
}

class _Question15 extends StatelessWidget {
  const _Question15({Key? key}) : super(key: key);

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
    return BlocBuilder<WritingCubit, WritingState>(
      buildWhen: (previous, current) =>
          previous.remoteData.part1 != current.remoteData.part1 ||
          previous.localData.part1 != current.localData.part1,
      builder: (BuildContext context, state) {
        return Column(
            children: getTest(
                state.localData.part1, state.remoteData.part1, 'q15',
                numQ: 5 + 1));
      },
    );
  }
}

class _Question67 extends StatelessWidget {
  const _Question67({Key? key}) : super(key: key);

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
    return BlocBuilder<WritingCubit, WritingState>(
      buildWhen: (previous, current) =>
          previous.remoteData.part2 != current.remoteData.part2 ||
          previous.localData.part2 != current.localData.part2,
      builder: (BuildContext context, state) {
        return Column(
            children: getTest(
                state.localData.part2, state.remoteData.part2, 'q67',
                numQ: 2));
      },
    );
  }
}

class _Question8 extends StatelessWidget {
  const _Question8({Key? key}) : super(key: key);

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
    return BlocBuilder<WritingCubit, WritingState>(
      buildWhen: (previous, current) =>
          previous.remoteData.part3 != current.remoteData.part3 ||
          previous.localData.part3 != current.localData.part3,
      builder: (BuildContext context, state) {
        return Column(
            children: getTest(
                state.localData.part3, state.remoteData.part3, 'q8',
                numQ: 5));
      },
    );
  }
}

List<Test> getTest(List<String> localData, List<String> remoteData, String part,
    {int? numQ}) {
  List<Test> tests = [];
  for (var element in localData) {
    tests.add(Test(
      title: element,
      testPage: WritingTestPage(
        title: (tests.length + 1).toString(),
        fileName: element,
        part: part,
        isDownloaded: true,
        numQuestion: numQ == null ? numQ : numQ + 1,
      ),
    ));
  }
  for (var element in remoteData) {
    if (localData.contains(element)) continue;
    tests.add(Test(
      title: element,
      testPage: WritingTestPage(
        title: (tests.length + 1).toString(),
        fileName: element,
        part: part,
        isDownloaded: false,
        numQuestion: numQ == null ? numQ : numQ + 1,
      ),
    ));
  }

  return tests..sort((a, b) => a.testPage.fileName.compareTo(b.testPage.fileName))
    ..forEach((element) => element.title = '${tests.indexOf(element) + 1}');
}
