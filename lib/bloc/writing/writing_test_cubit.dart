import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:toeic/bloc/model/enum.dart';
import 'package:toeic/bloc/model/response_message.dart';
import 'package:toeic/data/di/di.dart';
import 'package:toeic/data/local/internal_storage.dart';
import 'package:toeic/data/model/exam_question.dart';

part 'writing_test_state.dart';

class WritingTestCubit extends Cubit<WritingTestState> {
  WritingTestCubit(this.part, this.fileName)
      : super(WritingTestState(
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

  Future<void> _initData() async {
    try {
      state.examQuestion = await getIt
          .get<InternalStorage>()
          .readWritingTestFile(part, fileName);
      _initProcess(part);
    } catch (e) {
      showMessage(e.toString(), typeMsg: TypeMsg.error);
    }
  }

  void countdownComplete() {
    emit(state.copyWith(countdown: 0));
  }

  void showMessage(String msg, {TypeMsg typeMsg = TypeMsg.info}) {
    state.respondMsg.message = '';
    emit(state.copyWith(
        respondMsg: ResponseMessage(message: msg, typeMsg: typeMsg)));
  }

  void nextQuestion() {
    if (state.currentQuestion < state.examQuestion.questions.length - 1) {
      _setQuestion(state.currentQuestion + 1);
    }
  }

  void previousQuestion() {
    if (state.currentQuestion > 0) _setQuestion(state.currentQuestion - 1);
  }

  void nextProcess() {
    switch (part) {
      case 'q15':
        if (state.process <= 2) _setProcess(state.process + 1);
        break;
      case 'q67':
        if (state.process <= 6) _setProcess(state.process + 1);
        break;
      case 'q8':
        if (state.process <= 9) _setProcess(state.process + 1);
        break;
    }
  }

  void _initProcess(String part) {
    switch (part) {
      case 'q15':
        _setProcess(1);
        break;
      case 'q67':
        _setProcess(4);
        break;
      case 'q8':
        _setProcess(8);
        break;
    }
  }

  void _setProcess(int process) {
    emit(state.copyWith(process: process));
    switch (process) {
      case 1:
        break;
      case 2:
        _setCountdown(8 * 60);
        state.currentQuestion = -1;
        _setQuestion(0);
        break;
      case 3:
        break;
      case 4:
        break;
      case 5:
        _setCountdown(10 * 60);
        print("oke");
        state.currentQuestion = -1;
        _setQuestion(0);
        break;
      case 6:
        _setCountdown(10 * 60);
        break;
      case 7:
        break;
      case 8:
        break;
      case 9:
        _setCountdown(30 * 60);
        state.currentQuestion = -1;
        _setQuestion(0);
        break;
      case 10:
        break;
    }
  }

  Future<void> _setQuestion(int index) async {
    emit(state.copyWith(currentQuestion: index));
    final questions = state.examQuestion.questions;

    final imagePath = questions[index].image;
    if (imagePath != null) {
      emit(state.copyWith(
          image: await getIt.get<InternalStorage>().readData(imagePath)));
    } else {
      state.image = null;
      emit(state);
    }
  }

  void _setCountdown(int seconds) {
    emit(state.copyWith(countdown: seconds));
  }

  void inputChange(String value) {
    state.examQuestion.questions[state.currentQuestion].audio = value;
  }

  Future<void> _writeData() async {
    String filePath = '/ToeicTest/writing/$part/$fileName';
    getIt.get<InternalStorage>().writeTestFile(filePath, state.examQuestion);
  }

  @override
  Future<void> close() {
    _writeData();
    return super.close();
  }

}
