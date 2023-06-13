import 'package:flutter/material.dart';
import 'package:toeic/data/di/di.dart';
import 'package:toeic/data/model/question.dart';
import 'package:toeic/data/remote/firebase_repository.dart';
import 'package:toeic/presentation/widget/card_background.dart';

showDialogProgress(BuildContext context, {String msg = '', int? numQuestion}) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: CardBackGround(
            margin: const EdgeInsets.only(left: 15, right: 15),
            padding: const EdgeInsets.all(15),
            borderRadius: BorderRadius.circular(5),
            child: Row(
              children: [
                const CircularProgressIndicator(),
                const SizedBox(width: 15),
                Expanded(
                    child: Row(
                  children: [
                    Text(msg),
                    const SizedBox(width: 5),
                    _ProgressText(numQuestion),
                  ],
                ))
              ],
            ),
          ),
        );
      });
}

class _ProgressText extends StatelessWidget {
  const _ProgressText(this.numQuestion, {Key? key}) : super(key: key);
  final int? numQuestion;

  @override
  Widget build(BuildContext context) {
    if (numQuestion == null) return const SizedBox();
    return StreamBuilder<int>(
      stream: getIt.get<FirebaseRepository>().countstream(),
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        if (snapshot.hasError) {
          return const Icon(
            Icons.error_outline,
            color: Colors.red,
          );
        } else {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Text('...');
            case ConnectionState.waiting:
              return const Text('...');
            case ConnectionState.active:
              int value = snapshot.data ?? 1;
              return Text(
                  '${(10000 * value / (numQuestion ?? 1)).floor() / 100}%');
            case ConnectionState.done:
              int value = snapshot.data ?? 1;
              if (value < 0) value = 0;
              return Text(
                  '${(10000 * value / (numQuestion ?? 1)).floor() / 100}% done');
          }
        }
      },
    );
  }
}

Future<bool?> showYesNoDialog(
    {required BuildContext context, required String content}) async {
  return showDialog<bool>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text(content),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'No',
              style: TextStyle(fontSize: 17),
            ),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          TextButton(
            child: const Text(
              'Yes',
              style: TextStyle(fontSize: 17),
            ),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
        ],
      );
    },
  );
}

Future<void> showAlertDialog(
    {required BuildContext context,
    String title = '',
    String alertContent = ''}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('$title 🤧'),
        content: SingleChildScrollView(child: Text(alertContent)),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Oke',
              style: TextStyle(fontSize: 17),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class ChangeQuestionDialog extends StatelessWidget {
  const ChangeQuestionDialog({
    required this.submited,
    required this.questions,
    Key? key,
  }) : super(key: key);

  final List<Question> questions;
  final bool submited;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double percent = 0.4;
    {
      int num = questions.length;
      if (num >= 16)
        percent = 0.25;
      else if (num >= 11)
        percent = 0.3;
      else if (num >= 6) percent = 0.35;
    }
    return Center(
        child: Container(
            width: double.infinity,
            height: double.infinity,
            margin:
                EdgeInsets.fromLTRB(30, percent * height, 30, percent * height),
            color: Colors.white,
            child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                crossAxisCount: 5,
                children: createList(context, questions))));
  }

  List<Container> createList(BuildContext context, List<Question> questions) {
    List<Container> list = <Container>[];
    for (int i = 0; i < questions.length; i++) {
      list.add(Container(
        color: getColors(questions[i]),
        child: OutlinedButton(
            onPressed: () => {Navigator.of(context).pop(i)},
            child: FittedBox(
                child: Text('${i + 1}', style: textStyle(questions[i])))),
      ));
    }

    return list;
  }

  TextStyle? textStyle(Question question) {
    Color? color;

    if (submited) {
      color = Colors.white;
    } else {}
    return TextStyle(fontSize: 20, color: color);
  }

  getColors(Question question) {
    if (submited) {
      if (question.selectedAnswerId == null)
        return Colors.red;
      else if (question.selectedAnswerId == question.correctAnswerId)
        return Colors.green;
      else
        return Colors.red;
    } else {
      if (question.selectedAnswerId != null) return Colors.lightBlue[100];
    }
  }
}
