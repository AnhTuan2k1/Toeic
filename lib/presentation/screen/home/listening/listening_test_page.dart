import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toeic/application/convert.dart';
import 'package:toeic/bloc/listening/listening_test_cubit.dart';
import 'package:toeic/data/model/question.dart';
import 'package:toeic/presentation/screen/home/listening/answer_card.dart';
import 'package:toeic/presentation/screen/home/widget/dialog.dart';
import 'package:toeic/presentation/screen/home/widget/test_page.dart';
import 'package:toeic/src/app_resources.dart';

class ListeningTestPage extends TestPage {
  const ListeningTestPage(
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
          create: (_) => ListeningTestCubit(part, fileName, AudioPlayer()),
          child: const ListeningTestForm(),
        ));
  }
}

class ListeningTestForm extends StatelessWidget {
  const ListeningTestForm({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<ListeningTestCubit>().closing();
        return true;
      },
      child: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 50,),
                  Row(
                    children: [
                      _IsPlayingIcon(),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _PositionText(),
                          _AudioSlider(),
                          _DurationText()
                        ],
                      ))
                    ],
                  ),
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
    return BlocBuilder<ListeningTestCubit, ListeningTestState>(
        buildWhen: (_, __) => false,
        builder: (context, state) {
          return GestureDetector(
            onTap: () => handleChangeQuestion(context, state).then((value) =>
                context.read<ListeningTestCubit>().changeToQuestion(value)),
            child:
                SizedBox(width: 50, height: 50, child: Icon(Icons.apps_sharp)),
          );
        });
  }

  Future<int?> handleChangeQuestion(
      BuildContext context, ListeningTestState state) async {
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
    return BlocBuilder<ListeningTestCubit, ListeningTestState>(

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
    return BlocBuilder<ListeningTestCubit, ListeningTestState>(
      buildWhen: (previous, current) =>
          previous.currentQuestion != current.currentQuestion,
      builder: (BuildContext context, state) {
        var q = state.examQuestion.questions;
        if (q.isNotEmpty) {
          List<Widget> list = [];
          _buildQuestionAndAnswers(list, q, state.currentQuestion, true);
          _buildQuestionAndAnswers(list, q, state.currentQuestion, false,
              isAdd: false);
          return Column(children: list);
        } else
          return const SizedBox();
      },
    );
  }

  _buildQuestionAndAnswers(List<Widget> list, List<Question> questions,
      int addQuestionIndex, bool isNext,
      {bool isAdd = true}) {
    //add current questionAndAnswer
    if (isAdd) {
      if (isNext) {
        list.add(buildwidget(questions[addQuestionIndex]));
      } else {
        list.insert(0, buildwidget(questions[addQuestionIndex]));
      }
    }

    if (isNext) {
      if (addQuestionIndex < questions.length - 1) {
        //add next questionAndAnswer
        if (questions[addQuestionIndex].id ==
            questions[addQuestionIndex + 1].id) {
          _buildQuestionAndAnswers(
              list, questions, addQuestionIndex + 1, isNext);
        }
      }
    } else {
      if (addQuestionIndex > 0) {
        //add previous questionAndAnswer
        if (questions[addQuestionIndex].id ==
            questions[addQuestionIndex - 1].id) {
          _buildQuestionAndAnswers(
              list, questions, addQuestionIndex - 1, isNext);
        }
      }
    }
  }

  Column buildwidget(Question question) {
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
        AnswerCards(
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
    return BlocBuilder<ListeningTestCubit, ListeningTestState>(
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
                          context.read<ListeningTestCubit>().previousQuestion(),
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
                          context.read<ListeningTestCubit>().nextQuestion(),
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
    final image = context.select((ListeningTestCubit bloc) => bloc.state.image);
    return BlocBuilder<ListeningTestCubit, ListeningTestState>(
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

class _IsPlayingIcon extends StatelessWidget {
  const _IsPlayingIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListeningTestCubit, ListeningTestState>(
        buildWhen: (previous, current) =>
            previous.isPlaying != current.isPlaying,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => context.read<ListeningTestCubit>().isPlayingChange(),
              child: state.isPlaying
                  ? const Icon(
                      Icons.play_circle,
                      size: 50,
                      color: Colors.blue,
                    )
                  : const Icon(
                      Icons.pause_circle,
                      size: 50,
                      color: Colors.lightBlueAccent,
                    ),
            ),
          );
        });
  }
}

class _DurationText extends StatelessWidget {
  const _DurationText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListeningTestCubit, ListeningTestState>(
        buildWhen: (previous, current) => previous.duration != current.duration,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Text(AppConvert.formatDuration(state.duration)),
          );
        });
  }
}

class _PositionText extends StatelessWidget {
  const _PositionText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListeningTestCubit, ListeningTestState>(
        buildWhen: (previous, current) => previous.position != current.position,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(AppConvert.formatDuration(state.position)),
          );
        });
  }
}

class _AudioSlider extends StatelessWidget {
  const _AudioSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListeningTestCubit, ListeningTestState>(
        buildWhen: (previous, current) =>
            previous.duration != current.duration ||
            previous.position != current.position,
        builder: (context, state) {
          return Slider(
              min: 0,
              max: state.duration.inSeconds.toDouble(),
              value: state.position.inSeconds.toDouble(),
              onChanged: (value) => context
                  .read<ListeningTestCubit>()
                  .audioPositionChanged(value));
        });
  }
}
