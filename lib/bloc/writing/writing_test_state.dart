part of 'writing_test_cubit.dart';

class WritingTestState extends Equatable {
  WritingTestState({
    required this.examQuestion,
    this.image,
    this.process = 0,
    this.countdown = 0,
    this.currentQuestion = 0,
    required this.respondMsg,
  });

  Uint8List? image;
  ExamQuestion examQuestion;
  int process;
  int countdown;
  int currentQuestion;
  ResponseMessage respondMsg;

  @override
  List<Object?> get props => [
        countdown,
        image,
        examQuestion,
        process,
        currentQuestion,
        respondMsg
      ];

  WritingTestState copyWith({
    ExamQuestion? examQuestion,
    Uint8List? image,
    int? process,
    int? countdown,
    int? currentQuestion,
    ResponseMessage? respondMsg,
  }) {
    return WritingTestState(
        examQuestion: examQuestion ?? this.examQuestion,
        countdown: countdown ?? this.countdown,
        image: image ?? this.image,
        process: process ?? this.process,
        currentQuestion: currentQuestion ?? this.currentQuestion,
        respondMsg: respondMsg ?? this.respondMsg);
  }
}
