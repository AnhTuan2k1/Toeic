part of 'writing_cubit.dart';

class WritingState extends Equatable {
  WritingState(
      {required this.localData, required this.remoteData, required this.respondMsg});

  ExamData localData;
  ExamData remoteData;
  ResponseMessage respondMsg;


  @override
  List<Object> get props => [localData, remoteData, respondMsg];

  WritingState copyWith(
      {ExamData? localData, ExamData? remoteData, ResponseMessage? respondMsg}) {
    return WritingState(
        localData: localData ?? this.localData,
        remoteData: remoteData ?? this.remoteData,
        respondMsg: respondMsg ?? this.respondMsg);
  }
}
