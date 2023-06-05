import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:toeic/bloc/model/enum.dart';
import 'package:toeic/bloc/model/response_message.dart';
import 'package:toeic/data/di/di.dart';
import 'package:toeic/data/local/internal_storage.dart';
import 'package:toeic/data/model/exam_question.dart';

part 'listening_test_state.dart';

class ListeningTestCubit extends Cubit<ListeningTestState> {
  ListeningTestCubit(this.part, this.fileName, this.audioPlayer)
      : super(ListeningTestState(
            examQuestion: ExamQuestion(id: ''),
            respondMsg: ResponseMessage())) {
    ;
    Future.delayed(
        const Duration(
          milliseconds: 100,
        ),
        _initData);
  }

  final String part;
  final String fileName;
  final AudioPlayer audioPlayer;

  Future<void> _initData() async {
    try {
      state.examQuestion = await getIt
          .get<InternalStorage>()
          .readListeningTestFile(part, fileName);
      state.currentQuestion = 1;
      changeToQuestion(0);
      _setupAudio();
    } catch (e) {
      showMessage(e.toString(), typeMsg: TypeMsg.error);
    }
  }

  _setupAudio() {
    audioPlayer.onPlayerStateChanged.listen((event) {
      emit(state.copyWith(isPlaying: event == PlayerState.playing));
    });
    audioPlayer.onDurationChanged.listen((event) {
      emit(state.copyWith(duration: event));
    });
    audioPlayer.onPositionChanged.listen((event) {
      emit(state.copyWith(position: event));
    });
  }

  void isPlayingChange() async {
    try {
      emit(state.copyWith(isPlaying: !state.isPlaying));
      if (state.isPlaying) {
        await audioPlayer.resume();
      } else {
        await audioPlayer.pause();
      }
    } catch (e) {
      showMessage(e.toString(), typeMsg: TypeMsg.error);
    }
  }

  void _playAudio(Duration delay) {
    final source = state.audio;
    if (source != null) {
      Future.delayed(delay, () => audioPlayer.play(BytesSource(source)));
    }
  }

  void _setAudioSource() {
    final source = state.audio;
    if (source != null) {
      audioPlayer.setSource(BytesSource(source));
    }
  }

  void closing() {
    audioPlayer.dispose();
  }

  void changeToQuestion(int index) async {
    audioPlayer.pause();
    int numquestion = state.examQuestion.questions.length;
    if (0 > index || index >= numquestion) return;
    emit(state.copyWith(currentQuestion: index));

    final imagePath = state.examQuestion.questions[index].image;
    if (imagePath != null) {
      emit(state.copyWith(
          image: await getIt.get<InternalStorage>().readData(imagePath)));
    }

    final audioPath = state.examQuestion.questions[index].audio;
    if (audioPath != null) {
      emit(state.copyWith(
          isPlaying: false,
          audio: await getIt.get<InternalStorage>().readData(audioPath)));
    }

    _setAudioSource();
  }

  nextQuestion() => changeToQuestion(state.currentQuestion + 1);

  previousQuestion() => changeToQuestion(state.currentQuestion - 1);

  void showMessage(String msg, {TypeMsg typeMsg = TypeMsg.info}) {
    state.respondMsg.message = '';
    emit(state.copyWith(
        respondMsg: ResponseMessage(message: msg, typeMsg: typeMsg)));
  }

  void audioPositionChanged(double value) {
    final position = Duration(seconds: value.toInt());
    audioPlayer.seek(position);
  }
}
