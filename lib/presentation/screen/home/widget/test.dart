import 'package:flutter/material.dart';
import 'package:toeic/presentation/screen/home/widget/test_page.dart';

import '../../../../src/app_resources.dart';

class Test extends StatelessWidget {
  const Test(
  {super.key, required this.id, this.title = '', this.testPage});

  final String id;
  final String title;
  final TestPage? testPage;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => testPage ?? const TestPage())),
      child: Column(
        children: [
          const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Divider(
                height: 1,
                thickness: 1,
              )),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 15, 10, 15),
            child: Row(
              children: [
                Image.asset(
                  AppResources.images.note,
                  width: size.width * 0.06,
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: Text(
                      'Test $id $title',
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 16),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
