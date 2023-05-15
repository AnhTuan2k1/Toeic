import 'package:flutter/material.dart';
import 'package:toeic/presentation/screen/home/listening/lesson_content.dart';
import 'package:toeic/presentation/screen/home/listening/listening_test_page.dart';
import 'package:toeic/presentation/screen/home/widget/lesson.dart';
import 'package:toeic/presentation/screen/home/widget/test.dart';

import '../../../../src/app_resources.dart';
import '../widget/lesson_page.dart';
import '../widget/part_card.dart';

class ListeningPage extends StatelessWidget {
  const ListeningPage({super.key});

  static const String title = "Listening";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(ListeningPage.title),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
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
        children:  [
          Lesson(
            id: '1',
            lessonPage: LessonPage(
              title: 'Predict what you will hear',
              heroId: 'part1_lesson1',
              content: [LessonContent.part1.lesson11_VN, LessonContent.part1.lesson12_VN??''],
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
          Test(
            id: '1',
            title: '',
            testPage: ListeningTestPage(title: 'Test 1',),
          ),
          Test(
            id: '2',
            title: '',
          ),
          Test(
            id: '3',
            title: '',
          ),
          Test(
            id: '4',
            title: '',
          )
        ],
      ),
    );
  }
}

class Part2 extends StatelessWidget {
  const Part2({
    Key? key,
  }) : super(key: key);

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
          Test(
            id: '1',
            title: '',
          ),
          Test(
            id: '2',
            title: '',
          ),
          Test(
            id: '3',
            title: '',
          ),
          Test(
            id: '4',
            title: '',
          )
        ],
      ),
    );
  }
}

class Part3 extends StatelessWidget {
  const Part3({
    Key? key,
  }) : super(key: key);

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
          Test(
            id: '1',
            title: '',
          ),
          Test(
            id: '2',
            title: '',
          ),
          Test(
            id: '3',
            title: '',
          ),
          Test(
            id: '4',
            title: '',
          )
        ],
      ),
    );
  }
}

class Part4 extends StatelessWidget {
  const Part4({
    Key? key,
  }) : super(key: key);

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
          Test(
            id: '1',
            title: '',
          ),
          Test(
            id: '2',
            title: '',
          ),
          Test(
            id: '3',
            title: '',
          ),
          Test(
            id: '4',
            title: '',
          )
        ],
      ),
    );
  }
}




