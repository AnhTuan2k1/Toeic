import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:toeic/bloc/model/enum.dart';
import 'package:toeic/bloc/model/response_message.dart';
import 'package:toeic/data/di/di.dart';
import 'package:toeic/data/local/internal_storage.dart';
import 'package:toeic/data/model/exam_question.dart';

part 'reading_test_state.dart';

class ReadingTestCubit extends Cubit<ReadingTestState> {
  ReadingTestCubit(this.part, this.fileName)
      : super(ReadingTestState(
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
          .readReadingTestFile(part, fileName);
      state.currentQuestion = 1;
      changeToQuestion(0);
    } catch (e) {
      showMessage(e.toString(), typeMsg: TypeMsg.error);
    }
  }

  void changeToQuestion(int? index) async {
    if (index == null) return;
    final questions = state.examQuestion.questions;
    int numquestion = questions.length;
    if (0 > index || index >= numquestion) return;
    emit(state.copyWith(currentQuestion: index));

    final mainQuestion =
        questions.firstWhere((element) => element.id == questions[index].id);
    final imagePath = mainQuestion.image;
    if (imagePath != null) {
      emit(state.copyWith(
          image: await getIt.get<InternalStorage>().readData(imagePath)));
    }else{
      state.image = null;
      emit(state);
    }

  }

  nextQuestion() {
    final q = state.examQuestion.questions;
    if (state.currentQuestion < q.length - 1) {
      if (q[state.currentQuestion].id != q[state.currentQuestion + 1].id) {
        changeToQuestion(state.currentQuestion + 1);
      } else {
        state.currentQuestion++;
        nextQuestion();
      }
    }
  }

  previousQuestion() {
    final q = state.examQuestion.questions;
    if (state.currentQuestion > 0) {
      if (q[state.currentQuestion].id != q[state.currentQuestion - 1].id) {
        changeToQuestion(state.currentQuestion - 1);
      } else {
        state.currentQuestion--;
        previousQuestion();
      }
    }
  }

  void showMessage(String msg, {TypeMsg typeMsg = TypeMsg.info}) {
    state.respondMsg.message = '';
    emit(state.copyWith(
        respondMsg: ResponseMessage(message: msg, typeMsg: typeMsg)));
  }

  selectedAnswerChanged() {
    emit(state.copyWith(chooseAnswer: !state.chooseAnswer));
  }
}
