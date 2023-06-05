import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toeic/application/convert.dart';
import 'package:toeic/bloc/listening/listening_test_cubit.dart';
import 'package:toeic/presentation/screen/home/widget/answer_card.dart';
import 'package:toeic/presentation/screen/home/widget/test_page.dart';
import 'package:toeic/presentation/widget/card_background.dart';

class ListeningTestPage extends TestPage {
  const ListeningTestPage(
      {super.key,
      required super.fileName,
      required super.part,
      super.title,
      super.isDownloaded});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Test $title'),
          elevation: 0,
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
                  CardBackGround(
                    margin: EdgeInsets.all(10.0),
                    child: _ImageAndContent(),
                  ),
                  QuestionAndAnswers(),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 30.0,
            left: 20,
            right: 20,
            child: _ButtonChangeQuestion(),
          ),
        ],
      ),
    );
  }
}

class QuestionAndAnswers extends StatelessWidget {
  const QuestionAndAnswers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListeningTestCubit, ListeningTestState>(
      buildWhen: (previous, current) =>
          previous.currentQuestion != current.currentQuestion,
      builder: (BuildContext context, state) {
        return state.examQuestion.questions.isNotEmpty
            ? AnswerCards(
                question: state.examQuestion.questions[state.currentQuestion],
              )
            : const SizedBox();
      },
    );
  }
}

class _ButtonChangeQuestion extends StatelessWidget {
  const _ButtonChangeQuestion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Question ${state.currentQuestion + 1}',
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: image == null ? const SizedBox() : Image.memory(image),
            )
          ],
        );
      },
    );
  }
}

class _IsPlayingIcon extends StatelessWidget {
  const _IsPlayingIcon({
    Key? key,
  }) : super(key: key);

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
  const _DurationText({
    Key? key,
  }) : super(key: key);

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
  const _PositionText({
    Key? key,
  }) : super(key: key);

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
  const _AudioSlider({
    Key? key,
  }) : super(key: key);

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
