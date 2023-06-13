import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toeic/bloc/reading/reading_test_cubit.dart';

import 'package:toeic/data/model/question.dart';
import 'package:toeic/presentation/screen/home/reading/questions_card.dart';
import 'package:toeic/presentation/screen/home/widget/dialog.dart';
import 'package:toeic/presentation/screen/home/widget/snack_bar.dart';
import 'package:toeic/presentation/screen/home/widget/test_page.dart';
import 'package:toeic/src/app_resources.dart';

class ReadingTestPage extends TestPage {
  const ReadingTestPage(
  {super.key,
  required super.fileName,
  required super.part,
  super.title,
  super.isDownloaded,
  super.numQuestion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Test $title'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
        ),
        body: BlocProvider(
          create: (_) => ReadingTestCubit(part, fileName),
          child: const ReadingTestForm(),
        ));
  }
}

class ReadingTestForm extends StatelessWidget {
  const ReadingTestForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReadingTestCubit, ReadingTestState>(
      listenWhen: (previous, current) =>
      previous.respondMsg != current.respondMsg,
      listener: (BuildContext context, state) {
        MySnackBar.showSnackBar(
            message: state.respondMsg.message,
            context: context,
            typeMsg: state.respondMsg.typeMsg);
      },
      child: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 50,),
                  _ImageAndContent(),
                  SizedBox(height: 20),
                  _QuestionAndAnswers(),
                  SizedBox(height: 100)
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 1,
            right: 1,
            child: Container(
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: _QuestionProgress()),
                  ),
                  _ChangeQuestion()
                ],
              ),
            ),
          ),
          Positioned(
            height: 100,
            bottom: 0.0,
            left: 20,
            right: 20,
            child: _ButtonNextPrevious(),
          ),
        ],
      ),
    );
  }
}

class _ChangeQuestion extends StatelessWidget {
  const _ChangeQuestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadingTestCubit, ReadingTestState>(
        buildWhen: (_, __) => false,
        builder: (context, state) {
          return GestureDetector(
            onTap: () => handleChangeQuestion(context, state).then((value) =>
                context.read<ReadingTestCubit>().changeToQuestion(value)),
            child:
            const SizedBox(width: 50, height: 50, child: Icon(Icons.apps_sharp)),
          );
        });
  }

  Future<int?> handleChangeQuestion(
      BuildContext context, ReadingTestState state) async {
    return showDialog<int>(
        context: context,
        builder: (context) {
          return ChangeQuestionDialog(
              questions: state.examQuestion.questions,
              submited: state.examQuestion.submited);
        });
  }
}

class _QuestionProgress extends StatelessWidget {
  const _QuestionProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadingTestCubit, ReadingTestState>(

        builder: (context, state) {
          if (state.examQuestion.questions.isEmpty) return const SizedBox();
          int selectedQuestions = 0;
          for (var element in state.examQuestion.questions) {
            if(element.selectedAnswerId != null) selectedQuestions++;
          }
          final totalQuestion = state.examQuestion.questions.length;
          return Row(
            children: [
              // Text(
              //   '$selectedQuestions/$totalQuestion',
              //   style: AppResources.text_styles.h4,
              // ),
              const SizedBox(width: 10),
              Expanded(
                child: LinearProgressIndicator(
                  backgroundColor: Colors.black12,
                  value: selectedQuestions / (totalQuestion - 1),
                ),
              ),
              const SizedBox(width: 10),
            ],
          );
        });
  }
}

class _QuestionAndAnswers extends StatelessWidget {
  const _QuestionAndAnswers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadingTestCubit, ReadingTestState>(
      buildWhen: (previous, current) =>
      previous.currentQuestion != current.currentQuestion,
      builder: (BuildContext context, state) {
        var q = state.examQuestion.questions;
        if (q.isNotEmpty) {
          return _buildQuestionAndAnswers(q, q[state.currentQuestion].id, context);
        } else
          return const SizedBox();
      },
    );
  }

  _buildQuestionAndAnswers(List<Question> questions, String id, BuildContext context) {
    List<Widget> list = [];
    var qs = questions.where((element) => element.id == id).toList();
    for (var element in qs) {
      list.add(buildwidget(element, context));
    }
    return Column(
      children: list,
    );
  }

  Column buildwidget(Question question, BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          child: SizedBox(
              width: double.infinity,
              child: Text(
                question.title,
                style: AppResources.text_styles.h3,
              )),
        ),
        QuestionsCards(
          question: question,
        )
      ],
    );
  }
}

class _ButtonNextPrevious extends StatelessWidget {
  const _ButtonNextPrevious({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadingTestCubit, ReadingTestState>(
      buildWhen: (previous, current) =>
      previous.currentQuestion != current.currentQuestion ||
          previous.chooseAnswer != current.chooseAnswer,
      builder: (BuildContext context, state) {
        if (state.examQuestion.questions.isEmpty) return const SizedBox();
        if (checkSelectedAnswer(
            state.examQuestion.questions, state.currentQuestion)) {
          return const SizedBox();
        }
        return Row(
          children: [
            Expanded(
                flex: 7,
                child: Card(
                  shadowColor: Colors.white10,
                  color: Colors.transparent,
                  child: OutlinedButton(
                      onPressed: () =>
                          context.read<ReadingTestCubit>().previousQuestion(),
                      child: const ListTile(
                        leading: Icon(
                          Icons.west_outlined,
                          color: Colors.deepPurpleAccent,
                        ),
                        title: FittedBox(
                            child: Text(
                              'Previous',
                              textAlign: TextAlign.center,
                            )),
                      )),
                )),
            Expanded(
                flex: 6,
                child: Card(
                  shadowColor: Colors.white10,
                  color: Colors.transparent,
                  margin: const EdgeInsets.only(left: 10.0),
                  child: OutlinedButton(
                      onPressed: () =>
                          context.read<ReadingTestCubit>().nextQuestion(),
                      child: const ListTile(
                        title: FittedBox(
                            child: Text(
                              'Next',
                              textAlign: TextAlign.center,
                            )),
                        trailing: Icon(
                          Icons.east_outlined,
                          color: Colors.deepPurpleAccent,
                        ),
                      )),
                ))
          ],
        );
      },
    );
  }

  bool checkSelectedAnswer(List<Question> questions, int index) {
    return questions.any((element) =>
    element.id == questions[index].id && element.selectedAnswerId == null);
  }
}

class _ImageAndContent extends StatelessWidget {
  const _ImageAndContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final image = context.select((ReadingTestCubit bloc) => bloc.state.image);
    return BlocBuilder<ReadingTestCubit, ReadingTestState>(
      buildWhen: (previous, current) => previous.image != current.image,
      builder: (BuildContext context, state) {
        if (state.examQuestion.questions.isEmpty) return const SizedBox();
        return Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                state.examQuestion.questions[state.currentQuestion].content,
                style: const TextStyle(fontSize: 15),
              ),
            ),
            image == null ? const SizedBox() : Image.memory(image)
          ],
        );
      },
    );
  }
}




