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
      print('-----audioPlayer--------onPlayerComplete-------$state---------');
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

  void nextProcess(){
    switch(part){
      case 'q12':
        if(state.process <= 17) _setProcess(state.process + 1);
        break;
      case 'q34':
        break;
      case 'q57':
        break;
      case 'q810':
        break;
      case 'q11':
        break;
    }
  }

  //set new audio and play
  void _playAudio(Source source) {
    audioPlayer.play(source);
  }

  //init process
  void _setPart(String part) {
    switch(part){
      case 'q12':
        _setProcess(1);
        break;
      case 'q34':
        break;
      case 'q57':
        break;
      case 'q810':
        break;
      case 'q11':
        break;
    }
  }

  void _setProcess(int process) {
    emit(state.copyWith(process: process));
    switch(process){
      case 1:  //play direction q12
        _playAudio(AssetSource(AppResources.audios.speaking_q12_direction));
        break;

    //question 1 begin
      case 2:  // q1 play begin_preparing_now sound
        _playAudio(AssetSource(AppResources.audios.begin_preparing_now));
        _setQuestion(0);
        break;
      case 3:  // q1 play beep sound
        _playAudio(AssetSource(AppResources.audios.beep));
        emit(state.copyWith(isPreparing: 1));
        break;
      case 4:  // q1 countdown 45s
        _setCountdown(45);
        break;
      case 5:  // q1 play beep sound
        _playAudio(AssetSource(AppResources.audios.beep));
        break;
      case 6:  // q1 play begin_reading_now sound
        _playAudio(AssetSource(AppResources.audios.begin_reading_now));
        break;
      case 7:  // q1 play beep sound
        _playAudio(AssetSource(AppResources.audios.beep));
        emit(state.copyWith(isPreparing: 0));
        break;
      case 8:  // q1 countdown 45s
        _setCountdown(45);
        break;
      case 9:  // q1 play beep sound
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
        _setQuestion(1);
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
    }
  }

  void _setQuestion(int index) {
    emit(state.copyWith(currentQuestion: index));
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
