import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toeic/application/convert.dart';
import 'package:toeic/bloc/timer/timer_bloc.dart';
import 'package:toeic/bloc/writing/writing_test_cubit.dart';
import 'package:toeic/presentation/screen/home/widget/test_page.dart';
import 'package:toeic/presentation/screen/home/widget/textfield_widget.dart';
import 'package:toeic/presentation/screen/home/writing/writing_direction_content.dart';

class WritingTestPage extends TestPage {
  const WritingTestPage(
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
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => WritingTestCubit(part, fileName),
            ),
            BlocProvider(
              create: (BuildContext context) => TimerBloc(ticker: Ticker()),
            ),
          ],
          child: WritingTestForm(part),
        ));
  }
}

class WritingTestForm extends StatelessWidget {
  const WritingTestForm(this.part, {super.key});

  final String part;

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return MultiBlocListener(
      listeners: [
        BlocListener<WritingTestCubit, WritingTestState>(
          listenWhen: (previous, current) =>
              previous.countdown != current.countdown,
          listener: (BuildContext context, state) {
            if (state.countdown > 0) {
              context
                  .read<TimerBloc>()
                  .add(TimerStarted(duration: state.countdown));
            }
          },
        ),
        BlocListener<TimerBloc, TimerState>(
          listenWhen: (previous, current) => current is TimerRunComplete,
          listener: (context, state) {
            // context.read<WritingTestCubit>().countdownComplete();
            // context.read<WritingTestCubit>().nextProcess();
          },
        ),
      ],
      child: Stack(
        children: [
          const SizedBox(width: double.infinity, height: double.infinity),
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  const _CurrentQuestion(),
                  const SizedBox(height: 5),
                  _Directions(part),
                  const _ImageAndContent(),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: _Input(),
                  ),
                  const _Explanation(),
                  const SizedBox(height: 20)
                ],
              ),
            ),
          ),
          const Positioned(
            height: 50,
            top: 5,
            left: 10,
            right: 10,
            child: _ButtonNextPrevious(),
          ),
          _Direction(part),
        ],
      ),
    );
  }
}

class _CurrentQuestion extends StatelessWidget {
  const _CurrentQuestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int index =
        context.select((WritingTestCubit cubit) => cubit.state.currentQuestion);
    return index < 0
        ? SizedBox()
        : Text(
            'Question ${index + 1}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          );
  }
}

class _Input extends StatelessWidget {
  const _Input({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WritingTestCubit, WritingTestState>(
      buildWhen: (previous, current) =>
          previous.currentQuestion != current.currentQuestion,
      builder: (BuildContext context, state) {
        var questions = state.examQuestion.questions;
        if (questions.isEmpty) return const SizedBox();
        return TextFieldWidget(
          hintText: 'Write your answer here',
          maxLines: questions[state.currentQuestion].content == '' ? null : 15,
          enabledBorder: const BorderSide(color: Colors.black54),
          focusedBorder: const BorderSide(color: Colors.black54),
          onChanged: (value) =>
              context.read<WritingTestCubit>().inputChange(value),
          controller: TextEditingController(
              text: questions[state.currentQuestion].audio),
        );
      },
    );
  }
}

class _Explanation extends StatelessWidget {
  const _Explanation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      color: Colors.white,
      child: ExpandablePanel(
          collapsed: ExpandableButton(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Padding(padding: EdgeInsets.all(16), child: Text('Explanation')),
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
                      padding: EdgeInsets.all(16), child: Text('Explanation:')),
                  Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Icon(Icons.arrow_drop_up),
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: BlocBuilder<WritingTestCubit, WritingTestState>(
                    buildWhen: (previous, current) =>
                        previous.currentQuestion != current.currentQuestion,
                    builder: (BuildContext context, state) {
                      if (state.examQuestion.questions.isEmpty)
                        return const SizedBox();
                      return Text(state.examQuestion
                          .questions[state.currentQuestion].explanation);
                    },
                  )),
            ],
          ))),
    );
  }
}

class _ImageAndContent extends StatelessWidget {
  const _ImageAndContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final image = context.select((WritingTestCubit bloc) => bloc.state.image);
    return BlocBuilder<WritingTestCubit, WritingTestState>(
      buildWhen: (previous, current) =>
          previous.currentQuestion != current.currentQuestion,
      builder: (BuildContext context, state) {
        var questions = state.examQuestion.questions;
        if (questions.isEmpty) return const SizedBox();
        return Column(
          children: [
            image == null
                ? const SizedBox()
                : AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    child: Image.memory(
                      image,
                      key: ValueKey<String>(image.toString()),
                    )),
            const SizedBox(height: 5),
            if (questions[state.currentQuestion].content != '')
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black54)),
                  child: Text(
                    questions[state.currentQuestion].content,
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Text(
                questions[state.currentQuestion].title,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: questions[state.currentQuestion].content == ''
                        ? FontWeight.bold
                        : null),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _ButtonNextPrevious extends StatelessWidget {
  const _ButtonNextPrevious({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WritingTestCubit, WritingTestState>(
        buildWhen: (previous, current) =>
            previous.currentQuestion != current.currentQuestion,
        builder: (BuildContext context, state) {
          var questions = state.examQuestion.questions;
          if (questions.isEmpty) return const SizedBox();
          return Row(
            children: [
              Expanded(
                  flex: 5,
                  child: questions.length == 1 ? const SizedBox() : GestureDetector(
                    onTap: () =>
                        context.read<WritingTestCubit>().previousQuestion(),
                    child: const Card(
                      shadowColor: Colors.white10,
                      color: Colors.transparent,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Back',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  )),
              Expanded(
                  flex: 3,
                  child: Builder(builder: (context) {
                    final seconds =
                        context.select((TimerBloc bloc) => bloc.state.duration);
                    return Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Text(
                        AppConvert.formatDurationSeconds2(seconds),
                        style: const TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    );
                  })),
              Expanded(
                  flex: 5,
                  child: questions.length == 1 ? const SizedBox() : GestureDetector(
                    onTap: () =>
                        context.read<WritingTestCubit>().nextQuestion(),
                    child: const Card(
                      shadowColor: Colors.white10,
                      color: Colors.transparent,
                      margin: EdgeInsets.only(left: 10.0),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Next',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ))
            ],
          );
        });
  }
}

class _Directions extends StatelessWidget {
  const _Directions(this.part, {Key? key}) : super(key: key);
  final String part;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      child: Text(
        WritingDirectionContent.getDiretions(part),
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: 17),
      ),
    );
  }
}

class _Direction extends StatelessWidget {
  const _Direction(this.part, {Key? key}) : super(key: key);
  final String part;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<WritingTestCubit, WritingTestState, int>(
        selector: (state) => state.process,
        builder: (context, state) {
          print(state);
          if (!(state == 1 || state == 4 || state == 8))
            return const SizedBox();
          return Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.white,
                padding: const EdgeInsets.all(15),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(width: double.infinity, height: 30),
                      Text(
                        WritingDirectionContent.getTitle(part),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        WritingDirectionContent.getContent(part),
                        style: const TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  left: 100,
                  right: 100,
                  bottom: 50,
                  child: OutlinedButton(
                      onPressed: () =>
                          context.read<WritingTestCubit>().nextProcess(),
                      child: const Text(
                        'Next',
                        style: TextStyle(fontSize: 18),
                      )))
            ],
          );
        });
  }
}
