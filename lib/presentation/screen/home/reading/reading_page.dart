import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toeic/bloc/reading/reading_cubit.dart';
import 'package:toeic/presentation/screen/home/listening/listening_test_page.dart';
import 'package:toeic/presentation/screen/home/widget/lesson.dart';
import 'package:toeic/presentation/screen/home/widget/lesson_page.dart';
import 'package:toeic/presentation/screen/home/widget/part_card.dart';
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
    return SingleChildScrollView(
      child: Container(
        //color: Colors.green,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.03),
            Part5(),
            Part6(),
            Part7(),
          ],
        ),
      ),
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
        children: const [
          Lesson(
            id: '1',
            lessonPage: LessonPage(
              title: 'Part of speech',
              heroId: 'part5_lesson1',
              content: ['sdhow', '44'],
            ),
          ),
          Lesson(
            id: '2',
            lessonPage: LessonPage(
              title: 'Gerunds & Infinitives',
              heroId: 'part5_lesson2',
              content: ['sdhow', '44'],
            ),
          ),
          Lesson(
            id: '3',
            lessonPage: LessonPage(
              title: 'Suffixes and Prefixes',
              heroId: 'part5_lesson3',
              content: ['sdhow', '44'],
            ),
          ),
          Lesson(
            id: '4',
            lessonPage: LessonPage(
              title: 'Pronouns',
              heroId: 'part5_lesson4',
              content: ['sdhow', '44'],
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
        children: const [
          Lesson(
            id: '1',
            lessonPage: LessonPage(
              title: 'Using context to choose the correct verb form',
              heroId: 'part6_lesson1',
              content: ['sdhow', '44'],
            ),
          ),
          Lesson(
            id: '2',
            lessonPage: LessonPage(
              title: 'Choosing correct part of speech',
              heroId: 'part6_lesson2',
              content: ['sdhow', '44'],
            ),
          ),
          Lesson(
            id: '3',
            lessonPage: LessonPage(
              title: 'Using clues to choose correct verb form',
              heroId: 'part6_lesson3',
              content: ['sdhow', '44'],
            ),
          ),
          Lesson(
            id: '4',
            lessonPage: LessonPage(
              title: 'Prepositions & Conjunctions',
              heroId: 'part6_lesson4',
              content: ['sdhow', '44'],
            ),
          ),
          Test(
            title: '1',
          ),
          Test(
            title: '2',
          ),
        ],
      ),
    );
  }
}


class Part7 extends StatelessWidget {
  const Part7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PartCard(
      imagePath: AppResources.images.reading_part8,
      title: "Part8",
      content: "Single, multi Passages",
      child: Column(
        children: const [
          Lesson(
            id: '1',
            lessonPage: LessonPage(
              title: 'Scanning',
              heroId: 'part8_lesson1',
              content: ['sdhow', '44'],
            ),
          ),
          Lesson(
            id: '2',
            lessonPage: LessonPage(
              title: 'Answering vocabulary question annd inferring the meaning',
              heroId: 'part8_lesson2',
              content: ['sdhow', '44'],
            ),
          ),
          Lesson(
            id: '3',
            lessonPage: LessonPage(
              title: 'Answering "NOT" questions, question with name, number, date and time',
              heroId: 'part8_lesson3',
              content: ['sdhow', '44'],
            ),
          ),
          Lesson(
            id: '4',
            lessonPage: LessonPage(
              title: 'Dealing with chart, tables, form and double, triple passages',
              heroId: 'part8_lesson4',
              content: ['sdhow', '44'],
            ),
          ),
          Test(
            title: '1',
          ),
          Test(
            title: '2',
          ),
        ],
      ),
    );
  }
}

List<Test> getTest(List<String> localData, List<String> remoteData, String part,
    {int? numQ}) {
  List<Test> tests = [];
  for (var element in localData) {
    tests.add(Test(
      title: (tests.length + 1).toString(),
      testPage: ListeningTestPage(
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
      title: (tests.length + 1).toString(),
      testPage: ListeningTestPage(
        title: (tests.length + 1).toString(),
        fileName: element,
        part: part,
        isDownloaded: false,
        numQuestion: numQ == null ? numQ : numQ + 1,
      ),
    ));
  }

  return tests;
}