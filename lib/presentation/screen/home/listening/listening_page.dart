import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toeic/bloc/listening/listening_cubit.dart';
import 'package:toeic/presentation/screen/home/listening/lesson_content.dart';
import 'package:toeic/presentation/screen/home/listening/listening_test_page.dart';
import 'package:toeic/presentation/screen/home/widget/lesson.dart';
import 'package:toeic/presentation/screen/home/widget/lesson_page.dart';
import 'package:toeic/presentation/screen/home/widget/part_card.dart';
import 'package:toeic/presentation/screen/home/widget/snack_bar.dart';
import 'package:toeic/presentation/screen/home/widget/test.dart';
import 'package:toeic/src/app_resources.dart';

class ListeningPage extends StatelessWidget {
  const ListeningPage({super.key});

  static const String title = "Listening";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ListeningPage.title),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
      ),
      body: BlocProvider(
        create: (_) => ListeningCubit(),
        child: const ListeningForm(),
      ),
    );
  }
}

class ListeningForm extends StatelessWidget {
  const ListeningForm({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener<ListeningCubit, ListeningState>(
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
            const Part1(),
            const Part2(),
            const Part3(),
            const Part4(),
          ],
        ),
      ),
    );
  }
}

class Part1 extends StatelessWidget {
  const Part1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PartCard(
      imagePath: AppResources.images.home_part1,
      title: "Part 1",
      content: "Photos",
      child: Column(
        children: [
          Lesson(
            id: '1',
            lessonPage: LessonPage(
              title: 'Predict what you will hear',
              heroId: 'part1_lesson1',
              content: [
                LessonContent.part1.lesson11_VN,
                LessonContent.part1.lesson12_VN ?? ''
              ],
            ),
          ),
          Lesson(
            id: '2',
            lessonPage: LessonPage(
              title: 'Listen for correct verb',
              heroId: 'part1_lesson2',
              content: ['sdhow', '44'],
            ),
          ),
          Lesson(
            id: '3',
            lessonPage: LessonPage(
              title: 'Listen for details',
              heroId: 'part1_lesson3',
              content: ['sdhow', '44'],
            ),
          ),
          Lesson(
            id: '4',
            lessonPage: LessonPage(
              title: 'Listen for prepositions and similar sounds',
              heroId: 'part1_lesson4',
              content: ['sdhow', '44'],
            ),
          ),
          const Part1Test()
        ],
      ),
    );
  }
}

class Part1Test extends StatelessWidget {
  const Part1Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListeningCubit, ListeningState>(
      buildWhen: (previous, current) =>
          previous.remoteData.part1 != current.remoteData.part1 ||
          previous.localData.part1 != current.localData.part1,
      builder: (BuildContext context, state) {
        return Column(
            children: getTest(
                state.localData.part1, state.remoteData.part1, 'part1',
                numQ: 7));
      },
    );
  }
}

class Part2 extends StatelessWidget {
  const Part2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PartCard(
      imagePath: AppResources.images.listening_part2,
      title: "Part 2",
      content: "Question & Response",
      child: Column(
        children: const [
          Lesson(
            id: '1',
            lessonPage: LessonPage(
              title: 'Answering direct question',
              heroId: 'part2_lesson1',
              content: ['sdhow', '44'],
            ),
          ),
          Lesson(
            id: '2',
            lessonPage: LessonPage(
              title: 'Time and location structures',
              heroId: 'part2_lesson2',
              content: ['sdhow', '44'],
            ),
          ),
          Lesson(
            id: '3',
            lessonPage: LessonPage(
              title: 'Languages used in requests, offers and opinions',
              heroId: 'part2_lesson3',
              content: ['sdhow', '44'],
            ),
          ),
          Lesson(
            id: '4',
            lessonPage: LessonPage(
              title: 'Dealing with factual question',
              heroId: 'part2_lesson4',
              content: ['sdhow', '44'],
            ),
          ),
          Part2Test()
        ],
      ),
    );
  }
}

class Part2Test extends StatelessWidget {
  const Part2Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListeningCubit, ListeningState>(
      buildWhen: (previous, current) =>
          previous.remoteData.part2 != current.remoteData.part2 ||
          previous.localData.part2 != current.localData.part2,
      builder: (BuildContext context, state) {
        return Column(
            children: getTest(
                state.localData.part2, state.remoteData.part2, 'part2',
                numQ: 6));
      },
    );
  }
}

class Part3 extends StatelessWidget {
  const Part3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PartCard(
      imagePath: AppResources.images.listening_part3,
      title: "Part 3",
      content: "Conversations",
      child: Column(
        children: const [
          Lesson(
            id: '1',
            lessonPage: LessonPage(
              title: 'Skimming to predict context before listenning',
              heroId: 'part3_lesson1',
              content: ['sdhow', '44'],
            ),
          ),
          Lesson(
            id: '2',
            lessonPage: LessonPage(
              title: 'Word distractors',
              heroId: 'part3_lesson2',
              content: ['sdhow', '44'],
            ),
          ),
          Lesson(
            id: '3',
            lessonPage: LessonPage(
              title: 'Using vocabulary clues',
              heroId: 'part3_lesson3',
              content: ['sdhow', '44'],
            ),
          ),
          Lesson(
            id: '4',
            lessonPage: LessonPage(
              title: 'Saying "No" and first exchange',
              heroId: 'part3_lesson4',
              content: ['sdhow', '44'],
            ),
          ),
          Part3Test()
        ],
      ),
    );
  }
}

class Part3Test extends StatelessWidget {
  const Part3Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListeningCubit, ListeningState>(
      buildWhen: (previous, current) =>
          previous.remoteData.part3 != current.remoteData.part3 ||
          previous.localData.part3 != current.localData.part3,
      builder: (BuildContext context, state) {
        return Column(
            children: getTest(
                state.localData.part3, state.remoteData.part3, 'part3',
                numQ: 10));
      },
    );
  }
}

class Part4 extends StatelessWidget {
  const Part4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PartCard(
      imagePath: AppResources.images.listening_part4,
      title: "Part 4",
      content: 'Short talk',
      child: Column(
        children: const [
          Lesson(
            id: '1',
            lessonPage: LessonPage(
              title: 'Skimming to predict context before listenning',
              heroId: 'part4_lesson1',
              content: ['sdhow', '44'],
            ),
          ),
          Lesson(
            id: '2',
            lessonPage: LessonPage(
              title: '"What" questions',
              heroId: 'part4_lesson2',
              content: ['sdhow', '44'],
            ),
          ),
          Lesson(
            id: '3',
            lessonPage: LessonPage(
              title: 'Restatement/Questions with numbers and quantities',
              heroId: 'part4_lesson3',
              content: ['sdhow', '44'],
            ),
          ),
          Lesson(
            id: '4',
            lessonPage: LessonPage(
              title: 'Restatement involving "how" and "Why" questions',
              heroId: 'part4_lesson4',
              content: ['sdhow', '44'],
            ),
          ),
          Part4Test()
        ],
      ),
    );
  }
}

class Part4Test extends StatelessWidget {
  const Part4Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListeningCubit, ListeningState>(
      buildWhen: (previous, current) =>
          previous.remoteData.part4 != current.remoteData.part4 ||
          previous.localData.part4 != current.localData.part4,
      builder: (BuildContext context, state) {
        return Column(
            children: getTest(
                state.localData.part4, state.remoteData.part4, 'part4', numQ: 10));
      },
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
        numQuestion: numQ,
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
        numQuestion: numQ,
      ),
    ));
  }

  return tests;
}
