part of 'speaking_cubit.dart';

class SpeakingState extends Equatable {
  SpeakingState(
      {required this.localData, required this.remoteData, required this.respondMsg});

  ExamData localData;
  ExamData remoteData;
  ResponseMessage respondMsg;


  @override
  List<Object> get props => [localData, remoteData, respondMsg];

  SpeakingState copyWith(
      {ExamData? localData, ExamData? remoteData, ResponseMessage? respondMsg}) {
    return SpeakingState(
        localData: localData ?? this.localData,
        remoteData: remoteData ?? this.remoteData,
        respondMsg: respondMsg ?? this.respondMsg);
  }
}
