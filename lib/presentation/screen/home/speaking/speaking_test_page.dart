import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toeic/application/convert.dart';
import 'package:toeic/bloc/speaking/speaking_test_cubit.dart';
import 'package:toeic/bloc/timer/timer_bloc.dart';
import 'package:toeic/presentation/screen/home/speaking/speaking_direction_content.dart';
import 'package:toeic/presentation/screen/home/widget/dialog.dart';
import 'package:toeic/presentation/screen/home/widget/snack_bar.dart';
import 'package:toeic/presentation/screen/home/widget/test_page.dart';

class SpeakingTestPage extends TestPage {
  const SpeakingTestPage(
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
              create: (_) => SpeakingTestCubit(part, fileName, AudioPlayer()),
            ),
            BlocProvider(
              create: (BuildContext context) => TimerBloc(ticker: Ticker()),
            ),
          ],
          child: SpeakingTestForm(part),
        ));
  }
}

class SpeakingTestForm extends StatelessWidget {
  const SpeakingTestForm(this.part, {super.key});

  final String part;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MultiBlocListener(
      listeners: [
        BlocListener<SpeakingTestCubit, SpeakingTestState>(
          listenWhen: (previous, current) =>
              previous.countdown != current.countdown,
          listener: (BuildContext context, state) {
            context
                .read<TimerBloc>()
                .add(TimerStarted(duration: state.countdown));
          },
        ),
        BlocListener<TimerBloc, TimerState>(
          listenWhen: (previous, current) => current is TimerRunComplete,
          listener: (context, state) {
            context.read<SpeakingTestCubit>().countdownComplete();
            context.read<SpeakingTestCubit>().nextProcess();
          },
        ),
      ],
      child: Stack(
        children: [
          const SizedBox(width: double.infinity, height: double.infinity),
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: const [
                  SizedBox(height: 30),
                  _ImageAndContent(),
                  SizedBox(height: 100)
                ],
              ),
            ),
          ),
          const Positioned(
              left: 1, right: 1, bottom: 1, child: _PreparationBox()),
          Positioned(
              top: size.height * 0.2,
              left: 20,
              right: 20,
              child: const _StopTime()),
          _Direction(part),
        ],
      ),
    );
  }
}

class _PreparationBox extends StatelessWidget {
  const _PreparationBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int isPreparing =
        context.select((SpeakingTestCubit cubit) => cubit.state.isPreparing);

    return isPreparing != 1 && isPreparing != 0
        ? const SizedBox()
        : Column(
            children: [
              Container(
                padding: const EdgeInsets.all(2.0),
                color: Colors.black,
                child: Column(
                  children: [
                    const SizedBox(height: 2),
                    isPreparing == 1
                        ? const Text('PREPARATION TIME',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500))
                        : const Text('RESPONSE TIME',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500)),
                    const SizedBox(height: 2),
                    Container(
                      color: Colors.white,
                      width: 185,
                      child: Builder(builder: (context) {
                        final seconds = context
                            .select((TimerBloc bloc) => bloc.state.duration);
                        return Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Text(
                            AppConvert.formatDurationSeconds(seconds),
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),
              TextButton(
                  onPressed: () =>
                      context.read<TimerBloc>().add(TimerTicked(duration: 0)),
                  child: Text(
                    'Skip The Time',
                    style: TextStyle(fontSize: 18),
                  ))
            ],
          );
  }
}

class _ImageAndContent extends StatelessWidget {
  const _ImageAndContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final image = context.select((SpeakingTestCubit bloc) => bloc.state.image);
    return BlocBuilder<SpeakingTestCubit, SpeakingTestState>(
      buildWhen: (previous, current) =>
          previous.currentQuestion != current.currentQuestion,
      builder: (BuildContext context, state) {
        if (state.examQuestion.questions.isEmpty) return const SizedBox();
        return Column(
          children: [
            Text(
              state.examQuestion.questions[state.currentQuestion].title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            image == null ? const SizedBox() : Image.memory(image),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Text(
                state.examQuestion.questions[state.currentQuestion].content,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.justify,
              ),
            )
          ],
        );
      },
    );
  }
}

class _StopTime extends StatelessWidget {
  const _StopTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stopTime =
        context.select((SpeakingTestCubit cubit) => cubit.state.stopTime);
    return stopTime
        ? Column(
            children: [
              Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.blueAccent.shade400.withAlpha(210),
                      Colors.redAccent.shade200.withAlpha(230),
                    ],
                  )),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Text(
                          'Stop Talking',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                        Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(10),
                          child: const Text(
                              'Your response time has ended. Stop speaking now.\n\nYou will automatically proceed to the next question after your response has been saved. This may take several second.',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 19)),
                        )
                      ],
                    ),
                  ))
            ],
          )
        : const SizedBox();
  }
}

class _Direction extends StatelessWidget {
  const _Direction(this.part, {Key? key}) : super(key: key);
  final String part;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SpeakingTestCubit, SpeakingTestState, int>(
        selector: (state) => state.process,
        builder: (context, state) {
          if (state != 1 &&
              state != 20 &&
              state != 39 &&
              state != 71 &&
              state != 108) return const SizedBox();
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
                        SpeakingDirectionContent.getTitle(part),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        SpeakingDirectionContent.getContent(part),
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
                          context.read<SpeakingTestCubit>().nextProcess(),
                      child: const Text(
                        'Skip',
                        style: TextStyle(fontSize: 18),
                      )))
            ],
          );
        });
  }
}
