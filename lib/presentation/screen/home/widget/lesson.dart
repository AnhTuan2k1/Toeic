import 'package:flutter/material.dart';
import 'package:toeic/presentation/screen/home/widget/lesson_page.dart';

import '../../../../src/app_resources.dart';

class Lesson extends StatelessWidget {
  const Lesson(
      {super.key, required this.id, this.lessonPage = const LessonPage()});

  final String id;
  final LessonPage lessonPage;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => lessonPage)),
      child: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(20, 15, 10, 15),
            child: Row(
              children: [
                Hero(
                  tag: lessonPage.heroId,
                  child: Image.asset(
                    AppResources.images.book,
                    width: size.width * 0.06,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: Text(
                  'Lesson $id: ${lessonPage.title}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 16),
                ))
              ],
            ),
          ),
          const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Divider(
                height: 1,
                thickness: 1,
              ))
        ],
      ),
    );
  }
}
