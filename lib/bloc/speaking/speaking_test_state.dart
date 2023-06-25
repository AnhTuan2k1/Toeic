part of 'speaking_test_cubit.dart';

class SpeakingTestState extends Equatable {
  SpeakingTestState({
    required this.examQuestion,
    this.isPreparing = -1,
    this.image,
    this.process = 0,
    this.countdown = 0,
    this.currentQuestion = -1,
    this.stopTime = false,
    required this.respondMsg,
  });

  int isPreparing;
  Uint8List? image;
  ExamQuestion examQuestion;
  int process;
  int countdown;
  int currentQuestion;
  bool stopTime;
  ResponseMessage respondMsg;

  @override
  List<Object?> get props => [
        isPreparing,
        countdown,
        image,
        examQuestion,
        process,
        currentQuestion,
        stopTime,
        respondMsg
      ];

  SpeakingTestState copyWith({
    ExamQuestion? examQuestion,
    int? isPreparing,
    Uint8List? image,
    int? process,
    int? countdown,
    int? currentQuestion,
    bool? stopTime,
    ResponseMessage? respondMsg,
  }) {
    return SpeakingTestState(
        examQuestion: examQuestion ?? this.examQuestion,
        isPreparing: isPreparing ?? this.isPreparing,
        countdown: countdown ?? this.countdown,
        image: image ?? this.image,
        process: process ?? this.process,
        currentQuestion: currentQuestion ?? this.currentQuestion,
        stopTime: stopTime ?? this.stopTime,
        respondMsg: respondMsg ?? this.respondMsg);
  }
}
