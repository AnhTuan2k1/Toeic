import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:toeic/bloc/model/enum.dart';
import 'package:toeic/bloc/model/response_message.dart';
import 'package:toeic/data/di/di.dart';
import 'package:toeic/data/local/internal_storage.dart';
import 'package:toeic/data/model/exam_question.dart';
import 'package:toeic/src/app_resources.dart';

part 'speaking_test_state.dart';

class SpeakingTestCubit extends Cubit<SpeakingTestState> {
  SpeakingTestCubit(this.part, this.fileName, this.audioPlayer)
      : super(SpeakingTestState(
      examQuestion: ExamQuestion(id: ''),
      respondMsg: ResponseMessage())) {
    Future.delayed(
        const Duration(
          milliseconds: 100,
        ),
        _initData);
  }

  final String part;
  final String fileName;
  final AudioPlayer audioPlayer;
  Uint8List? audioSource;

  Future<void> _initData() async {
    try {
      state.examQuestion = await getIt
          .get<InternalStorage>()
          .readSpeakingTestFile(part, fileName);
      _setPart(part);
      _setupAudio();
    } catch (e) {
      showMessage(e.toString(), typeMsg: TypeMsg.error);
    }
  }

  _setupAudio() {
    audioPlayer.onPlayerComplete.listen((event) {
      nextProcess();
    });
  }

  void countdownComplete() {
    emit(state.copyWith(countdown: 0, isPreparing: -1));
  }

  void showMessage(String msg, {TypeMsg typeMsg = TypeMsg.info}) {
    state.respondMsg.message = '';
    emit(state.copyWith(
        respondMsg: ResponseMessage(message: msg, typeMsg: typeMsg)));
  }

  void nextProcess() {
    switch (part) {
      case 'q12':
        if (state.process <= 18) _setProcess(state.process + 1);
        break;
      case 'q34':
        if (state.process <= 37) _setProcess(state.process + 1);
        break;
      case 'q57':
        if (state.process <= 69) _setProcess(state.process + 1);
        break;
      case 'q810':
        if (state.process <= 106) _setProcess(state.process + 1);
        break;
      case 'q11':
        if (state.process <= 117) _setProcess(state.process + 1);
        break;
    }
  }

  //set new audio and play
  void _playAudio(Source source) {
    audioPlayer.play(source);
  }

  //init process
  void _setPart(String part) {
    switch (part) {
      case 'q12':
        _setProcess(1);
        break;
      case 'q34':
        _setProcess(20);
        break;
      case 'q57':
        _setProcess(39);
        break;
      case 'q810':
        _setProcess(71);
        break;
      case 'q11':
        _setProcess(108);
        break;
    }
  }

