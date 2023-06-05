

import 'package:flutter/material.dart';
import 'package:toeic/data/model/question.dart';

class AnswerCards extends StatefulWidget {
  const AnswerCards(
      {this.submited = false,
        required this.question,
        Key? key})
      : super(key: key);
  final Question question;
  final bool submited;

  @override
  State<AnswerCards> createState() => _AnswerCardsState();
}

class _AnswerCardsState extends State<AnswerCards> {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = <Widget>[];
    list.add(SizedBox(
      height: 20,
    ));
    list.addAll((widget.question.answers.map(
          (e) => Container(
        padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
        child: Card(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: getColor(widget.question, e.id, round: true),
                  width: 1),
              borderRadius: BorderRadius.circular(10.0),
            ),
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
                  e.id.toString(),
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
              },
            )),
      ),
    )));

    list.add(SizedBox(
      height: 100,
    ));

    return Column(children: list);
  }

  ShowAnswer(Question question, int id) {
    if (widget.submited) {
      if (question.correctAnswerId == id)
        return const Icon(Icons.check_circle, color: Colors.green);
      else
        return const Icon(Icons.dangerous, color: Colors.red);
    }

    else if (question.selectedAnswerId == id) {
      if (question.correctAnswerId == id)
        return const Icon(Icons.check_circle, color: Colors.green);
      else
        return const Icon(Icons.dangerous, color: Colors.red);
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