import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toeic/bloc/reading/reading_cubit.dart';
import 'package:toeic/presentation/screen/home/reading/lesson_content_reading.dart';
import 'package:toeic/presentation/screen/home/reading/reading_test_page.dart';
import 'package:toeic/presentation/screen/home/widget/lesson.dart';
import 'package:toeic/presentation/screen/home/widget/lesson_page.dart';
import 'package:toeic/presentation/screen/home/widget/part_card.dart';
import 'package:toeic/presentation/screen/home/widget/snack_bar.dart';
import 'package:toeic/presentation/screen/home/widget/test.dart';
import 'package:toeic/src/app_resources.dart';



class ReadingPage extends StatelessWidget {
  const ReadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reading'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
      ),
      body: BlocProvider(
        create: (_) => ReadingCubit(),
        child: const ReadingForm(),
      ),
    );
  }
}

class ReadingForm extends StatelessWidget{
  const ReadingForm({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener<ReadingCubit, ReadingState>(
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
              Part5(),
              Part6(),
              Part7(),
            ],
          ),
        )
    );
  }

}

class Part5 extends StatelessWidget {
  const Part5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PartCard(
      imagePath: AppResources.images.reading_part5,
      title: "Part5",
      content: "Incomplete sentences",
      child: Column(
        children: [
          Lesson(
            id: '1',
            lessonPage: LessonPage(
              title: 'Part of speech',
              content: [
                LessonContentReading.part5.lesson11_VN,
                LessonContentReading.part5.lesson12_VN
              ],
            ),
          ),
          Lesson(
            id: '2',
            lessonPage: LessonPage(
              title: 'Gerunds & Infinitives',
              content: [
                LessonContentReading.part5.lesson21_VN,
                LessonContentReading.part5.lesson22_VN
              ],
            ),
          ),
          Lesson(
            id: '3',
            lessonPage: LessonPage(
              title: 'Suffixes and Prefixes',
              content: [
                LessonContentReading.part5.lesson31_VN,
                LessonContentReading.part5.lesson32_VN
              ],            ),
          ),
          Lesson(
            id: '4',
            lessonPage: LessonPage(
              title: 'Pronouns',
              content: [
                LessonContentReading.part5.lesson41_VN,
                LessonContentReading.part5.lesson42_VN
              ],
            ),
          ),
          Part5Test()
        ],
      ),
    );
  }
}

class Part5Test extends StatelessWidget {
  const Part5Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadingCubit, ReadingState>(
      buildWhen: (previous, current) =>
      previous.remoteData.part1 != current.remoteData.part1 ||
          previous.localData.part1 != current.localData.part1,
      builder: (BuildContext context, state) {
        return Column(
            children: getTest(
                state.localData.part1, state.remoteData.part1, 'part5',
                numQ: 10));
      },
    );
  }
}

class Part6 extends StatelessWidget {
  const Part6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PartCard(
      imagePath: AppResources.images.reading_part6,
      title: "Part6",
      content: "Text completion",
      child: Column(
        children: [
          Lesson(
            id: '1',
            lessonPage: LessonPage(
              title: 'Using context to choose the correct verb form',
              content: [
                LessonContentReading.part6.lesson11_VN,
                LessonContentReading.part6.lesson12_VN
              ],
            ),
          ),
          Lesson(
            id: '2',
            lessonPage: LessonPage(
              title: 'Choosing correct part of speech',
              content: [
                LessonContentReading.part6.lesson21_VN,
                LessonContentReading.part6.lesson22_VN
              ],
            ),
          ),
          Lesson(
            id: '3',
            lessonPage: LessonPage(
              title: 'Using clues to choose correct verb form',
              content: [
                LessonContentReading.part6.lesson31_VN,
                LessonContentReading.part6.lesson32_VN
              ],
            ),
          ),
          Lesson(
            id: '4',
            lessonPage: LessonPage(
              title: 'Prepositions & Conjunctions',
              content: [
                LessonContentReading.part6.lesson41_VN,
                LessonContentReading.part6.lesson42_VN
              ],
            ),
          ),
          Part6Test()
        ],
      ),
    );
  }
}

class Part6Test extends StatelessWidget {
  const Part6Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadingCubit, ReadingState>(
      buildWhen: (previous, current) =>
      previous.remoteData.part2 != current.remoteData.part2 ||
          previous.localData.part2 != current.localData.part2,
      builder: (BuildContext context, state) {
        return Column(
            children: getTest(
                state.localData.part2, state.remoteData.part2, 'part6',
                numQ: 12));
      },
    );
  }
}


class Part7 extends StatelessWidget {
  const Part7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PartCard(
      imagePath: AppResources.images.reading_part8,
      title: "Part7",
      content: "Single, multi Passages",
      child: Column(
        children: [
          Lesson(
            id: '1',
            lessonPage: LessonPage(
              title: 'Scanning',
              content: [
                LessonContentReading.part7.lesson11_VN,
                LessonContentReading.part7.lesson12_VN
              ],
            ),
          ),
          Lesson(
            id: '2',
            lessonPage: LessonPage(
              title: 'Answering vocabulary question annd inferring the meaning',
              content: [
                LessonContentReading.part7.lesson21_VN,
                LessonContentReading.part7.lesson22_VN
              ],
            ),
          ),
          Lesson(
            id: '3',
            lessonPage: LessonPage(
              title: 'Answering "NOT" questions, question with name, number, date and time',
              content: [
                LessonContentReading.part7.lesson31_VN,
                LessonContentReading.part7.lesson32_VN
              ],
            ),
          ),
          Lesson(
            id: '4',
            lessonPage: LessonPage(
              title: 'Dealing with chart, tables, form and double, triple passages',
              content: [
                LessonContentReading.part7.lesson41_VN,
                LessonContentReading.part7.lesson42_VN
              ],
            ),
          ),
          Part7Test()
        ],
      ),
    );
  }
}

class Part7Test extends StatelessWidget {
  const Part7Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadingCubit, ReadingState>(
      buildWhen: (previous, current) =>
      previous.remoteData.part3 != current.remoteData.part3 ||
          previous.localData.part3 != current.localData.part3,
      builder: (BuildContext context, state) {
        return Column(
            children: getTest(
                state.localData.part3, state.remoteData.part3, 'part7',
                numQ: 10));
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
      testPage: ReadingTestPage(
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
      testPage: ReadingTestPage(
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