  void _setProcess(int process) {
    emit(state.copyWith(process: process));
    switch (process) {
      case 1: //play direction q12
        _playAudio(AssetSource(AppResources.audios.speaking_q12_direction));
        break;

    //question 1 begin
      case 2: // q1 play begin_preparing_now sound
        _playAudio(AssetSource(AppResources.audios.begin_preparing_now));
        _setQuestion(0);
        break;
      case 3: // q1 play beep sound
        _playAudio(AssetSource(AppResources.audios.beep));
        emit(state.copyWith(isPreparing: 1));
        break;
      case 4: // q1 countdown 45s
        _setCountdown(45);
        break;
      case 5: // q1 play beep sound
        _playAudio(AssetSource(AppResources.audios.beep));
        break;
      case 6: // q1 play begin_reading_now sound
        _playAudio(AssetSource(AppResources.audios.begin_reading_now));
        break;
      case 7: // q1 play beep sound
        _playAudio(AssetSource(AppResources.audios.beep));
        emit(state.copyWith(isPreparing: 0));
        break;
      case 8: // q1 countdown 45s
        _setCountdown(45);
        break;
      case 9: // q1 play beep sound
        _playAudio(AssetSource(AppResources.audios.beep));
        break;

    // stop time
      case 10:
        emit(state.copyWith(stopTime: true));
        Future.delayed(const Duration(seconds: 2), () {
          emit(state.copyWith(stopTime: false));
          nextProcess();
        });
        break;

    //question 2 begin
      case 11:
        _playAudio(AssetSource(AppResources.audios.begin_preparing_now));
        _setQuestion(state.currentQuestion + 1);
        break;
      case 12:
        _playAudio(AssetSource(AppResources.audios.beep));
        emit(state.copyWith(isPreparing: 1));
        break;
      case 13:
        _setCountdown(45);
        break;
      case 14:
        _playAudio(AssetSource(AppResources.audios.beep));
        break;
      case 15:
        _playAudio(AssetSource(AppResources.audios.begin_reading_now));
        break;
      case 16:
        _playAudio(AssetSource(AppResources.audios.beep));
        emit(state.copyWith(isPreparing: 0));
        break;
      case 17:
        _setCountdown(45);
        break;
      case 18:
        _playAudio(AssetSource(AppResources.audios.beep));
        break;
    // stop time
      case 19:
        emit(state.copyWith(stopTime: true));
        Future.delayed(const Duration(seconds: 2), () {
          emit(state.copyWith(stopTime: false));
          nextProcess();
        });
        break;

    //////////////////////////////////////////////////////////
      case 20: //play direction q34
        _playAudio(AssetSource(AppResources.audios.speaking_q34_direction));
        break;

    //question 3 begin
      case 21:
        _playAudio(AssetSource(AppResources.audios.begin_preparing_now));
        _setQuestion(state.currentQuestion + 1);
        break;
      case 22:
        _playAudio(AssetSource(AppResources.audios.beep));
        emit(state.copyWith(isPreparing: 1));
        break;
      case 23:
        _setCountdown(45);
        break;
      case 24:
        _playAudio(AssetSource(AppResources.audios.beep));
        break;
      case 25:
        _playAudio(AssetSource(AppResources.audios.begin_speaking_now));
        break;
      case 26:
        _playAudio(AssetSource(AppResources.audios.beep));
        emit(state.copyWith(isPreparing: 0));
        break;
      case 27:
        _setCountdown(30);
        break;
      case 28:
        _playAudio(AssetSource(AppResources.audios.beep));
        break;

    // stop time
      case 29:
        emit(state.copyWith(stopTime: true));
        Future.delayed(const Duration(seconds: 2), () {
          emit(state.copyWith(stopTime: false));
          nextProcess();
        });
        break;

    //question 4 begin
      case 30:
        _playAudio(AssetSource(AppResources.audios.begin_preparing_now));
        _setQuestion(state.currentQuestion + 1);
        break;
      case 31:
        _playAudio(AssetSource(AppResources.audios.beep));
        emit(state.copyWith(isPreparing: 1));
        break;
      case 32:
        _setCountdown(45);
        break;
      case 33:
        _playAudio(AssetSource(AppResources.audios.beep));
        break;
      case 34:
        _playAudio(AssetSource(AppResources.audios.begin_speaking_now));
        break;
      case 35:
        _playAudio(AssetSource(AppResources.audios.beep));
        emit(state.copyWith(isPreparing: 0));
        break;
      case 36:
        _setCountdown(45);
        break;
      case 37:
        _playAudio(AssetSource(AppResources.audios.beep));
        break;

    // stop time
      case 38:
        emit(state.copyWith(stopTime: true));
        Future.delayed(const Duration(seconds: 2), () {
          emit(state.copyWith(stopTime: false));
          nextProcess();
        });
        break;

    //////////////////////////////////////////////////////////
      case 39: //play direction q57
        _playAudio(AssetSource(AppResources.audios.speaking_q57_direction));
        break;

    //play general content q57
      case 40:
        _setQuestion(state.currentQuestion + 1).whenComplete(() =>
        {if (audioSource != null) _playAudio(BytesSource(audioSource!))});
        break;

    //question 5 begin
      case 41:
        _setQuestion(state.currentQuestion + 1).whenComplete(() =>
        {if (audioSource != null) _playAudio(BytesSource(audioSource!))});
        break;
      case 42:
        _playAudio(AssetSource(AppResources.audios.begin_preparing_now));
        break;
      case 43:
        _playAudio(AssetSource(AppResources.audios.beep));
        emit(state.copyWith(isPreparing: 1));
        break;
      case 44:
        _setCountdown(3);
        break;
      case 45:
        _playAudio(AssetSource(AppResources.audios.beep));
        break;
      case 46:
        _playAudio(AssetSource(AppResources.audios.begin_speaking_now));
        break;
      case 47:
        _playAudio(AssetSource(AppResources.audios.beep));
        emit(state.copyWith(isPreparing: 0));
        break;
      case 48:
        _setCountdown(15);
        break;
      case 49:
        _playAudio(AssetSource(AppResources.audios.beep));
        break;

    // stop time
      case 50:
        emit(state.copyWith(stopTime: true));
        Future.delayed(const Duration(seconds: 2), () {
          emit(state.copyWith(stopTime: false));
          nextProcess();
        });
        break;

    //question 6 begin
      case 51:
        _setQuestion(state.currentQuestion + 1).whenComplete(() =>
        {if (audioSource != null) _playAudio(BytesSource(audioSource!))});
        break;
      case 52:
        _playAudio(AssetSource(AppResources.audios.begin_preparing_now));
        break;
      case 53:
        _playAudio(AssetSource(AppResources.audios.beep));
        emit(state.copyWith(isPreparing: 1));
        break;
      case 54:
        _setCountdown(3);
        break;
      case 55:
        _playAudio(AssetSource(AppResources.audios.beep));
        break;
      case 56:
        _playAudio(AssetSource(AppResources.audios.begin_speaking_now));
        break;
      case 57:
        _playAudio(AssetSource(AppResources.audios.beep));
        emit(state.copyWith(isPreparing: 0));
        break;
      case 58:
        _setCountdown(15);
        break;
      case 59:
        _playAudio(AssetSource(AppResources.audios.beep));
        break;

    // stop time
      case 60:
        emit(state.copyWith(stopTime: true));
        Future.delayed(const Duration(seconds: 2), () {
          emit(state.copyWith(stopTime: false));
          nextProcess();
        });
        break;

    //question 7 begin
      case 61:
        _setQuestion(state.currentQuestion + 1).whenComplete(() =>
        {if (audioSource != null) _playAudio(BytesSource(audioSource!))});
        break;
      case 62:
        _playAudio(AssetSource(AppResources.audios.begin_preparing_now));
        break;
      case 63:
        _playAudio(AssetSource(AppResources.audios.beep));
        emit(state.copyWith(isPreparing: 1));
        break;
      case 64:
        _setCountdown(3);
        break;
      case 65:
        _playAudio(AssetSource(AppResources.audios.beep));
        break;
      case 66:
        _playAudio(AssetSource(AppResources.audios.begin_speaking_now));
        break;
      case 67:
        _playAudio(AssetSource(AppResources.audios.beep));
        emit(state.copyWith(isPreparing: 0));
        break;
      case 68:
        _setCountdown(30);
        break;
      case 69:
        _playAudio(AssetSource(AppResources.audios.beep));
        break;

    // stop time
      case 70:
        emit(state.copyWith(stopTime: true));
        Future.delayed(const Duration(seconds: 2), () {
          emit(state.copyWith(stopTime: false));
          nextProcess();
        });
        break;

    //////////////////////////////////////////////////////////
      case 71: //play direction q810
        _playAudio(AssetSource(AppResources.audios.speaking_q810_direction));
        break;

    //question 8 - 10 reading time
      case 72:
        _playAudio(AssetSource(AppResources.audios.begin_preparing_now));
        _setQuestion(state.currentQuestion + 1);
        break;
      case 73:
        _playAudio(AssetSource(AppResources.audios.beep));
        emit(state.copyWith(isPreparing: 1));
        break;
      case 74:
        _setCountdown(45);
        break;
      case 75:
        _playAudio(AssetSource(AppResources.audios.beep));
        break;
      //question 8 begin
      case 76:
        _setQuestion(state.currentQuestion + 1).whenComplete(() =>
        {if (audioSource != null) _playAudio(BytesSource(audioSource!))});
        break;
      case 77:
        _playAudio(AssetSource(AppResources.audios.begin_preparing_now));
        break;
      case 78:
        _playAudio(AssetSource(AppResources.audios.beep));
        emit(state.copyWith(isPreparing: 1));
        break;
      case 79:
        _setCountdown(3);
        break;
      case 80:
        _playAudio(AssetSource(AppResources.audios.beep));
        break;
      case 81:
        _playAudio(AssetSource(AppResources.audios.begin_speaking_now));
        break;
      case 82:
        _playAudio(AssetSource(AppResources.audios.beep));
        emit(state.copyWith(isPreparing: 0));
        break;
      case 83:
        _setCountdown(15);
        break;
      case 84:
        _playAudio(AssetSource(AppResources.audios.beep));
        break;

    // stop time
      case 85:
        emit(state.copyWith(stopTime: true));
        Future.delayed(const Duration(seconds: 2), () {
          emit(state.copyWith(stopTime: false));
          nextProcess();
        });
        break;

    //question 9 begin
      case 86:
        _setQuestion(state.currentQuestion + 1).whenComplete(() =>
        {if (audioSource != null) _playAudio(BytesSource(audioSource!))});
        break;
      case 87:
        _playAudio(AssetSource(AppResources.audios.begin_preparing_now));
        break;
      case 88:
        _playAudio(AssetSource(AppResources.audios.beep));
        emit(state.copyWith(isPreparing: 1));
        break;
      case 89:
        _setCountdown(3);
        break;
      case 90:
        _playAudio(AssetSource(AppResources.audios.beep));
        break;
      case 91:
        _playAudio(AssetSource(AppResources.audios.begin_speaking_now));
        break;
      case 92:
        _playAudio(AssetSource(AppResources.audios.beep));
        emit(state.copyWith(isPreparing: 0));
        break;
      case 93:
        _setCountdown(15);
        break;
      case 94:
        _playAudio(AssetSource(AppResources.audios.beep));
        break;

    // stop time
      case 95:
        emit(state.copyWith(stopTime: true));
        Future.delayed(const Duration(seconds: 2), () {
          emit(state.copyWith(stopTime: false));
          nextProcess();
        });
        break;

    //question 10 begin
      case 96:
        _setQuestion(state.currentQuestion + 1).whenComplete(() =>
        {if (audioSource != null) _playAudio(BytesSource(audioSource!))});
        break;
      case 97:
        _playAudio(AssetSource(AppResources.audios.now_listen_again));
        break;
      case 98:
        if (audioSource != null) _playAudio(BytesSource(audioSource!));
        break;
      case 99:
        _playAudio(AssetSource(AppResources.audios.begin_preparing_now));
        break;
      case 100:
        _playAudio(AssetSource(AppResources.audios.beep));
        emit(state.copyWith(isPreparing: 1));
        break;
      case 101:
        _setCountdown(3);
        break;
      case 102:
        _playAudio(AssetSource(AppResources.audios.beep));
        break;
      case 103:
        _playAudio(AssetSource(AppResources.audios.begin_speaking_now));
        break;
      case 104:
        _playAudio(AssetSource(AppResources.audios.beep));
        emit(state.copyWith(isPreparing: 0));
        break;
      case 105:
        _setCountdown(30);
        break;
      case 106:
        _playAudio(AssetSource(AppResources.audios.beep));
        break;

    // stop time
      case 107:
        emit(state.copyWith(stopTime: true));
        Future.delayed(const Duration(seconds: 2), () {
          emit(state.copyWith(stopTime: false));
          nextProcess();
        });
        break;

    //////////////////////////////////////////////////////////
      case 108: //play direction q11
        _playAudio(AssetSource(AppResources.audios.speaking_q11_direction));
        break;

    //question 11 begin
      case 109:
        _setQuestion(state.currentQuestion + 1).whenComplete(() =>
        {if (audioSource != null) _playAudio(BytesSource(audioSource!))});
        break;
      case 110:
        _playAudio(AssetSource(AppResources.audios.begin_preparing_now));
        break;
      case 111:
        _playAudio(AssetSource(AppResources.audios.beep));
        emit(state.copyWith(isPreparing: 1));
        break;
      case 112:
        _setCountdown(45);
        break;
      case 113:
        _playAudio(AssetSource(AppResources.audios.beep));
        break;
      case 114:
        _playAudio(AssetSource(AppResources.audios.begin_speaking_now));
        break;
      case 115:
        _playAudio(AssetSource(AppResources.audios.beep));
        emit(state.copyWith(isPreparing: 0));
        break;
      case 116:
        _setCountdown(60);
        break;
      case 117:
        _playAudio(AssetSource(AppResources.audios.beep));
        break;

    // stop time
      case 118:
        emit(state.copyWith(stopTime: true));
        Future.delayed(const Duration(seconds: 2), () {
          emit(state.copyWith(stopTime: false));
          nextProcess();
        });
        break;
    }
  }

  Future<void> _setQuestion(int index) async {
    emit(state.copyWith(currentQuestion: index));
    final questions = state.examQuestion.questions;

    final imagePath = questions
        .firstWhere((element) => questions[index].title == element.title).image;
    if (imagePath != null) {
      emit(state.copyWith(
          image: await getIt.get<InternalStorage>().readData(imagePath)));
    } else {
      state.image = null;
      emit(state);
    }

    final audioPath = questions[index].audio;
    if (audioPath != null) {
      audioSource = await getIt.get<InternalStorage>().readData(audioPath);
    }
  }

  void _setCountdown(int seconds) {
    emit(state.copyWith(countdown: seconds));
  }

  @override
  Future<void> close() {
    audioPlayer.dispose();
    return super.close();
  }
}
