part of 'listening_test_cubit.dart';

class ListeningTestState extends Equatable {
  ListeningTestState({
    required this.examQuestion,
    this.isPlaying = false,
    this.duration = Duration.zero,
    this.position = Duration.zero,
    this.audio,
    this.image,
    this.currentQuestion = 0,
    required this.respondMsg,
  });

  final bool isPlaying;
  final Duration duration;
  final Duration position;
  final Uint8List? audio;
  final Uint8List? image;
  ExamQuestion examQuestion;
  int currentQuestion;
  ResponseMessage respondMsg;

  @override
  List<Object?> get props => [
        isPlaying,
        duration,
        position,
        audio,
        image,
        examQuestion,
        currentQuestion,
        respondMsg
      ];

  ListeningTestState copyWith({
    AudioPlayer? audioPlayer,
    ExamQuestion? examQuestion,
    bool? isPlaying,
    Duration? duration,
    Duration? position,
    Uint8List? audio,
    Uint8List? image,
    int? currentQuestion,
    ResponseMessage? respondMsg,
  }) {
    return ListeningTestState(
        examQuestion: examQuestion ?? this.examQuestion,
        isPlaying: isPlaying ?? this.isPlaying,
        duration: duration ?? this.duration,
        position: position ?? this.position,
        audio: audio ?? this.audio,
        image: image ?? this.image,
        currentQuestion: currentQuestion ?? this.currentQuestion,
        respondMsg: respondMsg ?? this.respondMsg);
  }
}
