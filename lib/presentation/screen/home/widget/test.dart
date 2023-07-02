import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toeic/bloc/listening/listening_cubit.dart';
import 'package:toeic/bloc/reading/reading_cubit.dart';
import 'package:toeic/bloc/speaking/speaking_cubit.dart';
import 'package:toeic/bloc/writing/writing_cubit.dart';
import 'package:toeic/presentation/screen/home/listening/listening_test_page.dart';
import 'package:toeic/presentation/screen/home/reading/reading_test_page.dart';
import 'package:toeic/presentation/screen/home/speaking/speaking_test_page.dart';
import 'package:toeic/presentation/screen/home/widget/dialog.dart';
import 'package:toeic/presentation/screen/home/widget/test_page.dart';
import 'package:toeic/presentation/screen/home/writing/writing_test_page.dart';
import 'package:toeic/src/app_resources.dart';

class Test extends StatelessWidget {
  Test(
      {super.key,
      this.title = '',
      this.testPage = const TestPage(
        fileName: '',
        part: '',
      )});

  String title;
  final TestPage testPage;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => {
        if (testPage.isDownloaded)
          {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => testPage))
          }
        else if (testPage.fileName != '')
          {
            showDialogProgress(context,
                msg: 'downloading resource', numQuestion: testPage.numQuestion),

            if(testPage is ListeningTestPage){
              context
                  .read<ListeningCubit>()
                  .downloadData(testPage.fileName, testPage.part)
                  .then((value) => {
                Navigator.of(context).pop(),
                if (value)
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => testPage))
              })
            }
            else if(testPage is ReadingTestPage){
              context
                  .read<ReadingCubit>()
                  .downloadData(testPage.fileName, testPage.part)
                  .then((value) => {
                Navigator.of(context).pop(),
                if (value)
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => testPage))
              })
            }
            else if(testPage is SpeakingTestPage){
                context
                    .read<SpeakingCubit>()
                    .downloadData(testPage.fileName, testPage.part)
                    .then((value) => {
                  Navigator.of(context).pop(),
                  if (value)
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => testPage))
                })
              }
              else if(testPage is WritingTestPage){
                  context
                      .read<WritingCubit>()
                      .downloadData(testPage.fileName, testPage.part)
                      .then((value) => {
                    Navigator.of(context).pop(),
                    if (value)
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => testPage))
                  })
                }
            else Navigator.of(context).pop(),

          }
      },
      child: Column(
        children: [
          const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Divider(
                height: 1,
                thickness: 1,
              )),
          Container(
            color: Colors.white,
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
                  'Test $title',
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 16),
                )),
                testPage.isDownloaded
                    ? const SizedBox(width: 1)
                    : const Icon(Icons.cloud_download_outlined),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
