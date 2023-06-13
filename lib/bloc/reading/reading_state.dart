part of 'reading_cubit.dart';

class ReadingState extends Equatable {
  ReadingState(
      {required this.localData, required this.remoteData, required this.respondMsg});

  ExamData localData;
  ExamData remoteData;
  ResponseMessage respondMsg;


  @override
  List<Object> get props => [localData, remoteData, respondMsg];

  ReadingState copyWith(
      {ExamData? localData, ExamData? remoteData, ResponseMessage? respondMsg}) {
    return ReadingState(
        localData: localData ?? this.localData,
        remoteData: remoteData ?? this.remoteData,
        respondMsg: respondMsg ?? this.respondMsg);
  }
}
