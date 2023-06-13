


import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toeic/bloc/reading/reading_test_cubit.dart';
import 'package:toeic/data/model/question.dart';

class QuestionsCards extends StatefulWidget {
  const QuestionsCards(
      {this.submited = false,
        required this.question,
        Key? key})
      : super(key: key);
  final Question question;
  final bool submited;

  @override
  State<QuestionsCards> createState() => _QuestionsCardsState();
}

class _QuestionsCardsState extends State<QuestionsCards> {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = <Widget>[];

    list.addAll((widget.question.answers.map(
          (e) => Container(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Card(
            elevation: 0.0,
            color: getColor(widget.question, e.id),
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(4.0),
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    border: Border.all(
                      // width: 3.0,
                      color: Colors.greenAccent,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(100))),
                child: Text(
                  convertABC(e.id),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              title: Text(e.content),
              trailing: ShowAnswer(widget.question, e.id),
              onTap: () {
                setState(() {
                  widget.question.selectedAnswerId = e.id;
                });
                context.read<ReadingTestCubit>().selectedAnswerChanged();
              },
            )),
      ),
    )));

    list.add(Container(
      margin: const EdgeInsets.all(15),
      color: Colors.white,
      child: ExpandablePanel(
          collapsed: ExpandableButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Padding(padding: EdgeInsets.all(15), child: Text('Explanation')),
                  Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Icon(Icons.arrow_drop_down),
                  ),
                ],
              )),
          expanded: ExpandableButton(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Padding(
                          padding: EdgeInsets.all(15), child: Text('Explanation:')),
                      Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: Icon(Icons.arrow_drop_up),
                      ),
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(widget.question.explanation)),
                ],
              ))),
    ));

    return Column(children: list);
  }

  ShowAnswer(Question question, int id) {
    if (widget.submited) {
      if (question.correctAnswerId == id)
        return const Icon(Icons.check_circle, color: Colors.green);
      else
        return const Icon(Icons.dangerous, color: Colors.red);
    } else if (question.selectedAnswerId == id) {
      if (question.correctAnswerId == id)
        return const Icon(Icons.check_circle, color: Colors.green);
      else
        return const Icon(Icons.dangerous, color: Colors.red);
    }
  }

  String convertABC(int num) {
    switch (num) {
      case 1:
        return 'A';
      case 2:
        return 'B';
      case 3:
        return 'C';
      case 4:
        return 'D';
      default:
        return '0';
    }
  }

  getColor(Question question, identifier, {bool round = false}) {
    if (question.selectedAnswerId == null) {
      if (round) return Colors.black26;
      return Colors.white;
    } else if (question.selectedAnswerId == identifier) {
      if (round) return Theme.of(context).primaryColor;
      return Theme.of(context).secondaryHeaderColor;
    } else {
      if (round) return Colors.black26;
      return Colors.white;
    }
  }
}