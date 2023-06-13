part of 'reading_test_cubit.dart';

class ReadingTestState extends Equatable {
  ReadingTestState({
    required this.examQuestion,
    this.image,
    this.currentQuestion = 0,
    required this.respondMsg,
    this.chooseAnswer = false,
  });

  Uint8List? image;
  ExamQuestion examQuestion;
  int currentQuestion;
  ResponseMessage respondMsg;
  final bool chooseAnswer;

  @override
  List<Object?> get props => [
        image,
        examQuestion,
        currentQuestion,
        respondMsg,
        chooseAnswer
      ];

  ReadingTestState copyWith({
    ExamQuestion? examQuestion,
    Uint8List? image,
    int? currentQuestion,
    ResponseMessage? respondMsg,
    bool? chooseAnswer,
  }) {
    return ReadingTestState(
        examQuestion: examQuestion ?? this.examQuestion,
        image: image ?? this.image,
        currentQuestion: currentQuestion ?? this.currentQuestion,
        respondMsg: respondMsg ?? this.respondMsg,
        chooseAnswer: chooseAnswer ?? this.chooseAnswer);
  }
}
